
-- Drop all existing data (respecting foreign keys)
DELETE FROM analytics;
DELETE FROM product_problems;
DELETE FROM crop_problems;
DELETE FROM products;
DELETE FROM problems;
DELETE FROM crops;

-- Add indexes for better performance
CREATE INDEX IF NOT EXISTS idx_crops_name_en ON crops(name_en);
CREATE INDEX IF NOT EXISTS idx_problems_crop_id ON problems(crop_id);
CREATE INDEX IF NOT EXISTS idx_problems_title_en ON problems(title_en);
CREATE INDEX IF NOT EXISTS idx_products_problem_id ON products(problem_id);
CREATE INDEX IF NOT EXISTS idx_products_crop_id ON products(crop_id);
CREATE INDEX IF NOT EXISTS idx_products_name ON products(name);
CREATE INDEX IF NOT EXISTS idx_product_problems_product_id ON product_problems(product_id);
CREATE INDEX IF NOT EXISTS idx_product_problems_problem_id ON product_problems(problem_id);
CREATE INDEX IF NOT EXISTS idx_crop_problems_crop_id ON crop_problems(crop_id);
CREATE INDEX IF NOT EXISTS idx_crop_problems_problem_id ON crop_problems(problem_id);
CREATE INDEX IF NOT EXISTS idx_analytics_crop_id ON analytics(crop_id);
CREATE INDEX IF NOT EXISTS idx_analytics_timestamp ON analytics(timestamp);
