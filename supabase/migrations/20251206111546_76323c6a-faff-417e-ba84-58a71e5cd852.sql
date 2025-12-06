-- More Insecticides and other products

-- Krushmite - Fenpyroximate 5% SC (Tea mites)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Krushmite', 'Fenpyroximate 5% SC', 'insecticide', '240-480 ml/acre', 240, 480, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Tea' AND p.title_en = 'Red Spider Mite' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Krushmite', 'Fenpyroximate 5% SC', 'insecticide', '240-480 ml/acre', 240, 480, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Tea' AND p.title_en = 'Pink Mite' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Krushmite', 'Fenpyroximate 5% SC', 'insecticide', '240-480 ml/acre', 240, 480, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Tea' AND p.title_en = 'Purple Mite' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Krushmite', 'Fenpyroximate 5% SC', 'insecticide', '120-240 ml/acre', 120, 240, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Yellow Mite' AND p.crop_id = c.id;

-- Kicker Plus - Lambda Cyhalothrin 5% EC
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kicker Plus', 'Lambda Cyhalothrin 5% EC', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Leaf Folder' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kicker Plus', 'Lambda Cyhalothrin 5% EC', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Stem Borer' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kicker Plus', 'Lambda Cyhalothrin 5% EC', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Green Leaf Hopper' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kicker Plus', 'Lambda Cyhalothrin 5% EC', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Gall Midge' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kicker Plus', 'Lambda Cyhalothrin 5% EC', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Hispa' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Kicker Plus', 'Lambda Cyhalothrin 5% EC', 'insecticide', '120 ml/acre', 120, 120, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Onion' AND p.title_en = 'Thrips' AND p.crop_id = c.id;

-- ==========================================
-- FUNGICIDES
-- ==========================================

-- Accute - Tebuconazole 50% + Trifloxystrobin 25% WG
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Accute', 'Tebuconazole 50% + Trifloxystrobin 25% WG', 'fungicide', '100 gm/acre', 100, 100, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Powdery Mildew' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Accute', 'Tebuconazole 50% + Trifloxystrobin 25% WG', 'fungicide', '100 gm/acre', 100, 100, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Anthracnose' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Accute', 'Tebuconazole 50% + Trifloxystrobin 25% WG', 'fungicide', '100 gm/acre', 100, 100, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Alternaria Leaf Spot' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Accute', 'Tebuconazole 50% + Trifloxystrobin 25% WG', 'fungicide', '70 gm/acre', 70, 70, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Grapes' AND p.title_en = 'Powdery Mildew' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Accute', 'Tebuconazole 50% + Trifloxystrobin 25% WG', 'fungicide', '30-40 gm/40 lt water', 30, 40, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Mango' AND p.title_en = 'Powdery Mildew' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Accute', 'Tebuconazole 50% + Trifloxystrobin 25% WG', 'fungicide', '30-40 gm/40 lt water', 30, 40, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Mango' AND p.title_en = 'Anthracnose' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Accute', 'Tebuconazole 50% + Trifloxystrobin 25% WG', 'fungicide', '80 gm/acre', 80, 80, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Sheath Blight' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Accute', 'Tebuconazole 50% + Trifloxystrobin 25% WG', 'fungicide', '80 gm/acre', 80, 80, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Blast' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Accute', 'Tebuconazole 50% + Trifloxystrobin 25% WG', 'fungicide', '140 gm/acre', 140, 140, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Tomato' AND p.title_en = 'Early Blight' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Accute', 'Tebuconazole 50% + Trifloxystrobin 25% WG', 'fungicide', '120 gm/acre', 120, 120, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Wheat' AND p.title_en = 'Powdery Mildew' AND p.crop_id = c.id;

