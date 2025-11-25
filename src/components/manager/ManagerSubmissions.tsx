import { useEffect, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { useAuth } from '@/contexts/AuthContext';
import { Card } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Clock, CheckCircle, XCircle } from 'lucide-react';
import { toast } from 'sonner';

export const ManagerSubmissions = () => {
  const { user } = useAuth();
  const [submissions, setSubmissions] = useState<any[]>([]);

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

  return (
    <div className="space-y-6">
      <h2 className="text-2xl font-display font-bold">My Submissions</h2>
      
      {submissions.length === 0 ? (
        <Card className="p-8 text-center text-muted-foreground">
          No submissions yet. Create your first proposal!
        </Card>
      ) : (
        <div className="space-y-4">
          {submissions.map((sub) => (
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
