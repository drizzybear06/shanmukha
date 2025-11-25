-- Revert auth integration and simplify RLS policies
-- Drop the trigger and functions
DROP TRIGGER IF EXISTS sync_auth_user_trigger ON public.users;
DROP FUNCTION IF EXISTS public.sync_auth_user();
DROP FUNCTION IF EXISTS public.ensure_auth_user(uuid, text, text);

-- Remove existing RLS policies that depend on auth.uid()
-- Crops table
DROP POLICY IF EXISTS "Admins can insert crops" ON public.crops;
DROP POLICY IF EXISTS "Admins can update crops" ON public.crops;
DROP POLICY IF EXISTS "Admins can delete crops" ON public.crops;

-- Problems table
DROP POLICY IF EXISTS "Admins can insert problems" ON public.problems;
DROP POLICY IF EXISTS "Admins can update problems" ON public.problems;
DROP POLICY IF EXISTS "Admins can delete problems" ON public.problems;

-- Products table
DROP POLICY IF EXISTS "Admins can insert products" ON public.products;
DROP POLICY IF EXISTS "Admins can update products" ON public.products;
DROP POLICY IF EXISTS "Admins can delete products" ON public.products;

-- Submissions table
DROP POLICY IF EXISTS "Admins can update submissions" ON public.submissions;
DROP POLICY IF EXISTS "Admins can view all submissions" ON public.submissions;
DROP POLICY IF EXISTS "Managers can insert submissions" ON public.submissions;
DROP POLICY IF EXISTS "Managers can view their submissions" ON public.submissions;

-- Users table
DROP POLICY IF EXISTS "Admins can insert users" ON public.users;
DROP POLICY IF EXISTS "Admins can update users" ON public.users;

-- Create simple permissive policies (since we're handling auth in the app layer)
-- Crops
CREATE POLICY "Allow all operations on crops" ON public.crops FOR ALL USING (true) WITH CHECK (true);

-- Problems
CREATE POLICY "Allow all operations on problems" ON public.problems FOR ALL USING (true) WITH CHECK (true);

-- Products
CREATE POLICY "Allow all operations on products" ON public.products FOR ALL USING (true) WITH CHECK (true);

-- Submissions
CREATE POLICY "Allow all operations on submissions" ON public.submissions FOR ALL USING (true) WITH CHECK (true);

-- Users
CREATE POLICY "Allow all operations on users" ON public.users FOR ALL USING (true) WITH CHECK (true);