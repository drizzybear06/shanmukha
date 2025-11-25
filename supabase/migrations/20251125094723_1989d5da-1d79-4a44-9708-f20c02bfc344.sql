-- Allow anyone to read analytics data
CREATE POLICY "Anyone can view analytics" ON public.analytics
  FOR SELECT
  USING (true);