-- Update storage policies to work without auth.uid() since we're not using Supabase Auth
-- Allow public access for reading images
DROP POLICY IF EXISTS "Public Access to Images" ON storage.objects;
DROP POLICY IF EXISTS "Admins and Managers can upload images" ON storage.objects;
DROP POLICY IF EXISTS "Admins and Managers can update images" ON storage.objects;
DROP POLICY IF EXISTS "Admins and Managers can delete images" ON storage.objects;

-- Simple public policies
CREATE POLICY "Anyone can read images"
ON storage.objects FOR SELECT
USING (bucket_id = 'images');

CREATE POLICY "Anyone can upload images"
ON storage.objects FOR INSERT
WITH CHECK (bucket_id = 'images');

CREATE POLICY "Anyone can update images"
ON storage.objects FOR UPDATE
USING (bucket_id = 'images');

CREATE POLICY "Anyone can delete images"
ON storage.objects FOR DELETE
USING (bucket_id = 'images');