import { useState } from 'react';
import { useAuth } from '@/contexts/AuthContext';
import { useNavigate } from 'react-router-dom';
import { Button } from '@/components/ui/button';
import { Card } from '@/components/ui/card';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import { LogOut, LogIn, PlusCircle, BarChart3, FileText } from 'lucide-react';
import { ManagerSubmissions } from '@/components/manager/ManagerSubmissions';
import { AnalyticsDashboard } from '@/components/admin/AnalyticsDashboard';
import { ProposalForm } from '@/components/manager/ProposalForm';

const ManagerDashboard = () => {
  const { user, logout } = useAuth();
  const navigate = useNavigate();
  const [activeTab, setActiveTab] = useState('submissions');

  const handleLogout = () => {
    logout();
    navigate('/');
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-secondary/20 to-accent/10">
      <div className="container mx-auto px-4 py-8">
        <Card className="p-6 mb-6 shadow-agricultural">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4">
              <div className="bg-accent/10 p-4 rounded-full">
                <LogIn className="w-8 h-8 text-accent" />
              </div>
              <div>
                <h1 className="text-3xl font-display font-bold text-gradient-primary">
                  Manager Dashboard
                </h1>
                <p className="text-muted-foreground">Welcome, {user?.username}</p>
              </div>
            </div>
            <Button onClick={handleLogout} variant="outline">
              <LogOut className="mr-2 h-4 w-4" />
              Logout
            </Button>
          </div>
        </Card>

        <Tabs value={activeTab} onValueChange={setActiveTab}>
          <TabsList className="grid w-full grid-cols-3 mb-6">
            <TabsTrigger value="submissions" className="flex items-center gap-2">
              <FileText className="h-4 w-4" />
              My Submissions
            </TabsTrigger>
            <TabsTrigger value="propose" className="flex items-center gap-2">
              <PlusCircle className="h-4 w-4" />
              New Proposal
            </TabsTrigger>
            <TabsTrigger value="analytics" className="flex items-center gap-2">
              <BarChart3 className="h-4 w-4" />
              Analytics
            </TabsTrigger>
          </TabsList>

          <TabsContent value="submissions">
            <ManagerSubmissions />
          </TabsContent>

          <TabsContent value="propose">
            <ProposalForm />
          </TabsContent>

          <TabsContent value="analytics">
            <AnalyticsDashboard />
          </TabsContent>
        </Tabs>
      </div>
    </div>
  );
};

export default ManagerDashboard;
