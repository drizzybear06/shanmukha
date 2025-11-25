import { useLanguage } from '@/contexts/LanguageContext';
import { Button } from '@/components/ui/button';
import { Card } from '@/components/ui/card';
import { Sprout, FileText, LogIn, Shield } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import logo from '@/assets/shanmukha-logo.png';

const Home = () => {
  const { t } = useLanguage();
  const navigate = useNavigate();

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-secondary/20 to-accent/10">
      <div className="container mx-auto px-4 py-12">
        {/* Header */}
        <div className="text-center mb-12 animate-fade-in flex flex-col items-center">
          <img src={logo} alt="Shanmukha Agritech Logo" className="w-24 h-24 mb-4" />
          <h1 className="text-5xl md:text-6xl font-display font-bold text-gradient-primary mb-3">
            {t('appTitle')}
          </h1>
        </div>

        {/* Main Actions */}
        <div className="max-w-4xl mx-auto space-y-6 mb-12">
          <Card 
            className="p-8 hover:shadow-agricultural transition-all duration-300 cursor-pointer border-2 hover:border-primary"
            onClick={() => navigate('/crops')}
          >
            <div className="flex items-center gap-6">
              <div className="bg-primary/10 p-6 rounded-2xl">
                <Sprout className="w-12 h-12 text-primary" />
              </div>
              <div className="flex-1">
                <h2 className="text-3xl font-display font-bold mb-2">{t('startDiagnosis')}</h2>
                <p className="text-muted-foreground text-lg">
                  Get personalized crop treatment recommendations
                </p>
              </div>
            </div>
          </Card>

          <Card 
            className="p-8 hover:shadow-agricultural transition-all duration-300 cursor-pointer border-2 hover:border-accent"
            onClick={() => navigate('/about')}
          >
            <div className="flex items-center gap-6">
              <div className="bg-accent/10 p-6 rounded-2xl">
                <FileText className="w-12 h-12 text-accent" />
              </div>
              <div className="flex-1">
                <h2 className="text-3xl font-display font-bold mb-2">{t('aboutUs')}</h2>
                <p className="text-muted-foreground text-lg">
                  Learn more about Shanmukha Agro Industries
                </p>
              </div>
            </div>
          </Card>
        </div>

        {/* Login Options */}
        <div className="max-w-2xl mx-auto">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <Button
              variant="outline"
              size="lg"
              className="h-20 text-lg border-2"
              onClick={() => navigate('/login/manager')}
            >
              <LogIn className="mr-3 h-6 w-6" />
              {t('loginManager')}
            </Button>
            <Button
              variant="outline"
              size="lg"
              className="h-20 text-lg border-2"
              onClick={() => navigate('/login/admin')}
            >
              <Shield className="mr-3 h-6 w-6" />
              {t('loginAdmin')}
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Home;
