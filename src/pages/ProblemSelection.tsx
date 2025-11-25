import { useEffect, useState } from 'react';
import { useLanguage } from '@/contexts/LanguageContext';
import { useNavigate, useParams, useLocation } from 'react-router-dom';
import { supabase } from '@/integrations/supabase/client';
import { Card } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { ArrowLeft, Bug } from 'lucide-react';
import { Problem, Crop } from '@/types/app';
import { toast } from 'sonner';

const ProblemSelection = () => {
  const { language, t } = useLanguage();
  const navigate = useNavigate();
  const { cropId } = useParams<{ cropId: string }>();
  const location = useLocation();
  const crop = location.state?.crop as Crop;
  const [problems, setProblems] = useState<Problem[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchProblems = async () => {
      try {
        const { data, error } = await supabase
          .from('problems')
          .select('*')
          .eq('crop_id', cropId);

        if (error) throw error;
        setProblems(data || []);
      } catch (error) {
        console.error('Error fetching problems:', error);
        toast.error('Failed to load problems');
      } finally {
        setLoading(false);
      }
    };

    fetchProblems();
  }, [cropId]);

  const handleProblemSelect = (problem: Problem) => {
    navigate(`/products/${problem.id}`, { state: { crop, problem } });
  };

  const getProblemTitle = (problem: Problem) => {
    if (language === 'te') return problem.title_te;
    if (language === 'hi') return problem.title_hi;
    return problem.title_en;
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
          onClick={() => navigate('/crops')}
          className="mb-6"
        >
          <ArrowLeft className="mr-2 h-4 w-4" />
          {t('selectCrop')}
        </Button>

        <div className="text-center mb-8 animate-fade-in">
          <p className="text-lg text-muted-foreground mb-2">
            {t('crop')}: <span className="font-semibold text-foreground">{crop && getCropName(crop)}</span>
          </p>
          <h1 className="text-4xl md:text-5xl font-display font-bold text-gradient-primary">
            {t('selectProblem')}
          </h1>
        </div>

        {loading ? (
          <div className="text-center text-2xl text-muted-foreground">Loading...</div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-6xl mx-auto">
            {problems.map((problem) => (
              <Card
                key={problem.id}
                className="p-6 hover:shadow-agricultural transition-all duration-300 cursor-pointer border-2 hover:border-primary animate-fade-in"
                onClick={() => handleProblemSelect(problem)}
              >
                <div className="flex flex-col items-center gap-4">
                  <div className="bg-destructive/10 p-8 rounded-full">
                    <Bug className="w-16 h-16 text-destructive" />
                  </div>
                  <h3 className="text-xl font-display font-bold text-center">
                    {getProblemTitle(problem)}
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

export default ProblemSelection;
