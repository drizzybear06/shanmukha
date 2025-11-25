import { useEffect, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { Card } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { PlusCircle, Edit, Trash2, Bug } from 'lucide-react';
import { toast } from 'sonner';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';

export const ProblemManagement = () => {
  const [problems, setProblems] = useState<any[]>([]);
  const [crops, setCrops] = useState<any[]>([]);
  const [showDialog, setShowDialog] = useState(false);
  const [editingProblem, setEditingProblem] = useState<any>(null);
  const [formData, setFormData] = useState({
    crop_id: '',
    title_en: '',
    title_te: '',
    title_hi: '',
  });

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const [problemsRes, cropsRes] = await Promise.all([
        supabase.from('problems').select('*, crops(name_en)'),
        supabase.from('crops').select('*'),
      ]);
      
      if (problemsRes.error) throw problemsRes.error;
      if (cropsRes.error) throw cropsRes.error;
      
      setProblems(problemsRes.data || []);
      setCrops(cropsRes.data || []);
    } catch (error) {
      console.error('Error:', error);
      toast.error('Failed to load data');
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    try {
      if (editingProblem) {
        const { error } = await supabase
          .from('problems')
          .update(formData)
          .eq('id', editingProblem.id);
        if (error) throw error;
        toast.success('Problem updated');
      } else {
        const { error } = await supabase.from('problems').insert([formData]);
        if (error) throw error;
        toast.success('Problem added');
      }
      
      setShowDialog(false);
      setFormData({ crop_id: '', title_en: '', title_te: '', title_hi: '' });
      setEditingProblem(null);
      fetchData();
    } catch (error) {
      console.error('Error:', error);
      toast.error('Operation failed');
    }
  };

  const handleDelete = async (id: string) => {
    if (!confirm('Delete this problem?')) return;
    
    try {
      const { error } = await supabase.from('problems').delete().eq('id', id);
      if (error) throw error;
      toast.success('Deleted');
      fetchData();
    } catch (error) {
      toast.error('Failed to delete');
    }
  };

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h2 className="text-2xl font-display font-bold">Problem Management</h2>
        <Button onClick={() => setShowDialog(true)}>
          <PlusCircle className="mr-2 h-4 w-4" />
          Add Problem
        </Button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {problems.map((problem) => (
          <Card key={problem.id} className="p-4">
            <div className="flex items-start gap-4">
              <div className="bg-destructive/10 p-3 rounded-full">
                <Bug className="w-6 h-6 text-destructive" />
              </div>
              <div className="flex-1">
                <p className="text-xs text-muted-foreground mb-1">
                  {problem.crops?.name_en}
                </p>
                <h3 className="font-semibold">{problem.title_en}</h3>
                <p className="text-sm text-muted-foreground">{problem.title_te}</p>
                <div className="flex gap-2 mt-3">
                  <Button size="sm" variant="outline" onClick={() => {
                    setEditingProblem(problem);
                    setFormData({
                      crop_id: problem.crop_id,
                      title_en: problem.title_en,
                      title_te: problem.title_te,
                      title_hi: problem.title_hi,
                    });
                    setShowDialog(true);
                  }}>
                    <Edit className="h-3 w-3" />
                  </Button>
                  <Button size="sm" variant="destructive" onClick={() => handleDelete(problem.id)}>
                    <Trash2 className="h-3 w-3" />
                  </Button>
                </div>
              </div>
            </div>
          </Card>
        ))}
      </div>

      <Dialog open={showDialog} onOpenChange={setShowDialog}>
        <DialogContent>
          <DialogHeader>
            <DialogTitle>{editingProblem ? 'Edit' : 'Add'} Problem</DialogTitle>
          </DialogHeader>
          <form onSubmit={handleSubmit} className="space-y-4">
            <div>
              <Label>Crop</Label>
              <Select value={formData.crop_id} onValueChange={(val) => setFormData({ ...formData, crop_id: val })}>
                <SelectTrigger>
                  <SelectValue placeholder="Select crop" />
                </SelectTrigger>
                <SelectContent>
                  {crops.map((crop) => (
                    <SelectItem key={crop.id} value={crop.id}>
                      {crop.name_en}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
            <div>
              <Label>Title (English)</Label>
              <Input value={formData.title_en} onChange={(e) => setFormData({ ...formData, title_en: e.target.value })} required />
            </div>
            <div>
              <Label>Title (Telugu)</Label>
              <Input value={formData.title_te} onChange={(e) => setFormData({ ...formData, title_te: e.target.value })} required />
            </div>
            <div>
              <Label>Title (Hindi)</Label>
              <Input value={formData.title_hi} onChange={(e) => setFormData({ ...formData, title_hi: e.target.value })} required />
            </div>
            <Button type="submit" className="w-full">
              {editingProblem ? 'Update' : 'Add'}
            </Button>
          </form>
        </DialogContent>
      </Dialog>
    </div>
  );
};
