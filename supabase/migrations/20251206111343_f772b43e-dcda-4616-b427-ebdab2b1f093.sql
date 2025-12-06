-- Step 1: Clear analytics first (has FK to products), then products and product_problems
DELETE FROM analytics;
DELETE FROM product_problems;
DELETE FROM products;

-- Step 2: DROP existing indexes on products
DROP INDEX IF EXISTS idx_products_problem_id;
DROP INDEX IF EXISTS idx_products_crop_id;
DROP INDEX IF EXISTS idx_products_name;
DROP INDEX IF EXISTS idx_product_problems_product;
DROP INDEX IF EXISTS idx_product_problems_problem;

-- ==========================================
-- INSECTICIDES
-- ==========================================

-- King Star - Acetamiprid 20% SP
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'King Star', 'Acetamiprid 20% SP', 'insecticide', '20-40 gm/acre', 20, 40, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Jassids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'King Star', 'Acetamiprid 20% SP', 'insecticide', '20-40 gm/acre', 20, 40, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Aphids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'King Star', 'Acetamiprid 20% SP', 'insecticide', '20-40 gm/acre', 20, 40, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Whitefly' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'King Star', 'Acetamiprid 20% SP', 'insecticide', '20-40 gm/acre', 20, 40, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'King Star', 'Acetamiprid 20% SP', 'insecticide', '30 gm/acre', 30, 30, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Okra' AND p.title_en = 'Aphids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'King Star', 'Acetamiprid 20% SP', 'insecticide', '30 gm/acre', 30, 30, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cabbage' AND p.title_en = 'Aphids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'King Star', 'Acetamiprid 20% SP', 'insecticide', '20-40 gm/acre', 20, 40, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Brown Plant Hopper' AND p.crop_id = c.id;

-- Kanfidan - Imidacloprid 17.8% SL
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '40-50 ml/acre', 40, 50, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Aphids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '40-50 ml/acre', 40, 50, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Jassids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '40-50 ml/acre', 40, 50, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '40-50 ml/acre', 40, 50, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Whitefly' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '40-50 ml/acre', 40, 50, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Brown Plant Hopper' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '40-50 ml/acre', 40, 50, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'White Backed Plant Hopper' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '40-50 ml/acre', 40, 50, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Green Leaf Hopper' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '50-100 ml/acre', 50, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '50-100 ml/acre', 50, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Aphids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '140 ml/acre', 140, 140, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Sugarcane' AND p.title_en = 'Termite' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '2-4 ml/tree', 2, 4, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Mango' AND p.title_en = 'Hopper' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '200 ml/acre', 200, 200, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Okra' AND p.title_en = 'Aphids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '200 ml/acre', 200, 200, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Okra' AND p.title_en = 'Jassids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '200 ml/acre', 200, 200, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Okra' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '120-160 ml/acre', 120, 160, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Grapes' AND p.title_en = 'Flea Beetle' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '60-70 ml/acre', 60, 70, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Tomato' AND p.title_en = 'Whitefly' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Groundnut' AND p.title_en = 'Aphids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Groundnut' AND p.title_en = 'Jassids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Sunflower' AND p.title_en = 'Jassids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Sunflower' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Sunflower' AND p.title_en = 'Whitefly' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', 'Citrus dosage', 1, 1, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Citrus' AND p.title_en = 'Leaf Miner' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kanfidan', 'Imidacloprid 17.8% SL', 'insecticide', 'Citrus dosage', 1, 1, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Citrus' AND p.title_en = 'Psylla' AND p.crop_id = c.id;

-- Megasus - Diafenthiuron 50% WP
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Whitefly' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Aphids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Jassids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cabbage' AND p.title_en = 'Diamond Back Moth' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '320 gm/acre', 320, 320, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cardamom' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '320 gm/acre', 320, 320, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cardamom' AND p.title_en = 'Shoot & Capsule Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Brinjal' AND p.title_en = 'Whitefly' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Tomato' AND p.title_en = 'Whitefly' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Tomato' AND p.title_en = 'Red Spider Mite' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '2 gm/lt', 2, 2, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Citrus' AND p.title_en = 'Mites' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Okra' AND p.title_en = 'Whitefly' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Okra' AND p.title_en = 'Red Spider Mite' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Okra' AND p.title_en = 'Jassids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Watermelon' AND p.title_en = 'Whitefly' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Watermelon' AND p.title_en = 'Red Spider Mite' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Mites' AND p.crop_id = c.id;

