import { useLanguage } from '@/contexts/LanguageContext';
import { useNavigate, useLocation } from 'react-router-dom';
import { Card } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Home, Download, Share2, FileCheck } from 'lucide-react';
import { TreatmentData } from '@/types/app';
import jsPDF from 'jspdf';
import { toast } from 'sonner';
import { supabase } from '@/integrations/supabase/client';
import { useEffect } from 'react';
import { HomeButton } from '@/components/HomeButton';

const TreatmentPlan = () => {
  const { language, t } = useLanguage();
  const navigate = useNavigate();
  const location = useLocation();
  
  // Redirect if no state is present
  useEffect(() => {
    if (!location.state) {
      navigate('/');
    }
  }, [location.state, navigate]);

  // Return early if no state to prevent destructuring error
  if (!location.state) {
    return null;
  }

  const { crop, problem, product, acres } = location.state as TreatmentData;

  const totalDosageMin = product.dosage_min * acres;
  const totalDosageMax = product.dosage_max * acres;

  // Calculate recommended pack size and number of packs with smart combination algorithm
  const calculatePackRecommendation = (totalDosage: number) => {
    console.log('Total dosage needed:', totalDosage, product.dosage_unit);
    
    // Parse pack sizes and convert to same unit as dosage
    const packSizesWithInfo = product.pack_sizes.map(size => {
      const numMatch = size.match(/(\d+(?:\.\d+)?)/);
      if (!numMatch) return null;
      
      const num = parseFloat(numMatch[1]);
      const sizeStr = size.toLowerCase();
      const unitStr = product.dosage_unit.toLowerCase();
      
      let convertedValue = num;
      
      // Determine the base unit from product.dosage_unit
      const isProductML = unitStr.includes('ml') || unitStr === 'milliliter' || unitStr === 'millilitre';
      const isProductL = !isProductML && (unitStr.includes('l') || unitStr === 'liter' || unitStr === 'litre');
      const isProductGM = unitStr.includes('gm') || unitStr.includes('g ') || unitStr === 'gram' || unitStr === 'grams';
      const isProductKG = unitStr.includes('kg') || unitStr === 'kilogram' || unitStr === 'kilograms';
      
      // Convert pack size to match product unit
      if (isProductML) {
        // Target unit is ml
        if (sizeStr.includes('ml')) {
          convertedValue = num; // already in ml
        } else if (sizeStr === `${num}l` || sizeStr.endsWith(' l') || sizeStr.endsWith('l ')) {
          convertedValue = num * 1000; // L to ml (1L = 1000ml)
        }
      } else if (isProductL) {
        // Target unit is L
        if (sizeStr.includes('ml')) {
          convertedValue = num / 1000; // ml to L
        } else {
          convertedValue = num; // already in L
        }
      } else if (isProductGM) {
        // Target unit is gm
        if (sizeStr.includes('gm') || sizeStr.includes('g ')) {
          convertedValue = num; // already in gm
        } else if (sizeStr.includes('kg')) {
          convertedValue = num * 1000; // kg to gm
        }
      } else if (isProductKG) {
        // Target unit is kg
        if (sizeStr.includes('gm') || sizeStr.includes('g ')) {
          convertedValue = num / 1000; // gm to kg
        } else if (sizeStr.includes('kg')) {
          convertedValue = num; // already in kg
        }
      }
      
      console.log(`Pack ${size}: converted to ${convertedValue} ${product.dosage_unit}`);
      return { original: size, value: convertedValue };
    }).filter(p => p !== null && p.value > 0).sort((a, b) => b.value - a.value); // Sort descending

    if (packSizesWithInfo.length === 0) return null;

    // Smart combination: Use greedy algorithm starting from largest packs
    let remaining = totalDosage;
    const combination: { pack: any; count: number }[] = [];
    
    // Start with largest packs and work down
    for (const pack of packSizesWithInfo) {
      if (remaining <= 0) break;
      
      const packsNeeded = Math.floor(remaining / pack.value);
      if (packsNeeded > 0) {
        combination.push({ pack, count: packsNeeded });
        remaining -= packsNeeded * pack.value;
      }
    }
    
    // If there's still remaining, add one smallest pack that can cover it
    if (remaining > 0) {
      // Find the smallest pack that's >= remaining
      let foundPack = false;
      for (let i = packSizesWithInfo.length - 1; i >= 0; i--) {
        if (packSizesWithInfo[i].value >= remaining) {
          const existing = combination.find(c => c.pack.original === packSizesWithInfo[i].original);
          if (existing) {
            existing.count++;
          } else {
            combination.push({ pack: packSizesWithInfo[i], count: 1 });
          }
          foundPack = true;
          remaining = 0;
          break;
        }
      }
      
      // If no single pack covers remaining, use smallest pack
      if (!foundPack && packSizesWithInfo.length > 0) {
        const smallestPack = packSizesWithInfo[packSizesWithInfo.length - 1];
        const existing = combination.find(c => c.pack.original === smallestPack.original);
        if (existing) {
          existing.count++;
        } else {
          combination.push({ pack: smallestPack, count: 1 });
        }
      }
    }

    const totalProvided = combination.reduce((sum, c) => sum + (c.pack.value * c.count), 0);
    const displayText = combination
      .map(c => `${c.count} pack${c.count > 1 ? 's' : ''} of ${c.pack.original}`)
      .join(' + ');

    console.log('Recommendation:', displayText, 'Total:', totalProvided);

    return {
      combination,
      totalProvided: totalProvided.toFixed(2),
      displayText
    };
  };

  const packRecommendation = calculatePackRecommendation(totalDosageMax || totalDosageMin);

  const getCropName = (crop: any) => {
    if (language === 'te') return crop.name_te;
    if (language === 'hi') return crop.name_hi;
    return crop.name_en;
  };

  const getProblemTitle = (problem: any) => {
    if (language === 'te') return problem.title_te;
    if (language === 'hi') return problem.title_hi;
    return problem.title_en;
  };

  const handleDownloadPDF = async () => {
    try {
      const doc = new jsPDF();
      
      // Header
      doc.setFontSize(24);
      doc.setTextColor(34, 139, 34);
      doc.text('Shanmukha Agritech', 105, 20, { align: 'center' });
      
      doc.setFontSize(16);
      doc.setTextColor(0, 0, 0);
      doc.text('Treatment Plan', 105, 30, { align: 'center' });
      
      // Content
      doc.setFontSize(12);
      let y = 50;
      
      // Add product image if available
      if (product.image_url) {
        try {
          const img = new Image();
          img.crossOrigin = 'anonymous';
          img.src = product.image_url;
          await new Promise((resolve, reject) => {
            img.onload = resolve;
            img.onerror = reject;
            setTimeout(reject, 3000);
          });
          doc.addImage(img, 'JPEG', 150, 40, 40, 40);
        } catch (e) {
          console.log('Could not load product image for PDF');
        }
      }
      
      doc.text(`Crop: ${getCropName(crop)}`, 20, y);
      y += 10;
      doc.text(`Problem: ${getProblemTitle(problem)}`, 20, y);
      y += 15;
      
      // Product with scientific formula
      doc.setFontSize(14);
      doc.setTextColor(34, 139, 34);
      doc.text('Product Information', 20, y);
      doc.setFontSize(12);
      doc.setTextColor(0, 0, 0);
      y += 10;
      
      const productDisplay = product.scientific_formula 
        ? `${product.name} (${product.scientific_formula})`
        : product.name;
      doc.text(`Product: ${productDisplay}`, 20, y);
      y += 10;
      
      if (product.mode_of_action) {
        const modeLines = doc.splitTextToSize(`Mode of Action: ${product.mode_of_action}`, 170);
        doc.text(modeLines, 20, y);
        y += modeLines.length * 6 + 5;
      }
      
      doc.text(`Number of Acres: ${acres}`, 20, y);
      y += 15;
      
      doc.setFontSize(14);
      doc.setTextColor(34, 139, 34);
      doc.text('Dosage Information', 20, y);
      doc.setFontSize(12);
      doc.setTextColor(0, 0, 0);
      y += 10;
      
      doc.text(`Dosage per Acre: ${product.dosage_recommendation}`, 20, y);
      y += 10;
      
      if (totalDosageMin === totalDosageMax) {
        doc.text(`Total Required: ${totalDosageMin.toFixed(2)} ${product.dosage_unit}`, 20, y);
      } else {
        doc.text(`Total Required: ${totalDosageMin.toFixed(2)} - ${totalDosageMax.toFixed(2)} ${product.dosage_unit}`, 20, y);
      }
      y += 15;
      
      if (product.pack_sizes) {
        doc.setFontSize(14);
        doc.setTextColor(34, 139, 34);
        doc.text('Pack Sizes Available', 20, y);
        doc.setFontSize(12);
        doc.setTextColor(0, 0, 0);
        y += 10;
        doc.text(product.pack_sizes.join(', '), 20, y);
        y += 10;
        
        if (packRecommendation) {
          doc.setTextColor(34, 139, 34);
          doc.text('Recommended:', 20, y);
          doc.setTextColor(0, 0, 0);
          y += 8;
          doc.text(packRecommendation.displayText, 20, y);
          y += 8;
          doc.text(`Total: ${packRecommendation.totalProvided} ${product.dosage_unit}`, 20, y);
        }
        y += 15;
      }
      
      if (product.spray_interval) {
        doc.setFontSize(14);
        doc.setTextColor(34, 139, 34);
        doc.text('Spray Interval', 20, y);
        doc.setFontSize(12);
        doc.setTextColor(0, 0, 0);
        y += 10;
        doc.text(product.spray_interval, 20, y);
        y += 15;
      }
      
      if (product.safety_notes) {
        doc.setFontSize(14);
        doc.setTextColor(220, 38, 38);
        doc.text('Safety Notes', 20, y);
        doc.setFontSize(12);
        doc.setTextColor(0, 0, 0);
        y += 10;
        const lines = doc.splitTextToSize(product.safety_notes, 170);
        doc.text(lines, 20, y);
      }
      
      // Footer
      doc.setFontSize(10);
      doc.setTextColor(128, 128, 128);
      doc.text('Powered by Shanmukha Agro Industries', 105, 280, { align: 'center' });
      
      doc.save(`treatment-plan-${crop.name_en}-${Date.now()}.pdf`);
      toast.success('PDF downloaded successfully!');
    } catch (error) {
      console.error('PDF generation error:', error);
      toast.error('Failed to generate PDF');
    }
  };

  const handleShareWhatsApp = () => {
    const packInfo = packRecommendation 
      ? `\n*Recommended:* ${packRecommendation.displayText}\n(Total: ${packRecommendation.totalProvided} ${product.dosage_unit})`
      : '';
    
    const message = `
*Shanmukha Agritech Treatment Plan*

Crop: ${getCropName(crop)}
Problem: ${getProblemTitle(problem)}
Product: ${product.name}
Acres: ${acres}

*Dosage per Acre:* ${product.dosage_recommendation}
*Total Required:* ${totalDosageMin === totalDosageMax 
      ? `${totalDosageMin.toFixed(2)} ${product.dosage_unit}` 
      : `${totalDosageMin.toFixed(2)} - ${totalDosageMax.toFixed(2)} ${product.dosage_unit}`}

*Pack Sizes:* ${product.pack_sizes.join(', ')}${packInfo}
${product.spray_interval ? `*Spray Interval:* ${product.spray_interval}` : ''}
${product.safety_notes ? `*Safety:* ${product.safety_notes}` : ''}

_Powered by Shanmukha Agritech_
    `.trim();

    const encodedMessage = encodeURIComponent(message);
    window.open(`https://wa.me/?text=${encodedMessage}`, '_blank');
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-secondary/20 to-accent/10">
      <HomeButton />
      <div className="container mx-auto px-4 py-8 pt-16">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-8 animate-fade-in">
            <FileCheck className="w-20 h-20 text-primary mx-auto mb-4" />
            <h1 className="text-4xl md:text-5xl font-display font-bold text-gradient-primary">
              {t('treatmentPlan')}
            </h1>
          </div>

          <Card className="p-8 shadow-agricultural mb-6 animate-fade-in">
            <div className="space-y-6">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <h3 className="text-sm font-semibold text-muted-foreground mb-1">
                    {t('crop')}
                  </h3>
                  <p className="text-2xl font-display font-bold">{getCropName(crop)}</p>
                </div>
                <div>
                  <h3 className="text-sm font-semibold text-muted-foreground mb-1">
                    {t('problem')}
                  </h3>
                  <p className="text-2xl font-display font-bold">{getProblemTitle(problem)}</p>
                </div>
              </div>

              <div className="border-t pt-6">
                <h3 className="text-sm font-semibold text-muted-foreground mb-1">
                  {t('product')}
                </h3>
                <div className="flex flex-col md:flex-row gap-6 items-start">
                  {product.image_url && (
                    <img 
                      src={product.image_url} 
                      alt={product.name}
                      className="w-32 h-32 object-contain rounded-lg border bg-white"
                    />
                  )}
                  <div>
                    <p className="text-3xl font-display font-bold text-primary mb-1">
                      {product.name}
                    </p>
                    {product.scientific_formula && (
                      <p className="text-lg text-muted-foreground mb-4">
                        ({product.scientific_formula})
                      </p>
                    )}
                  </div>
                </div>
                
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4">
                  <div className="bg-secondary/50 p-4 rounded-lg">
                    <p className="text-sm font-semibold text-muted-foreground mb-1">
                      {t('acres')}
                    </p>
                    <p className="text-2xl font-bold">{acres}</p>
                  </div>
                  <div className="bg-secondary/50 p-4 rounded-lg">
                    <p className="text-sm font-semibold text-muted-foreground mb-1">
                      {t('dosagePerAcre')}
                    </p>
                    <p className="text-2xl font-bold">{product.dosage_recommendation}</p>
                  </div>
                </div>

                <div className="bg-accent/10 p-6 rounded-lg mt-4 border-2 border-accent">
                  <p className="text-sm font-semibold text-muted-foreground mb-2">
                    {t('totalDosage')}
                  </p>
                  <p className="text-3xl font-display font-bold text-accent">
                    {totalDosageMin === totalDosageMax
                      ? `${totalDosageMin.toFixed(2)} ${product.dosage_unit}`
                      : `${totalDosageMin.toFixed(2)} - ${totalDosageMax.toFixed(2)} ${product.dosage_unit}`}
                  </p>
                </div>

                {packRecommendation && (
                  <div className="bg-primary/10 p-6 rounded-lg mt-4 border-2 border-primary">
                    <p className="text-sm font-semibold text-muted-foreground mb-2">
                      {t('recommendedPack')}
                    </p>
                    <p className="text-xl font-display font-bold text-primary mb-3">
                      {packRecommendation.displayText}
                    </p>
                    <p className="text-sm text-muted-foreground">
                      Total: {packRecommendation.totalProvided} {product.dosage_unit}
                    </p>
                  </div>
                )}

                <div className="mt-4 space-y-3">
                  <div>
                    <p className="text-sm font-semibold text-muted-foreground mb-1">
                      {t('packSizes')}
                    </p>
                    <p className="text-lg">{product.pack_sizes.join(', ')}</p>
                  </div>

                  {product.spray_interval && (
                    <div>
                      <p className="text-sm font-semibold text-muted-foreground mb-1">
                        {t('sprayInterval')}
                      </p>
                      <p className="text-lg">{product.spray_interval}</p>
                    </div>
                  )}

                  {product.safety_notes && (
                    <div className="bg-destructive/10 p-4 rounded-lg border border-destructive/20">
                      <p className="text-sm font-semibold text-destructive mb-1">
                        {t('safetyNotes')}
                      </p>
                      <p className="text-sm">{product.safety_notes}</p>
                    </div>
                  )}
                </div>
              </div>
            </div>
          </Card>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <Button
              onClick={handleDownloadPDF}
              size="lg"
              className="h-16"
            >
              <Download className="mr-2 h-5 w-5" />
              {t('downloadPDF')}
            </Button>
            <Button
              onClick={handleShareWhatsApp}
              size="lg"
              variant="outline"
              className="h-16"
            >
              <Share2 className="mr-2 h-5 w-5" />
              {t('shareWhatsApp')}
            </Button>
            <Button
              onClick={() => navigate('/')}
              size="lg"
              variant="outline"
              className="h-16"
            >
              <Home className="mr-2 h-5 w-5" />
              {t('backToHome')}
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default TreatmentPlan;
