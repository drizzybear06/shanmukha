-- Enable pgcrypto for password hashing
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Add avatar_url column to users table for profile pictures
ALTER TABLE users ADD COLUMN IF NOT EXISTS avatar_url TEXT;

-- Create a function to set custom claims based on users table
CREATE OR REPLACE FUNCTION public.handle_auth_user()
RETURNS TRIGGER AS $$
BEGIN
  -- Insert into public.users when a new auth user is created
  INSERT INTO public.users (id, username, password_hash, role, avatar_url)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'username', NEW.email),
    '', -- password already handled by auth
    COALESCE((NEW.raw_user_meta_data->>'role')::app_role, 'guest'::app_role),
    NEW.raw_user_meta_data->>'avatar_url'
  )
  ON CONFLICT (id) DO UPDATE
  SET 
    username = EXCLUDED.username,
    role = EXCLUDED.role,
    avatar_url = EXCLUDED.avatar_url;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create trigger for auth.users
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT OR UPDATE ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_auth_user();

-- Create storage bucket for images
INSERT INTO storage.buckets (id, name, public)
VALUES ('images', 'images', true)
ON CONFLICT (id) DO NOTHING;

-- Storage policies for images bucket
CREATE POLICY "Public Access to Images"
ON storage.objects FOR SELECT
USING (bucket_id = 'images');

CREATE POLICY "Admins and Managers can upload images"
ON storage.objects FOR INSERT
WITH CHECK (
  bucket_id = 'images' AND
  auth.uid() IN (
    SELECT id FROM public.users 
    WHERE role IN ('admin', 'manager')
  )
);

CREATE POLICY "Admins and Managers can update images"
ON storage.objects FOR UPDATE
USING (
  bucket_id = 'images' AND
  auth.uid() IN (
    SELECT id FROM public.users 
    WHERE role IN ('admin', 'manager')
  )
);

CREATE POLICY "Admins and Managers can delete images"
ON storage.objects FOR DELETE
USING (
  bucket_id = 'images' AND
  auth.uid() IN (
    SELECT id FROM public.users 
    WHERE role IN ('admin', 'manager')
  )
);