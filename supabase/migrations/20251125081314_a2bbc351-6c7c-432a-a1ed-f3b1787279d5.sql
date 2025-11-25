-- Just replace the function to fix the security warning
CREATE OR REPLACE FUNCTION public.handle_auth_user()
RETURNS TRIGGER 
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
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
$$;