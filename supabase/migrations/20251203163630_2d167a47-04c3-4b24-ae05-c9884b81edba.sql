-- Add product_type column to products table
ALTER TABLE public.products 
ADD COLUMN IF NOT EXISTS product_type text DEFAULT 'insecticide',
ADD COLUMN IF NOT EXISTS scientific_formula text,
ADD COLUMN IF NOT EXISTS description text,
ADD COLUMN IF NOT EXISTS mode_of_action text,
ADD COLUMN IF NOT EXISTS features text[];

-- Add problem_type column to problems table (pest, disease, weed)
ALTER TABLE public.problems 
ADD COLUMN IF NOT EXISTS problem_type text DEFAULT 'pest',
ADD COLUMN IF NOT EXISTS description text;

-- Create product_problem junction table for many-to-many relationships
CREATE TABLE IF NOT EXISTS public.product_problems (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  product_id uuid NOT NULL REFERENCES public.products(id) ON DELETE CASCADE,
  problem_id uuid NOT NULL REFERENCES public.problems(id) ON DELETE CASCADE,
  dosage_for_problem text,
  created_at timestamp with time zone DEFAULT now(),
  UNIQUE(product_id, problem_id)
);

-- Create crop_problem junction table for many-to-many relationships
CREATE TABLE IF NOT EXISTS public.crop_problems (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  crop_id uuid NOT NULL REFERENCES public.crops(id) ON DELETE CASCADE,
  problem_id uuid NOT NULL REFERENCES public.problems(id) ON DELETE CASCADE,
  created_at timestamp with time zone DEFAULT now(),
  UNIQUE(crop_id, problem_id)
);

-- Enable RLS on new tables
ALTER TABLE public.product_problems ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.crop_problems ENABLE ROW LEVEL SECURITY;

-- Create RLS policies for product_problems
CREATE POLICY "Anyone can view product_problems" 
ON public.product_problems 
FOR SELECT 
USING (true);

CREATE POLICY "Allow all operations on product_problems" 
ON public.product_problems 
FOR ALL 
USING (true) 
WITH CHECK (true);

-- Create RLS policies for crop_problems
CREATE POLICY "Anyone can view crop_problems" 
ON public.crop_problems 
FOR SELECT 
USING (true);

CREATE POLICY "Allow all operations on crop_problems" 
ON public.crop_problems 
FOR ALL 
USING (true) 
WITH CHECK (true);