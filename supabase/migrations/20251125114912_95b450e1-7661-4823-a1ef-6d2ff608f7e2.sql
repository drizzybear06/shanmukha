-- Add crop_id to products table for crop-specific product catalogs
ALTER TABLE products ADD COLUMN crop_id uuid REFERENCES crops(id);

-- Update existing products to inherit crop_id from their problem's crop
UPDATE products 
SET crop_id = problems.crop_id
FROM problems
WHERE products.problem_id = problems.id;