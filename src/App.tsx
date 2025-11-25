import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { LanguageProvider } from "./contexts/LanguageContext";
import { AuthProvider } from "./contexts/AuthContext";
import { LanguageSelector } from "./components/LanguageSelector";
import { ProtectedRoute } from "./components/ProtectedRoute";
import { useState } from "react";
import Home from "./pages/Home";
import About from "./pages/About";
import CropSelection from "./pages/CropSelection";
import ProblemSelection from "./pages/ProblemSelection";
import ProductRecommendation from "./pages/ProductRecommendation";
import TreatmentPlan from "./pages/TreatmentPlan";
import Login from "./pages/Login";
import AdminDashboard from "./pages/AdminDashboard";
import ManagerDashboard from "./pages/ManagerDashboard";
import NotFound from "./pages/NotFound";

const queryClient = new QueryClient();

const App = () => {
  const [languageSelected, setLanguageSelected] = useState(false);

  return (
    <QueryClientProvider client={queryClient}>
      <TooltipProvider>
        <LanguageProvider>
          <AuthProvider>
            <Toaster />
            <Sonner />
            <BrowserRouter>
              {!languageSelected ? (
                <LanguageSelector onLanguageSelected={() => setLanguageSelected(true)} />
              ) : (
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/about" element={<About />} />
                  <Route path="/crops" element={<CropSelection />} />
                  <Route path="/problems/:cropId" element={<ProblemSelection />} />
                  <Route path="/products/:problemId" element={<ProductRecommendation />} />
                  <Route path="/treatment-plan" element={<TreatmentPlan />} />
                  <Route path="/login/:role" element={<Login />} />
                  <Route
                    path="/admin/dashboard"
                    element={
                      <ProtectedRoute requiredRole="admin">
                        <AdminDashboard />
                      </ProtectedRoute>
                    }
                  />
                  <Route
                    path="/manager/dashboard"
                    element={
                      <ProtectedRoute requiredRole="manager">
                        <ManagerDashboard />
                      </ProtectedRoute>
                    }
                  />
                  {/* ADD ALL CUSTOM ROUTES ABOVE THE CATCH-ALL "*" ROUTE */}
                  <Route path="*" element={<NotFound />} />
                </Routes>
              )}
            </BrowserRouter>
          </AuthProvider>
        </LanguageProvider>
      </TooltipProvider>
    </QueryClientProvider>
  );
};

export default App;
