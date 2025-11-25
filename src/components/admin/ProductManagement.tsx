import { useEffect, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { Card } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Textarea } from '@/components/ui/textarea';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { PlusCircle, Edit, Trash2, Package } from 'lucide-react';
import { toast } from 'sonner';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import { ImageUploadWithCrop } from '@/components/ImageUploadWithCrop';

export const ProductManagement = () => {
  const [products, setProducts] = useState<any[]>([]);
  const [problems, setProblems] = useState<any[]>([]);
  const [crops, setCrops] = useState<any[]>([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [filterCrop, setFilterCrop] = useState('all');
  const [filterProblem, setFilterProblem] = useState('all');
  const [showDialog, setShowDialog] = useState(false);
  const [editingProduct, setEditingProduct] = useState<any>(null);
  const [formData, setFormData] = useState({
    crop_id: '',
    problem_id: '',
    name: '',
    dosage_recommendation: '',
    dosage_min: '',
    dosage_max: '',
    dosage_unit: 'ml',
    pack_sizes: '',
    spray_interval: '',
    safety_notes: '',
    image_url: '',
  });
  const [imageFile, setImageFile] = useState<File | null>(null);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const [productsRes, problemsRes, cropsRes] = await Promise.all([
        supabase.from('products').select('*, problems(title_en), crops(name_en)'),
        supabase.from('problems').select('*'),
        supabase.from('crops').select('*'),
      ]);
      
      setProducts(productsRes.data || []);
      setProblems(problemsRes.data || []);
      setCrops(cropsRes.data || []);
    } catch (error) {
      toast.error('Failed to load data');
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    try {
      let imageUrl = formData.image_url;
      
      // Upload image if a new one was selected
      if (imageFile) {
        const fileExt = imageFile.name.split('.').pop();
        const fileName = `product-${Date.now()}.${fileExt}`;
        const filePath = `products/${fileName}`;

        const { error: uploadError } = await supabase.storage
          .from('images')
          .upload(filePath, imageFile);

        if (uploadError) throw uploadError;

        const { data: { publicUrl } } = supabase.storage
          .from('images')
          .getPublicUrl(filePath);

        imageUrl = publicUrl;
      }

      const data = {
        ...formData,
        image_url: imageUrl,
        dosage_min: parseFloat(formData.dosage_min),
        dosage_max: parseFloat(formData.dosage_max),
        pack_sizes: formData.pack_sizes.split(',').map(s => s.trim()),
      };

      if (editingProduct) {
        await supabase.from('products').update(data).eq('id', editingProduct.id);
        toast.success('Updated');
      } else {
        await supabase.from('products').insert([data]);
        toast.success('Added');
      }
      
      setShowDialog(false);
      resetForm();
      fetchData();
    } catch (error) {
      toast.error('Failed');
    }
  };

  const resetForm = () => {
    setFormData({
      crop_id: '', problem_id: '', name: '', dosage_recommendation: '',
      dosage_min: '', dosage_max: '', dosage_unit: 'ml',
      pack_sizes: '', spray_interval: '', safety_notes: '', image_url: '',
    });
    setImageFile(null);
    setEditingProduct(null);
  };

  const filteredProducts = products.filter(product => {
    const matchesSearch = product.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         product.dosage_recommendation.toLowerCase().includes(searchTerm.toLowerCase());
    const matchesCrop = filterCrop === 'all' || product.crop_id === filterCrop;
    const matchesProblem = filterProblem === 'all' || product.problem_id === filterProblem;
    return matchesSearch && matchesCrop && matchesProblem;
  });

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h2 className="text-2xl font-display font-bold">Product Management</h2>
        <Button onClick={() => setShowDialog(true)}>
          <PlusCircle className="mr-2 h-4 w-4" />
          Add Product
        </Button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
        <Input
          placeholder="Search products..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
        <Select value={filterCrop} onValueChange={setFilterCrop}>
          <SelectTrigger><SelectValue placeholder="Filter by crop" /></SelectTrigger>
          <SelectContent>
            <SelectItem value="all">All Crops</SelectItem>
            {crops.map(c => <SelectItem key={c.id} value={c.id}>{c.name_en}</SelectItem>)}
          </SelectContent>
        </Select>
        <Select value={filterProblem} onValueChange={setFilterProblem}>
          <SelectTrigger><SelectValue placeholder="Filter by problem" /></SelectTrigger>
          <SelectContent>
            <SelectItem value="all">All Problems</SelectItem>
            {problems.map(p => <SelectItem key={p.id} value={p.id}>{p.title_en}</SelectItem>)}
          </SelectContent>
        </Select>
      </div>

      <div className="grid gap-4">
        {filteredProducts.map((product) => (
          <Card key={product.id} className="p-4">
            <div className="flex items-start gap-4">
              {product.image_url ? (
                <img src={product.image_url} alt={product.name} className="w-16 h-16 object-cover rounded-lg" />
              ) : (
                <div className="bg-accent/10 p-3 rounded-full">
                  <Package className="w-8 h-8 text-accent" />
                </div>
              )}
              <div className="flex-1 min-w-0">
                <p className="text-xs text-muted-foreground">{product.crops?.name_en} - {product.problems?.title_en}</p>
                <h3 className="font-bold text-lg truncate">{product.name}</h3>
                <p className="text-sm truncate">{product.dosage_recommendation}</p>
                <p className="text-xs text-muted-foreground mt-1 truncate">
                  Packs: {product.pack_sizes.join(', ')}
                </p>
              </div>
              <div className="flex gap-2">
                <Button size="sm" variant="outline" onClick={() => {
                  setEditingProduct(product);
                  setFormData({
                    crop_id: product.crop_id,
                    problem_id: product.problem_id,
                    name: product.name,
                    dosage_recommendation: product.dosage_recommendation,
                    dosage_min: product.dosage_min.toString(),
                    dosage_max: product.dosage_max.toString(),
                    dosage_unit: product.dosage_unit,
                    pack_sizes: product.pack_sizes.join(', '),
                    spray_interval: product.spray_interval || '',
                    safety_notes: product.safety_notes || '',
                    image_url: product.image_url || '',
                  });
                  setShowDialog(true);
                }}>
                  <Edit className="h-3 w-3" />
                </Button>
                <Button size="sm" variant="destructive" onClick={async () => {
                  if (confirm('Delete?')) {
                    await supabase.from('products').delete().eq('id', product.id);
                    fetchData();
                  }
                }}>
                  <Trash2 className="h-3 w-3" />
                </Button>
              </div>
            </div>
          </Card>
        ))}
      </div>

      <Dialog open={showDialog} onOpenChange={setShowDialog}>
        <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
          <DialogHeader>
            <DialogTitle>{editingProduct ? 'Edit' : 'Add'} Product</DialogTitle>
          </DialogHeader>
          <form onSubmit={handleSubmit} className="space-y-4">
            <ImageUploadWithCrop
              onImageCropped={setImageFile}
              aspectRatio={1}
              label="Product Image (square, 400x400)"
              currentImage={formData.image_url}
            />
            <div>
              <Label>Crop</Label>
              <Select value={formData.crop_id} onValueChange={(val) => setFormData({ ...formData, crop_id: val })}>
                <SelectTrigger><SelectValue placeholder="Select crop" /></SelectTrigger>
                <SelectContent>
                  {crops.map((c) => <SelectItem key={c.id} value={c.id}>{c.name_en}</SelectItem>)}
                </SelectContent>
              </Select>
            </div>
            <div>
              <Label>Problem</Label>
              <Select value={formData.problem_id} onValueChange={(val) => setFormData({ ...formData, problem_id: val })}>
                <SelectTrigger><SelectValue placeholder="Select problem" /></SelectTrigger>
                <SelectContent>
                  {problems.filter(p => !formData.crop_id || p.crop_id === formData.crop_id).map((p) => <SelectItem key={p.id} value={p.id}>{p.title_en}</SelectItem>)}
                </SelectContent>
              </Select>
            </div>
            <div><Label>Name</Label><Input value={formData.name} onChange={(e) => setFormData({ ...formData, name: e.target.value })} required /></div>
            <div><Label>Dosage Recommendation</Label><Input value={formData.dosage_recommendation} onChange={(e) => setFormData({ ...formData, dosage_recommendation: e.target.value })} required /></div>
            <div className="grid grid-cols-3 gap-2">
              <div><Label>Min Dosage</Label><Input type="number" value={formData.dosage_min} onChange={(e) => setFormData({ ...formData, dosage_min: e.target.value })} required /></div>
              <div><Label>Max Dosage</Label><Input type="number" value={formData.dosage_max} onChange={(e) => setFormData({ ...formData, dosage_max: e.target.value })} required /></div>
              <div><Label>Unit</Label><Input value={formData.dosage_unit} onChange={(e) => setFormData({ ...formData, dosage_unit: e.target.value })} required /></div>
            </div>
            <div><Label>Pack Sizes (comma-separated)</Label><Input value={formData.pack_sizes} onChange={(e) => setFormData({ ...formData, pack_sizes: e.target.value })} required /></div>
            <div><Label>Spray Interval</Label><Input value={formData.spray_interval} onChange={(e) => setFormData({ ...formData, spray_interval: e.target.value })} /></div>
            <div><Label>Safety Notes</Label><Textarea value={formData.safety_notes} onChange={(e) => setFormData({ ...formData, safety_notes: e.target.value })} /></div>
            <Button type="submit" className="w-full">{editingProduct ? 'Update' : 'Add'}</Button>
          </form>
        </DialogContent>
      </Dialog>
    </div>
  );
};
