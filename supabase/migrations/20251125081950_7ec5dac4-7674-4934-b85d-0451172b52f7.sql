-- Simplify users table - remove password hashing, store plain text
-- Update existing users with plain text passwords
UPDATE users 
SET password_hash = 'admin@2345' 
WHERE username = 'admin001';

UPDATE users 
SET password_hash = 'manager@2345' 
WHERE username = 'manager1';

-- Drop the trigger and function we don't need anymore
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
DROP FUNCTION IF EXISTS public.handle_auth_user();
DROP FUNCTION IF EXISTS verify_user_password(TEXT, TEXT);