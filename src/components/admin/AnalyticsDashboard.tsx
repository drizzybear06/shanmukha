import { useEffect, useState } from 'react';
import { supabase } from '@/integrations/supabase/client';
import { Card } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { BarChart3, TrendingUp, Globe, Package, RefreshCw } from 'lucide-react';
import { toast } from 'sonner';

export const AnalyticsDashboard = () => {
  const [stats, setStats] = useState({
    totalDiagnoses: 0,
    languageBreakdown: {} as Record<string, number>,
    topProducts: [] as any[],
    topCrops: [] as any[],
  });

  useEffect(() => {
    fetchAnalytics();

    // Set up real-time subscription for analytics updates
    const channel = supabase
      .channel('analytics-changes')
      .on('postgres_changes', { event: '*', schema: 'public', table: 'analytics' }, () => {
        console.log('Analytics data changed, refreshing...');
        fetchAnalytics();
      })
      .subscribe();

    return () => {
      supabase.removeChannel(channel);
    };
  }, []);

  const fetchAnalytics = async () => {
    try {
      const { data: analytics, error } = await supabase.from('analytics').select('*');
      
      if (error) {
        console.error('Analytics fetch error:', error);
        toast.error('Failed to load analytics');
        return;
      }

      if (!analytics || analytics.length === 0) {
        setStats({
          totalDiagnoses: 0,
          languageBreakdown: {},
          topProducts: [],
          topCrops: [],
        });
        return;
      }

      const languageBreakdown = analytics.reduce((acc: any, curr) => {
        acc[curr.language] = (acc[curr.language] || 0) + 1;
        return acc;
      }, {});

      const productCounts = analytics.reduce((acc: any, curr) => {
        if (curr.product_id) {
          acc[curr.product_id] = (acc[curr.product_id] || 0) + 1;
        }
        return acc;
      }, {});

      const cropCounts = analytics.reduce((acc: any, curr) => {
        if (curr.crop_id) {
          acc[curr.crop_id] = (acc[curr.crop_id] || 0) + 1;
        }
        return acc;
      }, {});

      const { data: products } = await supabase.from('products').select('id, name');
      const { data: crops } = await supabase.from('crops').select('id, name_en');

      const topProducts = Object.entries(productCounts)
        .sort(([, a]: any, [, b]: any) => b - a)
        .slice(0, 5)
        .map(([id, count]) => ({
          name: products?.find(p => p.id === id)?.name || 'Unknown',
          count,
        }));

      const topCrops = Object.entries(cropCounts)
        .sort(([, a]: any, [, b]: any) => b - a)
        .slice(0, 5)
        .map(([id, count]) => ({
          name: crops?.find(c => c.id === id)?.name_en || 'Unknown',
          count,
        }));

      setStats({
        totalDiagnoses: analytics.length,
        languageBreakdown,
        topProducts,
        topCrops,
      });
      toast.success('Analytics loaded');
    } catch (error) {
      console.error('Analytics error:', error);
      toast.error('Failed to load analytics');
    }
  };

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <h2 className="text-2xl font-display font-bold">Analytics Dashboard</h2>
        <Button onClick={fetchAnalytics} variant="outline">
          <RefreshCw className="w-4 h-4 mr-2" />
          Refresh
        </Button>
      </div>
      
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <Card className="p-6">
          <div className="flex items-center gap-4">
            <div className="bg-primary/10 p-3 rounded-full">
              <BarChart3 className="w-6 h-6 text-primary" />
            </div>
            <div>
              <p className="text-sm text-muted-foreground">Total Diagnoses</p>
              <p className="text-3xl font-bold">{stats.totalDiagnoses}</p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center gap-4">
            <div className="bg-accent/10 p-3 rounded-full">
              <Globe className="w-6 h-6 text-accent" />
            </div>
            <div>
              <p className="text-sm text-muted-foreground">Languages</p>
              <div className="text-sm mt-1">
                {Object.entries(stats.languageBreakdown).map(([lang, count]) => (
                  <div key={lang}>
                    {lang}: {count as number}
                  </div>
                ))}
              </div>
            </div>
          </div>
        </Card>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <Card className="p-6">
          <div className="flex items-center gap-2 mb-4">
            <Package className="w-5 h-5 text-primary" />
            <h3 className="font-semibold text-lg">Top Products</h3>
          </div>
          <div className="space-y-2">
            {stats.topProducts.length === 0 ? (
              <p className="text-sm text-muted-foreground">No product data yet</p>
            ) : (
              stats.topProducts.map((product, idx) => (
                <div key={idx} className="flex justify-between items-center p-2 bg-secondary/50 rounded">
                  <span className="font-medium">{product.name}</span>
                  <span className="text-sm text-muted-foreground">{product.count} uses</span>
                </div>
              ))
            )}
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center gap-2 mb-4">
            <TrendingUp className="w-5 h-5 text-accent" />
            <h3 className="font-semibold text-lg">Top Crops</h3>
          </div>
          <div className="space-y-2">
            {stats.topCrops.length === 0 ? (
              <p className="text-sm text-muted-foreground">No crop data yet</p>
            ) : (
              stats.topCrops.map((crop, idx) => (
                <div key={idx} className="flex justify-between items-center p-2 bg-secondary/50 rounded">
                  <span className="font-medium">{crop.name}</span>
                  <span className="text-sm text-muted-foreground">{crop.count} diagnoses</span>
                </div>
              ))
            )}
          </div>
        </Card>
      </div>
    </div>
  );
};
