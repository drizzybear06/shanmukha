import { useEffect, useState } from 'react';
import { useLanguage } from '@/contexts/LanguageContext';
import { useNavigate, useParams, useLocation } from 'react-router-dom';
import { supabase } from '@/integrations/supabase/client';
import { Card } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { ArrowLeft, Package, Calculator } from 'lucide-react';
import { Product, Problem, Crop } from '@/types/app';
import { toast } from 'sonner';
import { HomeButton } from '@/components/HomeButton';
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
} from '@/components/ui/dialog';

const ProductRecommendation = () => {
  const { language, t } = useLanguage();
  const navigate = useNavigate();
  const { problemId } = useParams<{ problemId: string }>();
  const location = useLocation();
  const crop = location.state?.crop as Crop;
  const problem = location.state?.problem as Problem;
  const [products, setProducts] = useState<Product[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedProduct, setSelectedProduct] = useState<Product | null>(null);
  const [acres, setAcres] = useState('');
  const [showAcresDialog, setShowAcresDialog] = useState(false);

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        const { data, error } = await supabase
          .from('products')
          .select('*')
          .eq('crop_id', crop?.id)
          .eq('problem_id', problemId);

        if (error) throw error;
        setProducts(data || []);
      } catch (error) {
        console.error('Error fetching products:', error);
        toast.error('Failed to load products');
      } finally {
        setLoading(false);
      }
    };

    if (crop?.id && problemId) {
      fetchProducts();
    }
  }, [problemId, crop?.id]);

  const handleProductSelect = (product: Product) => {
    setSelectedProduct(product);
    setShowAcresDialog(true);
  };

  const handleGeneratePlan = async () => {
    if (!acres || parseFloat(acres) <= 0) {
      toast.error('Please enter a valid number of acres');
      return;
    }

    // Log analytics
    try {
      await supabase.from('analytics').insert({
        crop_id: crop.id,
        problem_id: problem.id,
        product_id: selectedProduct!.id,
        acres: parseFloat(acres),
        language: language,
      });
    } catch (error) {
      console.error('Analytics error:', error);
    }

    navigate('/treatment-plan', {
      state: {
        crop,
        problem,
        product: selectedProduct,
        acres: parseFloat(acres),
      },
    });
  };

  const getCropName = (crop: Crop) => {
    if (language === 'te') return crop.name_te;
    if (language === 'hi') return crop.name_hi;
    return crop.name_en;
  };

  const getProblemTitle = (problem: Problem) => {
    if (language === 'te') return problem.title_te;
    if (language === 'hi') return problem.title_hi;
    return problem.title_en;
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-secondary/20 to-accent/10">
      <HomeButton />
      <div className="container mx-auto px-4 py-8 pt-16">
        <Button
          variant="outline"
          onClick={() => navigate(-1)}
          className="mb-6 ml-20"
        >
          <ArrowLeft className="mr-2 h-4 w-4" />
          {t('selectProblem')}
        </Button>

        <div className="text-center mb-8 animate-fade-in">
          <p className="text-lg text-muted-foreground mb-1">
            {t('crop')}: <span className="font-semibold text-foreground">{crop && getCropName(crop)}</span>
          </p>
          <p className="text-lg text-muted-foreground mb-3">
            {t('problem')}: <span className="font-semibold text-foreground">{problem && getProblemTitle(problem)}</span>
          </p>
          <h1 className="text-4xl md:text-5xl font-display font-bold text-gradient-primary">
            {t('recommendedProducts')}
          </h1>
        </div>

        {loading ? (
          <div className="text-center text-2xl text-muted-foreground">Loading...</div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-7xl mx-auto">
            {products.map((product) => (
              <Card
                key={product.id}
                className="p-6 hover:shadow-agricultural transition-all duration-300 border-2 animate-fade-in"
              >
                <div className="flex flex-col gap-4">
                  {product.image_url ? (
                    <img src={product.image_url} alt={product.name} className="w-full h-40 object-cover rounded-2xl" />
                  ) : (
                    <div className="bg-accent/10 p-6 rounded-2xl flex items-center justify-center">
                      <Package className="w-12 h-12 text-accent" />
                    </div>
                  )}
                  
                  <h3 className="text-2xl font-display font-bold">
                    {product.name}
                    {product.scientific_formula && (
                      <span className="text-sm font-normal text-muted-foreground block">
                        ({product.scientific_formula})
                      </span>
                    )}
                  </h3>
                  
                  <div className="space-y-2 text-sm">
                    {product.mode_of_action && (
                      <p>
                        <span className="font-semibold">{t('modeOfAction')}:</span>{' '}
                        {product.mode_of_action}
                      </p>
                    )}
                    <p>
                      <span className="font-semibold">{t('dosagePerAcre')}:</span>{' '}
                      {product.dosage_recommendation}
                    </p>
                    <p>
                      <span className="font-semibold">{t('packSizes')}:</span>{' '}
                      {product.pack_sizes.join(', ')}
                    </p>
                    {product.spray_interval && (
                      <p>
                        <span className="font-semibold">{t('sprayInterval')}:</span>{' '}
                        {product.spray_interval}
                      </p>
                    )}
                    {product.safety_notes && (
                      <p className="text-destructive">
                        <span className="font-semibold">{t('safetyNotes')}:</span>{' '}
                        {product.safety_notes}
                      </p>
                    )}
                  </div>

                  <Button
                    onClick={() => handleProductSelect(product)}
                    className="w-full mt-2"
                  >
                    {t('select')}
                  </Button>
                </div>
              </Card>
            ))}
          </div>
        )}
      </div>

      <Dialog open={showAcresDialog} onOpenChange={setShowAcresDialog}>
        <DialogContent>
          <DialogHeader>
            <DialogTitle className="flex items-center gap-2">
              <Calculator className="w-6 h-6 text-primary" />
              {t('enterAcres')}
            </DialogTitle>
            <DialogDescription>
              {selectedProduct && (
                <span className="block mt-2 text-foreground font-semibold">
                  {selectedProduct.name}
                </span>
              )}
            </DialogDescription>
          </DialogHeader>
          <div className="space-y-4 mt-4">
            <Input
              type="number"
              step="0.1"
              min="0"
              placeholder={t('enterAcres')}
              value={acres}
              onChange={(e) => setAcres(e.target.value)}
              className="text-lg"
            />
            <Button
              onClick={handleGeneratePlan}
              className="w-full"
              size="lg"
            >
              {t('generatePlan')}
            </Button>
          </div>
        </DialogContent>
      </Dialog>
    </div>
  );
};

export default ProductRecommendation;
