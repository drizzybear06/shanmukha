import { useEffect, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { Card } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { CheckCircle, XCircle, Clock, Trash2 } from 'lucide-react';
import { toast } from 'sonner';
import { useAuth } from '@/contexts/AuthContext';
import { AlertDialog, AlertDialogAction, AlertDialogCancel, AlertDialogContent, AlertDialogDescription, AlertDialogFooter, AlertDialogHeader, AlertDialogTitle, AlertDialogTrigger } from '@/components/ui/alert-dialog';

export const SubmissionApprovals = () => {
  const { user } = useAuth();
  const [submissions, setSubmissions] = useState<any[]>([]);

  useEffect(() => {
    fetchSubmissions();
  }, []);

  const fetchSubmissions = async () => {
    try {
      const { data, error } = await supabase
        .from('submissions')
        .select('*, users!submissions_manager_id_fkey(username)')
        .order('created_at', { ascending: false });
      
      if (error) {
        console.error('Error fetching submissions:', error);
        toast.error('Failed to load submissions');
        return;
      }
      
      setSubmissions(data || []);
    } catch (error) {
      console.error('Fetch error:', error);
      toast.error('Failed to load submissions');
    }
  };

  const handleApprove = async (submission: any) => {
    try {
      const payload = submission.payload_json;
      
      if (submission.type === 'crop') {
        await supabase.from('crops').insert([payload]);
      } else if (submission.type === 'problem') {
        await supabase.from('problems').insert([payload]);
      } else if (submission.type === 'product') {
        await supabase.from('products').insert([payload]);
      }

      await supabase
        .from('submissions')
        .update({ status: 'approved', reviewed_by: user?.id, reviewed_at: new Date().toISOString() })
        .eq('id', submission.id);

      toast.success('Approved and published!');
      fetchSubmissions();
    } catch (error) {
      toast.error('Failed to approve');
    }
  };

  const handleReject = async (id: string) => {
    try {
      await supabase
        .from('submissions')
        .update({ status: 'rejected', reviewed_by: user?.id, reviewed_at: new Date().toISOString() })
        .eq('id', id);
      toast.success('Rejected');
      fetchSubmissions();
    } catch (error) {
      toast.error('Failed');
    }
  };

  const handleDelete = async (id: string) => {
    try {
      await supabase.from('submissions').delete().eq('id', id);
      toast.success('Submission deleted');
      fetchSubmissions();
    } catch (error) {
      toast.error('Failed to delete');
    }
  };

  const handleClearAll = async () => {
    try {
      await supabase.from('submissions').delete().neq('id', '00000000-0000-0000-0000-000000000000');
      toast.success('All submissions cleared');
      fetchSubmissions();
    } catch (error) {
      toast.error('Failed to clear submissions');
    }
  };

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h2 className="text-2xl font-display font-bold">Submission Approvals</h2>
        {submissions.length > 0 && (
          <AlertDialog>
            <AlertDialogTrigger asChild>
              <Button variant="destructive" size="sm">
                <Trash2 className="w-4 h-4 mr-2" />
                Clear All
              </Button>
            </AlertDialogTrigger>
            <AlertDialogContent>
              <AlertDialogHeader>
                <AlertDialogTitle>Clear All Submissions?</AlertDialogTitle>
                <AlertDialogDescription>
                  This will permanently delete all submissions. This action cannot be undone.
                </AlertDialogDescription>
              </AlertDialogHeader>
              <AlertDialogFooter>
                <AlertDialogCancel>Cancel</AlertDialogCancel>
                <AlertDialogAction onClick={handleClearAll}>Clear All</AlertDialogAction>
              </AlertDialogFooter>
            </AlertDialogContent>
          </AlertDialog>
        )}
      </div>
      
      {submissions.length === 0 ? (
        <Card className="p-8 text-center">
          <p className="text-muted-foreground">No submissions found</p>
        </Card>
      ) : (
        <div className="space-y-4">
          {submissions.map((sub) => (
          <Card key={sub.id} className="p-6">
            <div className="flex items-start justify-between">
              <div className="flex-1">
                <div className="flex items-center gap-3 mb-2">
                  <Badge variant={sub.status === 'pending' ? 'default' : sub.status === 'approved' ? 'default' : 'destructive'}>
                    {sub.status === 'pending' && <Clock className="w-3 h-3 mr-1" />}
                    {sub.status}
                  </Badge>
                  <span className="text-sm font-semibold">{sub.type}</span>
                  <span className="text-sm text-muted-foreground">by {sub.users?.username}</span>
                </div>
                
                <div className="bg-secondary/50 p-4 rounded-lg mt-3">
                  <pre className="text-sm overflow-x-auto">
                    {JSON.stringify(sub.payload_json, null, 2)}
                  </pre>
                </div>
              </div>
              
              <div className="flex gap-2 ml-4">
                {sub.status === 'pending' && (
                  <>
                    <Button size="sm" onClick={() => handleApprove(sub)}>
                      <CheckCircle className="w-4 h-4 mr-1" />
                      Approve
                    </Button>
                    <Button size="sm" variant="destructive" onClick={() => handleReject(sub.id)}>
                      <XCircle className="w-4 h-4 mr-1" />
                      Reject
                    </Button>
                  </>
                )}
                <AlertDialog>
                  <AlertDialogTrigger asChild>
                    <Button size="sm" variant="outline">
                      <Trash2 className="w-4 h-4" />
                    </Button>
                  </AlertDialogTrigger>
                  <AlertDialogContent>
                    <AlertDialogHeader>
                      <AlertDialogTitle>Delete Submission?</AlertDialogTitle>
                      <AlertDialogDescription>
                        This will permanently delete this submission. This action cannot be undone.
                      </AlertDialogDescription>
                    </AlertDialogHeader>
                    <AlertDialogFooter>
                      <AlertDialogCancel>Cancel</AlertDialogCancel>
                      <AlertDialogAction onClick={() => handleDelete(sub.id)}>Delete</AlertDialogAction>
                    </AlertDialogFooter>
                  </AlertDialogContent>
                </AlertDialog>
              </div>
            </div>
          </Card>
        ))}
        </div>
      )}
    </div>
  );
};
