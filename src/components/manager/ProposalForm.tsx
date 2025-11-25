import { useState, useEffect } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { useAuth } from '@/contexts/AuthContext';
import { Card } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Textarea } from '@/components/ui/textarea';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import { toast } from 'sonner';

export const ProposalForm = () => {
  const { user } = useAuth();
  const [crops, setCrops] = useState<any[]>([]);
  const [problems, setProblems] = useState<any[]>([]);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    const [cropsRes, problemsRes] = await Promise.all([
      supabase.from('crops').select('*'),
      supabase.from('problems').select('*'),
    ]);
    setCrops(cropsRes.data || []);
    setProblems(problemsRes.data || []);
  };

  const handleCropSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const formData = new FormData(e.currentTarget);
    
    try {
      await supabase.from('submissions').insert([{
        manager_id: user?.id,
        type: 'crop',
        payload_json: {
          name_en: formData.get('name_en') as string,
          name_te: formData.get('name_te') as string,
          name_hi: formData.get('name_hi') as string,
        },
      }]);
      
      toast.success('Crop proposal submitted!');
      e.currentTarget.reset();
    } catch (error) {
      toast.error('Failed to submit');
    }
  };

  const handleProblemSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const formData = new FormData(e.currentTarget);
    
    try {
      await supabase.from('submissions').insert([{
        manager_id: user?.id,
        type: 'problem',
        payload_json: {
          crop_id: formData.get('crop_id') as string,
          title_en: formData.get('title_en') as string,
          title_te: formData.get('title_te') as string,
          title_hi: formData.get('title_hi') as string,
        },
      }]);
      
      toast.success('Problem proposal submitted!');
      e.currentTarget.reset();
    } catch (error) {
      toast.error('Failed to submit');
    }
  };

  const handleProductSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const formData = new FormData(e.currentTarget);
    
    try {
      await supabase.from('submissions').insert([{
        manager_id: user?.id,
        type: 'product',
        payload_json: {
          problem_id: formData.get('problem_id') as string,
          name: formData.get('name') as string,
          dosage_recommendation: formData.get('dosage_recommendation') as string,
          dosage_min: parseFloat(formData.get('dosage_min') as string),
          dosage_max: parseFloat(formData.get('dosage_max') as string),
          dosage_unit: formData.get('dosage_unit') as string,
          pack_sizes: (formData.get('pack_sizes') as string).split(',').map(s => s.trim()),
          spray_interval: formData.get('spray_interval') as string,
          safety_notes: formData.get('safety_notes') as string,
        },
      }]);
      
      toast.success('Product proposal submitted!');
      e.currentTarget.reset();
    } catch (error) {
      toast.error('Failed to submit');
    }
  };

  return (
    <Card className="p-6">
      <h2 className="text-2xl font-display font-bold mb-6">Submit New Proposal</h2>
      
      <Tabs defaultValue="crop">
        <TabsList className="grid w-full grid-cols-3">
          <TabsTrigger value="crop">Crop</TabsTrigger>
          <TabsTrigger value="problem">Problem</TabsTrigger>
          <TabsTrigger value="product">Product</TabsTrigger>
        </TabsList>

        <TabsContent value="crop">
          <form onSubmit={handleCropSubmit} className="space-y-4">
            <div><Label>Name (English)</Label><Input name="name_en" required /></div>
            <div><Label>Name (Telugu)</Label><Input name="name_te" required /></div>
            <div><Label>Name (Hindi)</Label><Input name="name_hi" required /></div>
            <Button type="submit" className="w-full">Submit Crop Proposal</Button>
          </form>
        </TabsContent>

        <TabsContent value="problem">
          <form onSubmit={handleProblemSubmit} className="space-y-4">
            <div>
              <Label>Crop</Label>
              <Select name="crop_id" required>
                <SelectTrigger><SelectValue /></SelectTrigger>
                <SelectContent>
                  {crops.map(c => <SelectItem key={c.id} value={c.id}>{c.name_en}</SelectItem>)}
                </SelectContent>
              </Select>
            </div>
            <div><Label>Title (English)</Label><Input name="title_en" required /></div>
            <div><Label>Title (Telugu)</Label><Input name="title_te" required /></div>
            <div><Label>Title (Hindi)</Label><Input name="title_hi" required /></div>
            <Button type="submit" className="w-full">Submit Problem Proposal</Button>
          </form>
        </TabsContent>

        <TabsContent value="product">
          <form onSubmit={handleProductSubmit} className="space-y-4">
            <div>
              <Label>Problem</Label>
              <Select name="problem_id" required>
                <SelectTrigger><SelectValue /></SelectTrigger>
                <SelectContent>
                  {problems.map(p => <SelectItem key={p.id} value={p.id}>{p.title_en}</SelectItem>)}
                </SelectContent>
              </Select>
            </div>
            <div><Label>Product Name</Label><Input name="name" required /></div>
            <div><Label>Dosage Recommendation</Label><Input name="dosage_recommendation" placeholder="e.g., 400 ml/acre" required /></div>
            <div className="grid grid-cols-3 gap-2">
              <div><Label>Min Dosage</Label><Input name="dosage_min" type="number" step="0.01" required /></div>
              <div><Label>Max Dosage</Label><Input name="dosage_max" type="number" step="0.01" required /></div>
              <div><Label>Unit</Label><Input name="dosage_unit" defaultValue="ml" required /></div>
            </div>
            <div><Label>Pack Sizes (comma-separated)</Label><Input name="pack_sizes" placeholder="100ml, 250ml, 500ml" required /></div>
            <div><Label>Spray Interval</Label><Input name="spray_interval" /></div>
            <div><Label>Safety Notes</Label><Textarea name="safety_notes" /></div>
            <Button type="submit" className="w-full">Submit Product Proposal</Button>
          </form>
        </TabsContent>
      </Tabs>
    </Card>
  );
};
