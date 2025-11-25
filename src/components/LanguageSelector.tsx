import { useLanguage } from '@/contexts/LanguageContext';
import { Button } from './ui/button';
import { Card } from './ui/card';

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
          <div className="relative w-24 h-24">
            <svg viewBox="0 0 100 100" className="w-full h-full">
              {/* Central stem */}
              <line x1="50" y1="50" x2="50" y2="85" stroke="currentColor" strokeWidth="3" className="text-primary" />
              
              {/* Top leaf */}
              <ellipse cx="50" cy="25" rx="8" ry="12" fill="currentColor" className="text-primary" />
              
              {/* Top-left leaf */}
              <ellipse cx="30" cy="35" rx="12" ry="8" fill="currentColor" className="text-accent" transform="rotate(-45 30 35)" />
              
              {/* Top-right leaf */}
              <ellipse cx="70" cy="35" rx="12" ry="8" fill="currentColor" className="text-accent" transform="rotate(45 70 35)" />
              
              {/* Bottom-left leaf */}
              <ellipse cx="30" cy="55" rx="12" ry="8" fill="currentColor" className="text-secondary" transform="rotate(-30 30 55)" />
              
              {/* Bottom-right leaf */}
              <ellipse cx="70" cy="55" rx="12" ry="8" fill="currentColor" className="text-secondary" transform="rotate(30 70 55)" />
            </svg>
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
