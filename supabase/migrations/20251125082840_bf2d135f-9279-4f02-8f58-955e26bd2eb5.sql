-- Create auth users for existing users and set up sync trigger
-- First, we need to create corresponding auth.users entries

-- Function to create or get auth user
CREATE OR REPLACE FUNCTION public.ensure_auth_user(user_id uuid, user_email text, user_password text)
RETURNS uuid
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  auth_user_id uuid;
BEGIN
  -- Try to sign up the user in auth.users
  -- We'll use a stored procedure approach
  INSERT INTO auth.users (
    id,
    instance_id,
    email,
    encrypted_password,
    email_confirmed_at,
    created_at,
    updated_at,
    aud,
    role
  )
  VALUES (
    user_id,
    '00000000-0000-0000-0000-000000000000',
    user_email,
    crypt(user_password, gen_salt('bf')),
    now(),
    now(),
    now(),
    'authenticated',
    'authenticated'
  )
  ON CONFLICT (id) DO UPDATE SET
    encrypted_password = crypt(user_password, gen_salt('bf')),
    updated_at = now()
  RETURNING id INTO auth_user_id;
  
  RETURN auth_user_id;
END;
$$;

-- Create auth users for existing users
DO $$
DECLARE
  user_record RECORD;
BEGIN
  FOR user_record IN SELECT id, username, password_hash FROM public.users LOOP
    PERFORM public.ensure_auth_user(
      user_record.id,
      user_record.username || '@kisansethu.local',
      user_record.password_hash
    );
  END LOOP;
END $$;

-- Trigger to keep auth.users in sync when public.users is updated
CREATE OR REPLACE FUNCTION public.sync_auth_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
    PERFORM public.ensure_auth_user(
      NEW.id,
      NEW.username || '@kisansethu.local',
      NEW.password_hash
    );
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER sync_auth_user_trigger
AFTER INSERT OR UPDATE ON public.users
FOR EACH ROW
EXECUTE FUNCTION public.sync_auth_user();