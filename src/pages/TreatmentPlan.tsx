import { useLanguage } from '@/contexts/LanguageContext';
import { useNavigate, useLocation } from 'react-router-dom';
import { Card } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Home, Download, Share2, FileCheck } from 'lucide-react';
import { TreatmentData } from '@/types/app';
import jsPDF from 'jspdf';
import { toast } from 'sonner';

const TreatmentPlan = () => {
  const { language, t } = useLanguage();
  const navigate = useNavigate();
  const location = useLocation();
  const { crop, problem, product, acres } = location.state as TreatmentData;

  const totalDosageMin = product.dosage_min * acres;
  const totalDosageMax = product.dosage_max * acres;

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

  const handleDownloadPDF = () => {
    try {
      const doc = new jsPDF();
      
      // Header
      doc.setFontSize(24);
      doc.setTextColor(34, 139, 34);
      doc.text('KisanSethu', 105, 20, { align: 'center' });
      
      doc.setFontSize(16);
      doc.setTextColor(0, 0, 0);
      doc.text('Treatment Plan', 105, 30, { align: 'center' });
      
      // Content
      doc.setFontSize(12);
      let y = 50;
      
      doc.text(`Crop: ${getCropName(crop)}`, 20, y);
      y += 10;
      doc.text(`Problem: ${getProblemTitle(problem)}`, 20, y);
      y += 10;
      doc.text(`Product: ${product.name}`, 20, y);
      y += 10;
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
      
      doc.setFontSize(14);
      doc.setTextColor(34, 139, 34);
      doc.text('Pack Sizes Available', 20, y);
      doc.setFontSize(12);
      doc.setTextColor(0, 0, 0);
      y += 10;
      doc.text(product.pack_sizes.join(', '), 20, y);
      y += 15;
      
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
    const message = `
*KisanSethu Treatment Plan*

Crop: ${getCropName(crop)}
Problem: ${getProblemTitle(problem)}
Product: ${product.name}
Acres: ${acres}

*Dosage per Acre:* ${product.dosage_recommendation}
*Total Required:* ${totalDosageMin === totalDosageMax 
      ? `${totalDosageMin.toFixed(2)} ${product.dosage_unit}` 
      : `${totalDosageMin.toFixed(2)} - ${totalDosageMax.toFixed(2)} ${product.dosage_unit}`}

*Pack Sizes:* ${product.pack_sizes.join(', ')}
${product.spray_interval ? `*Spray Interval:* ${product.spray_interval}` : ''}
${product.safety_notes ? `*Safety:* ${product.safety_notes}` : ''}

_Powered by Shanmukha Agro Industries_
    `.trim();

    const encodedMessage = encodeURIComponent(message);
    window.open(`https://wa.me/?text=${encodedMessage}`, '_blank');
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-secondary/20 to-accent/10">
      <div className="container mx-auto px-4 py-8">
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
                <p className="text-3xl font-display font-bold text-primary mb-4">
                  {product.name}
                </p>
                
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
