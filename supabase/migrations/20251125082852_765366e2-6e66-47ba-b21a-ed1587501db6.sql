-- Fix security warnings by setting search_path on functions

CREATE OR REPLACE FUNCTION public.ensure_auth_user(user_id uuid, user_email text, user_password text)
RETURNS uuid
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, auth
AS $$
DECLARE
  auth_user_id uuid;
BEGIN
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

CREATE OR REPLACE FUNCTION public.sync_auth_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
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