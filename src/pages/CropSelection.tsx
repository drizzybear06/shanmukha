import { useEffect, useState } from 'react';
import { useLanguage } from '@/contexts/LanguageContext';
import { useNavigate } from 'react-router-dom';
import { supabase } from '@/integrations/supabase/client';
import { Card } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { ArrowLeft, Leaf } from 'lucide-react';
import { Crop } from '@/types/app';
import { toast } from 'sonner';

const CropSelection = () => {
  const { language, t } = useLanguage();
  const navigate = useNavigate();
  const [crops, setCrops] = useState<Crop[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchCrops = async () => {
      try {
        const { data, error } = await supabase
          .from('crops')
          .select('*');

        if (error) throw error;
        setCrops(data || []);
      } catch (error) {
        console.error('Error fetching crops:', error);
        toast.error('Failed to load crops');
      } finally {
        setLoading(false);
      }
    };

    fetchCrops();
  }, []);

  const handleCropSelect = (crop: Crop) => {
    navigate(`/problems/${crop.id}`, { state: { crop } });
  };

  const getCropName = (crop: Crop) => {
    if (language === 'te') return crop.name_te;
    if (language === 'hi') return crop.name_hi;
    return crop.name_en;
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-secondary/20 to-accent/10">
      <div className="container mx-auto px-4 py-8">
        <Button
          variant="outline"
          onClick={() => navigate('/')}
          className="mb-6"
        >
          <ArrowLeft className="mr-2 h-4 w-4" />
          {t('backToHome')}
        </Button>

        <div className="text-center mb-8 animate-fade-in">
          <h1 className="text-4xl md:text-5xl font-display font-bold text-gradient-primary mb-2">
            {t('selectCrop')}
          </h1>
        </div>

        {loading ? (
          <div className="text-center text-2xl text-muted-foreground">Loading...</div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-6xl mx-auto">
            {crops.map((crop) => (
              <Card
                key={crop.id}
                className="p-6 hover:shadow-agricultural transition-all duration-300 cursor-pointer border-2 hover:border-primary animate-fade-in"
                onClick={() => handleCropSelect(crop)}
              >
                <div className="flex flex-col items-center gap-4">
                  <div className="bg-primary/10 p-8 rounded-full">
                    <Leaf className="w-16 h-16 text-primary" />
                  </div>
                  <h3 className="text-2xl font-display font-bold text-center">
                    {getCropName(crop)}
                  </h3>
                </div>
              </Card>
            ))}
          </div>
        )}
      </div>
    </div>
  );
};

export default CropSelection;