-- Avventus - Azoxystrobin 18.2% + Difenoconazole 11.4% SC
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Avventus', 'Azoxystrobin 18.2% + Difenoconazole 11.4% SC', 'fungicide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Sheath Blight' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Avventus', 'Azoxystrobin 18.2% + Difenoconazole 11.4% SC', 'fungicide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Blast' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Avventus', 'Azoxystrobin 18.2% + Difenoconazole 11.4% SC', 'fungicide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Leaf Spot' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Avventus', 'Azoxystrobin 18.2% + Difenoconazole 11.4% SC', 'fungicide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cotton' AND p.title_en = 'Grey Mildew' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Avventus', 'Azoxystrobin 18.2% + Difenoconazole 11.4% SC', 'fungicide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Onion' AND p.title_en = 'Purple Blotch' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Avventus', 'Azoxystrobin 18.2% + Difenoconazole 11.4% SC', 'fungicide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Onion' AND p.title_en = 'Stemphylium Blight' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Avventus', 'Azoxystrobin 18.2% + Difenoconazole 11.4% SC', 'fungicide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Onion' AND p.title_en = 'Downy Mildew' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Avventus', 'Azoxystrobin 18.2% + Difenoconazole 11.4% SC', 'fungicide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Tomato' AND p.title_en = 'Early Blight' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Avventus', 'Azoxystrobin 18.2% + Difenoconazole 11.4% SC', 'fungicide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Tomato' AND p.title_en = 'Late Blight' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Avventus', 'Azoxystrobin 18.2% + Difenoconazole 11.4% SC', 'fungicide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Anthracnose' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Avventus', 'Azoxystrobin 18.2% + Difenoconazole 11.4% SC', 'fungicide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Powdery Mildew' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Avventus', 'Azoxystrobin 18.2% + Difenoconazole 11.4% SC', 'fungicide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Maize' AND p.title_en = 'Blight' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Avventus', 'Azoxystrobin 18.2% + Difenoconazole 11.4% SC', 'fungicide', '40 ml/acre', 40, 40, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Maize' AND p.title_en = 'Downy Mildew' AND p.crop_id = c.id;

-- Zebexyl - Metalaxyl 8% + Mancozeb 64% WP
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Zebexyl', 'Metalaxyl 8% + Mancozeb 64% WP', 'fungicide', '1000 gm/acre', 1000, 1000, 'gm', ARRAY['250 gm', '500 gm', '1 kg'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Grapes' AND p.title_en = 'Downy Mildew' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Zebexyl', 'Metalaxyl 8% + Mancozeb 64% WP', 'fungicide', '1000 gm/acre', 1000, 1000, 'gm', ARRAY['250 gm', '500 gm', '1 kg'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Potato' AND p.title_en = 'Late Blight' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Zebexyl', 'Metalaxyl 8% + Mancozeb 64% WP', 'fungicide', '800 gm/acre', 800, 800, 'gm', ARRAY['250 gm', '500 gm', '1 kg'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Pearl Millet' AND p.title_en = 'Downy Mildew' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Zebexyl', 'Metalaxyl 8% + Mancozeb 64% WP', 'fungicide', '1000 gm/acre', 1000, 1000, 'gm', ARRAY['250 gm', '500 gm', '1 kg'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Mustard' AND p.title_en = 'White Rust' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Zebexyl', 'Metalaxyl 8% + Mancozeb 64% WP', 'fungicide', '1000 gm/acre', 1000, 1000, 'gm', ARRAY['250 gm', '500 gm', '1 kg'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Mustard' AND p.title_en = 'Alternaria Blight' AND p.crop_id = c.id;

-- Helenaa - Metalaxyl 35% WS (Downy mildew)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Helenaa', 'Metalaxyl 35% WS', 'fungicide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Sorghum' AND p.title_en = 'Downy Mildew' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Helenaa', 'Metalaxyl 35% WS', 'fungicide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Bajra' AND p.title_en = 'Downy Mildew' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Helenaa', 'Metalaxyl 35% WS', 'fungicide', '280 gm/acre', 280, 280, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Maize' AND p.title_en = 'Downy Mildew' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Helenaa', 'Metalaxyl 35% WS', 'fungicide', '240 gm/acre', 240, 240, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Sunflower' AND p.title_en = 'Downy Mildew' AND p.crop_id = c.id;

-- ==========================================
-- HERBICIDES
-- ==========================================