-- Emamectin - Emamectin Benzoate 5% SG
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Emamectin', 'Emamectin Benzoate 5% SG', 'insecticide', '80 gm/acre', 80, 80, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Brinjal' AND p.title_en = 'Shoot and Fruit Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Emamectin', 'Emamectin Benzoate 5% SG', 'insecticide', '80-90 gm/acre', 80, 90, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Bollworms' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Emamectin', 'Emamectin Benzoate 5% SG', 'insecticide', '60-80 gm/acre', 60, 80, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cabbage' AND p.title_en = 'Diamond Back Moth' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Emamectin', 'Emamectin Benzoate 5% SG', 'insecticide', '90 gm/acre', 90, 90, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chick Pea' AND p.title_en = 'Pod Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Emamectin', 'Emamectin Benzoate 5% SG', 'insecticide', '80 gm/acre', 80, 80, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Emamectin', 'Emamectin Benzoate 5% SG', 'insecticide', '80 gm/acre', 80, 80, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Mites' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Emamectin', 'Emamectin Benzoate 5% SG', 'insecticide', '80 gm/acre', 80, 80, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Fruit Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Emamectin', 'Emamectin Benzoate 5% SG', 'insecticide', '90 gm/acre', 90, 90, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Grapes' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Emamectin', 'Emamectin Benzoate 5% SG', 'insecticide', '60-70 gm/acre', 60, 70, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Okra' AND p.title_en = 'Fruit Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Emamectin', 'Emamectin Benzoate 5% SG', 'insecticide', '60-70 gm/acre', 60, 70, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Okra' AND p.title_en = 'Shoot Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Emamectin', 'Emamectin Benzoate 5% SG', 'insecticide', '90 gm/acre', 90, 90, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Red Gram' AND p.title_en = 'Gram Pod Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Emamectin', 'Emamectin Benzoate 5% SG', 'insecticide', '80 gm/acre', 80, 80, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Tea' AND p.title_en = 'Tea Looper' AND p.crop_id = c.id;

-- Ryz - Pymetrozine 50% WG
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Ryz', 'Pymetrozine 50% WG', 'insecticide', '120 gm/acre', 120, 120, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Brown Plant Hopper' AND p.crop_id = c.id;

-- Dominator - Dinotefuran 20% SG
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Dominator', 'Dinotefuran 20% SG', 'insecticide', '60-80 gm/acre', 60, 80, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Brown Plant Hopper' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Dominator', 'Dinotefuran 20% SG', 'insecticide', '50-60 gm/acre', 50, 60, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Aphids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Dominator', 'Dinotefuran 20% SG', 'insecticide', '50-60 gm/acre', 50, 60, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Jassids' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Dominator', 'Dinotefuran 20% SG', 'insecticide', '50-60 gm/acre', 50, 60, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Dominator', 'Dinotefuran 20% SG', 'insecticide', '50-60 gm/acre', 50, 60, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Whitefly' AND p.crop_id = c.id;

-- Centra - Lambda Cyhalothrin 4.9% CS
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '200 ml/acre', 200, 200, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Bollworms' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Stem Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Leaf Folder' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '120 ml/acre', 120, 120, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Brinjal' AND p.title_en = 'Shoot and Fruit Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '120 ml/acre', 120, 120, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Okra' AND p.title_en = 'Fruit Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '120 ml/acre', 120, 120, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Tomato' AND p.title_en = 'Fruit Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Grapes' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Grapes' AND p.title_en = 'Flea Beetle' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '200 ml/acre', 200, 200, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '200 ml/acre', 200, 200, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Pod Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '120 ml/acre', 120, 120, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Soyabean' AND p.title_en = 'Stem Fly' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '120 ml/acre', 120, 120, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Soyabean' AND p.title_en = 'Semilooper' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '200 ml/acre', 200, 200, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Pomegranate' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '200 ml/acre', 200, 200, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Pomegranate' AND p.title_en = 'Fruit Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '160 ml/acre', 160, 160, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cardamom' AND p.title_en = 'Shoot & Capsule Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide', '160 ml/acre', 160, 160, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cardamom' AND p.title_en = 'Thrips' AND p.crop_id = c.id;