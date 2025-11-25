import { useEffect, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { useAuth } from '@/contexts/AuthContext';
import { Card } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Clock, CheckCircle, XCircle } from 'lucide-react';
import { toast } from 'sonner';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { Input } from '@/components/ui/input';

export const ManagerSubmissions = () => {
  const { user } = useAuth();
  const [submissions, setSubmissions] = useState<any[]>([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [filterType, setFilterType] = useState('all');
  const [filterStatus, setFilterStatus] = useState('all');

  useEffect(() => {
    fetchSubmissions();
  }, []);

  const fetchSubmissions = async () => {
    try {
      const { data } = await supabase
        .from('submissions')
        .select('*')
        .eq('manager_id', user?.id)
        .order('created_at', { ascending: false });
      
      setSubmissions(data || []);
    } catch (error) {
      toast.error('Failed to load submissions');
    }
  };

  const filteredSubmissions = submissions.filter(sub => {
    const payload = JSON.stringify(sub.payload_json).toLowerCase();
    const matchesSearch = payload.includes(searchTerm.toLowerCase());
    const matchesType = filterType === 'all' || sub.type === filterType;
    const matchesStatus = filterStatus === 'all' || sub.status === filterStatus;
    return matchesSearch && matchesType && matchesStatus;
  });

  return (
    <div className="space-y-6">
      <h2 className="text-2xl font-display font-bold">My Submissions</h2>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <Input
          placeholder="Search submissions..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
        />
        <Select value={filterType} onValueChange={setFilterType}>
          <SelectTrigger><SelectValue placeholder="Filter by type" /></SelectTrigger>
          <SelectContent>
            <SelectItem value="all">All Types</SelectItem>
            <SelectItem value="crop">Crop</SelectItem>
            <SelectItem value="problem">Problem</SelectItem>
            <SelectItem value="product">Product</SelectItem>
          </SelectContent>
        </Select>
        <Select value={filterStatus} onValueChange={setFilterStatus}>
          <SelectTrigger><SelectValue placeholder="Filter by status" /></SelectTrigger>
          <SelectContent>
            <SelectItem value="all">All Status</SelectItem>
            <SelectItem value="pending">Pending</SelectItem>
            <SelectItem value="approved">Approved</SelectItem>
            <SelectItem value="rejected">Rejected</SelectItem>
          </SelectContent>
        </Select>
      </div>
      
      {filteredSubmissions.length === 0 ? (
        <Card className="p-8 text-center text-muted-foreground">
          No submissions found.
        </Card>
      ) : (
        <div className="space-y-4">
          {filteredSubmissions.map((sub) => (
            <Card key={sub.id} className="p-6">
              <div className="flex items-start justify-between">
                <div className="flex-1">
                  <div className="flex items-center gap-3 mb-2">
                    <Badge variant={
                      sub.status === 'pending' ? 'default' : 
                      sub.status === 'approved' ? 'default' : 
                      'destructive'
                    }>
                      {sub.status === 'pending' && <Clock className="w-3 h-3 mr-1" />}
                      {sub.status === 'approved' && <CheckCircle className="w-3 h-3 mr-1" />}
                      {sub.status === 'rejected' && <XCircle className="w-3 h-3 mr-1" />}
                      {sub.status}
                    </Badge>
                    <span className="text-sm font-semibold capitalize">{sub.type}</span>
                    <span className="text-sm text-muted-foreground">
                      {new Date(sub.created_at).toLocaleDateString()}
                    </span>
                  </div>
                  
                  <div className="bg-secondary/50 p-4 rounded-lg mt-3">
                    <pre className="text-sm overflow-x-auto">
                      {JSON.stringify(sub.payload_json, null, 2)}
                    </pre>
                  </div>
                </div>
              </div>
            </Card>
          ))}
        </div>
      )}
    </div>
  );
};