-- Designate - Penoxsulam 1.02% + Cyhalofop-butyl 5.1% OD (Paddy weeds)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Designate', 'Penoxsulam 1.02% + Cyhalofop-butyl 5.1% OD', 'herbicide', '800-900 ml/acre', 800, 900, 'ml', ARRAY['250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Grassy Weeds' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Designate', 'Penoxsulam 1.02% + Cyhalofop-butyl 5.1% OD', 'herbicide', '800-900 ml/acre', 800, 900, 'ml', ARRAY['250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Broad Leaf Weeds' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Designate', 'Penoxsulam 1.02% + Cyhalofop-butyl 5.1% OD', 'herbicide', '800-900 ml/acre', 800, 900, 'ml', ARRAY['250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Sedges' AND p.crop_id = c.id;

-- Weed Cure Gold - Bispyribac sodium 10% SC (Paddy weeds)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Weed Cure Gold', 'Bispyribac sodium 10% SC', 'herbicide', '200-250 ml/acre', 200, 250, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Paddy' AND p.title_en = 'Grassy Weeds' AND p.crop_id = c.id;

-- Tendulum Plus - Pendimethalin 38.7% CS
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Tendulum Plus', 'Pendimethalin 38.7% CS', 'herbicide', '600-700 ml/acre', 600, 700, 'ml', ARRAY['250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Chilli' AND p.title_en = 'Grassy Weeds' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Tendulum Plus', 'Pendimethalin 38.7% CS', 'herbicide', '600-700 ml/acre', 600, 700, 'ml', ARRAY['250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Onion' AND p.title_en = 'Grassy Weeds' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Tendulum Plus', 'Pendimethalin 38.7% CS', 'herbicide', '600-700 ml/acre', 600, 700, 'ml', ARRAY['250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Soyabean' AND p.title_en = 'Grassy Weeds' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Tendulum Plus', 'Pendimethalin 38.7% CS', 'herbicide', '600-700 ml/acre', 600, 700, 'ml', ARRAY['250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Groundnut' AND p.title_en = 'Weeds' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Tendulum Plus', 'Pendimethalin 38.7% CS', 'herbicide', '600-700 ml/acre', 600, 700, 'ml', ARRAY['250 ml', '500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Cumin' AND p.title_en = 'Weeds' AND p.crop_id = c.id;

-- Typhoon - Clodinafop-Propargyl 15% WP (Wheat)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Typhoon', 'Clodinafop-Propargyl 15% WP', 'herbicide', '160 gm/acre', 160, 160, 'gm', ARRAY['80 gm', '160 gm', '250 gm'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Wheat' AND p.title_en = 'Phalaris Minor' AND p.crop_id = c.id;

-- Landmine - Mesotrione 2.27% + Atrazine 22.7% SC (Maize, Sugarcane)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Landmine', 'Mesotrione 2.27% + Atrazine 22.7% SC', 'herbicide', '1400 ml/acre', 1400, 1400, 'ml', ARRAY['500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Sugarcane' AND p.title_en = 'Grassy Weeds' AND p.crop_id = c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Landmine', 'Mesotrione 2.27% + Atrazine 22.7% SC', 'herbicide', '1400 ml/acre', 1400, 1400, 'ml', ARRAY['500 ml', '1 L'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'Maize' AND p.title_en = 'Grassy Weeds' AND p.crop_id = c.id;

-- ==========================================
-- PLANT GROWTH REGULATORS
-- ==========================================

-- Protonn - Gibberellic Acid 0.001%
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, crop_id, problem_id)
SELECT 'Protonn', 'Gibberellic Acid 0.001%', 'pgr', '75 ml/acre', 75, 75, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], c.id, p.id
FROM crops c, problems p WHERE c.name_en = 'All Crops' AND p.title_en = 'Growth Enhancement' AND p.crop_id = c.id;

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_products_problem_id ON products(problem_id);
CREATE INDEX IF NOT EXISTS idx_products_crop_id ON products(crop_id);
CREATE INDEX IF NOT EXISTS idx_products_name ON products(name);