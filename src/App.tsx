import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { LanguageProvider } from "./contexts/LanguageContext";
import { LanguageSelector } from "./components/LanguageSelector";
import { useState } from "react";
import Home from "./pages/Home";
import CropSelection from "./pages/CropSelection";
import ProblemSelection from "./pages/ProblemSelection";
import ProductRecommendation from "./pages/ProductRecommendation";
import TreatmentPlan from "./pages/TreatmentPlan";
import NotFound from "./pages/NotFound";

const queryClient = new QueryClient();

const App = () => {
  const [languageSelected, setLanguageSelected] = useState(false);

  return (
    <QueryClientProvider client={queryClient}>
      <TooltipProvider>
        <LanguageProvider>
          <Toaster />
          <Sonner />
          <BrowserRouter>
            {!languageSelected ? (
              <LanguageSelector onLanguageSelected={() => setLanguageSelected(true)} />
            ) : (
              <Routes>
                <Route path="/" element={<Home />} />
                <Route path="/crops" element={<CropSelection />} />
                <Route path="/problems/:cropId" element={<ProblemSelection />} />
                <Route path="/products/:problemId" element={<ProductRecommendation />} />
                <Route path="/treatment-plan" element={<TreatmentPlan />} />
                {/* ADD ALL CUSTOM ROUTES ABOVE THE CATCH-ALL "*" ROUTE */}
                <Route path="*" element={<NotFound />} />
              </Routes>
            )}
          </BrowserRouter>
        </LanguageProvider>
      </TooltipProvider>
    </QueryClientProvider>
  );
};

export default App;
