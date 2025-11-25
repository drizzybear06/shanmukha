import { useLanguage } from '@/contexts/LanguageContext';
import { Button } from './ui/button';
import { Card } from './ui/card';
import { Globe, Languages } from 'lucide-react';

interface LanguageSelectorProps {
  onLanguageSelected?: () => void;
}

export const LanguageSelector = ({ onLanguageSelected }: LanguageSelectorProps) => {
  const { setLanguage, t } = useLanguage();

  const handleLanguageSelect = (code: 'en' | 'te' | 'hi') => {
    setLanguage(code);
    if (onLanguageSelected) {
      onLanguageSelected();
    }
  };

  const languages = [
    { code: 'en' as const, name: 'English', flag: '🇬🇧' },
    { code: 'te' as const, name: 'తెలుగు', flag: '🇮🇳' },
    { code: 'hi' as const, name: 'हिंदी', flag: '🇮🇳' },
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-secondary/20 to-accent/10 flex items-center justify-center p-4">
      <Card className="w-full max-w-2xl p-8 md:p-12 shadow-agricultural animate-fade-in">
        <div className="flex flex-col items-center gap-8">
          <div className="relative">
            <Globe className="w-20 h-20 text-primary animate-pulse" />
            <Languages className="w-10 h-10 text-accent absolute -bottom-2 -right-2" />
          </div>
          
          <div className="text-center space-y-2">
            <h1 className="text-4xl md:text-5xl font-display font-bold text-gradient-primary">
              {t('appTitle')}
            </h1>
            <p className="text-xl text-muted-foreground">{t('selectLanguage')}</p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4 w-full">
            {languages.map((lang) => (
              <Button
                key={lang.code}
                onClick={() => handleLanguageSelect(lang.code)}
                variant="outline"
                className="h-32 flex flex-col items-center justify-center gap-3 text-lg hover:bg-primary hover:text-primary-foreground hover:scale-105 transition-all duration-300 border-2"
              >
                <span className="text-4xl">{lang.flag}</span>
                <span className="font-semibold">{lang.name}</span>
              </Button>
            ))}
          </div>
        </div>
      </Card>
    </div>
  );
};
