-- Clear all existing data to avoid duplicates
DELETE FROM analytics;
DELETE FROM product_problems;
DELETE FROM crop_problems;
DELETE FROM submissions;
DELETE FROM products;
DELETE FROM problems;
DELETE FROM crops;

-- Drop existing indexes if they exist (to recreate cleanly)
DROP INDEX IF EXISTS idx_crops_name_en;
DROP INDEX IF EXISTS idx_problems_crop_id;
DROP INDEX IF EXISTS idx_problems_title_en;
DROP INDEX IF EXISTS idx_products_problem_id;
DROP INDEX IF EXISTS idx_products_crop_id;
DROP INDEX IF EXISTS idx_products_name;
DROP INDEX IF EXISTS idx_product_problems_product;
DROP INDEX IF EXISTS idx_product_problems_problem;
DROP INDEX IF EXISTS idx_crop_problems_crop;
DROP INDEX IF EXISTS idx_crop_problems_problem;
DROP INDEX IF EXISTS idx_analytics_crop;
DROP INDEX IF EXISTS idx_analytics_product;