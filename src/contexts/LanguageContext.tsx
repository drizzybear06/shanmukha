import React, { createContext, useContext, useState } from 'react';

type Language = 'en' | 'te' | 'hi';

interface LanguageContextType {
  language: Language;
  setLanguage: (lang: Language) => void;
  t: (key: string) => string;
}

const translations = {
  en: {
    appTitle: 'KisanSethu',
    appSubtitle: 'Kisan Sahayak',
    selectLanguage: 'Select Language',
    english: 'English',
    telugu: 'తెలుగు',
    hindi: 'हिंदी',
    startDiagnosis: 'Start Diagnosis',
    aboutUs: 'About Shanmukha Agro',
    loginManager: 'Login as Manager',
    loginAdmin: 'Login as Admin',
    selectCrop: 'Select Your Crop',
    selectProblem: 'Select Problem',
    recommendedProducts: 'Recommended Products',
    enterAcres: 'Enter Number of Acres',
    generatePlan: 'Generate Treatment Plan',
    treatmentPlan: 'Treatment Plan',
    crop: 'Crop',
    problem: 'Problem',
    product: 'Product',
    acres: 'Acres',
    dosagePerAcre: 'Dosage per Acre',
    totalDosage: 'Total Required Dosage',
    packSizes: 'Pack Sizes Available',
    sprayInterval: 'Spray Interval',
    safetyNotes: 'Safety Notes',
    downloadPDF: 'Download PDF',
    shareWhatsApp: 'Share on WhatsApp',
    backToHome: 'Back to Home',
    select: 'Select',
  },
  te: {
    appTitle: 'కిసాన్‌సేతు',
    appSubtitle: 'రైతు సహాయం',
    selectLanguage: 'భాషను ఎంచుకోండి',
    english: 'English',
    telugu: 'తెలుగు',
    hindi: 'हिंदी',
    startDiagnosis: 'రోగ నిర్ధారణ ప్రారంభించండి',
    aboutUs: 'షణ్ముఖ అగ్రో గురించి',
    loginManager: 'మేనేజర్‌గా లాగిన్',
    loginAdmin: 'అడ్మిన్‌గా లాగిన్',
    selectCrop: 'మీ పంటను ఎంచుకోండి',
    selectProblem: 'సమస్యను ఎంచుకోండి',
    recommendedProducts: 'సిఫార్సు చేయబడిన ఉత్పత్తులు',
    enterAcres: 'ఎకరాల సంఖ్యను నమోదు చేయండి',
    generatePlan: 'చికిత్స ప్రణాళిక రూపొందించండి',
    treatmentPlan: 'చికిత్స ప్రణాళిక',
    crop: 'పంట',
    problem: 'సమస్య',
    product: 'ఉత్పత్తి',
    acres: 'ఎకరాలు',
    dosagePerAcre: 'ఎకరానికి మోతాదు',
    totalDosage: 'మొత్తం అవసరమైన మోతాదు',
    packSizes: 'అందుబాటులో ఉన్న ప్యాక్ పరిమాణాలు',
    sprayInterval: 'స్ప్రే విరామం',
    safetyNotes: 'భద్రతా గమనికలు',
    downloadPDF: 'PDF డౌన్‌లోడ్',
    shareWhatsApp: 'వాట్సాప్‌లో షేర్ చేయండి',
    backToHome: 'హోమ్‌కు తిరిగి వెళ్లండి',
    select: 'ఎంచుకోండి',
  },
  hi: {
    appTitle: 'किसानसेतु',
    appSubtitle: 'किसान सहायक',
    selectLanguage: 'भाषा चुनें',
    english: 'English',
    telugu: 'తెలుగు',
    hindi: 'हिंदी',
    startDiagnosis: 'निदान शुरू करें',
    aboutUs: 'शनमुख एग्रो के बारे में',
    loginManager: 'प्रबंधक के रूप में लॉगिन',
    loginAdmin: 'व्यवस्थापक के रूप में लॉगिन',
    selectCrop: 'अपनी फसल चुनें',
    selectProblem: 'समस्या चुनें',
    recommendedProducts: 'अनुशंसित उत्पाद',
    enterAcres: 'एकड़ की संख्या दर्ज करें',
    generatePlan: 'उपचार योजना बनाएं',
    treatmentPlan: 'उपचार योजना',
    crop: 'फसल',
    problem: 'समस्या',
    product: 'उत्पाद',
    acres: 'एकड़',
    dosagePerAcre: 'प्रति एकड़ खुराक',
    totalDosage: 'कुल आवश्यक खुराक',
    packSizes: 'उपलब्ध पैक आकार',
    sprayInterval: 'स्प्रे अंतराल',
    safetyNotes: 'सुरक्षा नोट्स',
    downloadPDF: 'PDF डाउनलोड करें',
    shareWhatsApp: 'व्हाट्सएप पर शेयर करें',
    backToHome: 'होम पर वापस',
    select: 'चुनें',
  },
};

const LanguageContext = createContext<LanguageContextType | undefined>(undefined);

export const LanguageProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [language, setLanguage] = useState<Language>('en');

  const t = (key: string): string => {
    return translations[language][key as keyof typeof translations.en] || key;
  };

  return (
    <LanguageContext.Provider value={{ language, setLanguage, t }}>
      {children}
    </LanguageContext.Provider>
  );
};

export const useLanguage = () => {
  const context = useContext(LanguageContext);
  if (!context) {
    throw new Error('useLanguage must be used within LanguageProvider');
  }
  return context;
};
