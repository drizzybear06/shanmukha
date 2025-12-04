-- Shanmukha Agritech Database Seed File
-- Generated: 2024-12-04
-- Contains: 43 Crops, 115 Problems, 60 Products

-- Clear existing data
DELETE FROM analytics;
DELETE FROM product_problems;
DELETE FROM crop_problems;
DELETE FROM products;
DELETE FROM problems;
DELETE FROM crops;

-- ==================== CROPS (43 total) ====================
INSERT INTO crops (id, name_en, name_te, name_hi) VALUES
('a434053a-ec9d-4b30-8a58-520a7f4f72a5', 'Paddy', 'వరి', 'धान'),
('0784ec1c-2112-43be-a58a-c256f1ed0c4a', 'Cotton', 'పత్తి', 'कपास'),
('4e55745b-c5e5-48da-aaba-4f46b0481bea', 'Chilli', 'మిర్చి', 'मिर्च'),
('4bda5d39-442c-423e-b557-34a788b04ff3', 'Tomato', 'టమాటా', 'टमाटर'),
('814ffed6-0650-4aea-a3b7-cdc107250dc7', 'Brinjal', 'వంకాయ', 'बैंगन'),
('36e57053-fdea-4701-a5e1-a93957b46898', 'Bhendi', 'బెండకాయ', 'भिंडी'),
('bf7fc217-8b24-4c63-8701-1094eb315320', 'Cucumber', 'దోసకాయ', 'खीरा'),
('2a2307bd-aa68-4bd4-a64a-fe95971f6cef', 'Watermelon', 'పుచ్చకాయ', 'तरबूज'),
('8c66a42c-5e76-46fb-81a0-dfdc155c5e2a', 'Muskmelon', 'ఖర్బూజ', 'खरबूजा'),
('81a45342-62f6-4616-9f0b-ef93ba8debed', 'Bitter Gourd', 'కాకర', 'करेला'),
('ab030d91-04b8-4e80-808f-490623d6df64', 'Ridge Gourd', 'బీరకాయ', 'तोरई'),
('13e07c1d-9f5f-46a3-9f8a-951ad2d151f8', 'Bottle Gourd', 'సొరకాయ', 'लौकी'),
('adbf26af-062c-4396-aab6-acb325b6c593', 'Pumpkin', 'గుమ్మడికాయ', 'कद्दू'),
('ed469879-f85b-4a59-92af-52f7ca373ed5', 'Cabbage', 'క్యాబేజీ', 'पत्तागोभी'),
('3697634e-827a-496a-8c8b-9303746a2428', 'Cauliflower', 'కాలీఫ్లవర్', 'फूलगोभी'),
('f06c440e-1059-4714-822c-e0edb3b4df19', 'Onion', 'ఉల్లిపాయ', 'प्याज'),
('11eb48d2-0b0c-4f1c-a946-f3984930c780', 'Potato', 'ఆలుగడ్డ', 'आलू'),
('d8d9a35e-d834-46a8-8375-ee0ea97ca697', 'Groundnut', 'వేరుశనగ', 'मूंगफली'),
('f71979e0-502d-4b53-ac55-a15277e273f7', 'Soybean', 'సోయాబీన్', 'सोयाबीन'),
('ec78d86d-3d6a-4403-ab48-69dffd9cff12', 'Sunflower', 'పొద్దుతిరుగుడు', 'सूरजमुखी'),
('fcecf5b4-4186-4a45-ae97-fac0a17c6a8e', 'Maize', 'మొక్కజొన్న', 'मक्का'),
('9fae3f77-0122-45ca-816f-17f915a42737', 'Sugarcane', 'చెరకు', 'गन्ना'),
('bd49f480-9f47-45c5-abf7-61009f4f475a', 'Wheat', 'గోధుమ', 'गेहूं'),
('470c36ac-58f6-4b1a-b661-8acc5e5f6b7c', 'Jowar', 'జొన్న', 'ज्वार'),
('e1050a84-3565-41ba-8475-6f7756cc6a4e', 'Bajra', 'సజ్జ', 'बाजरा'),
('3b3b3e85-a6b9-4fec-b0ab-8a65cee37008', 'Red Gram', 'కంది', 'अरहर'),
('267c1fc0-557a-4245-baa0-7c2066513dae', 'Black Gram', 'మినుము', 'उड़द'),
('fd9b5f8c-20e9-4e6f-a332-05dc1acd9c5a', 'Green Gram', 'పెసర', 'मूंग'),
('be4a4e85-2b63-4a64-ab6d-284d02c7549e', 'Bengal Gram', 'శనగలు', 'चना'),
('27febf97-f9a4-466d-a9cf-4cab114d2e2c', 'Mango', 'మామిడి', 'आम'),
('5a3ea690-c50b-44e9-81fb-ac44dfbe5b46', 'Banana', 'అరటి', 'केला'),
('3537573b-6e33-444d-b830-d74ebf1ef10c', 'Grapes', 'ద్రాక్ష', 'अंगूर'),
('421c4594-975c-4c62-ac6d-58f7b5731825', 'Pomegranate', 'దానిమ్మ', 'अनार'),
('4d5556ea-dbcf-4d46-9038-d8b81a0c9936', 'Citrus', 'నారింజ', 'नींबू वर्गीय'),
('a9db9bd5-8120-4538-aa27-a1820c2cb48f', 'Apple', 'ఆపిల్', 'सेब'),
('e7619a02-04f7-48bc-b2c0-8d95e2944377', 'Guava', 'జామ', 'अमरूद'),
('ec46b38b-1316-4a14-87e6-817c22159b29', 'Papaya', 'బొప్పాయి', 'पपीता'),
('70012065-347f-4b17-9263-8f98a3d92bce', 'Coconut', 'కొబ్బరి', 'नारियल'),
('c05c76c3-3e66-4f4c-a98b-5e81028d9643', 'Arecanut', 'పోక', 'सुपारी'),
('f24d889d-e7b7-4dc5-ab07-d572fe3fd9e3', 'Tea', 'టీ', 'चाय'),
('71ebad91-5160-4e11-b8ec-287d6c366dc2', 'Coffee', 'కాఫీ', 'कॉफी'),
('8737adb1-cb5a-490d-926e-38daf8c45ee5', 'Cardamom', 'ఏలకులు', 'इलायची'),
('27200c49-ff31-4548-807f-86eca3708605', 'Turmeric', 'పసుపు', 'हल्दी');

-- ==================== PROBLEMS (115 total) ====================
-- Paddy Problems
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type) VALUES
('Stem Borer', 'తొలిచే పురుగు', 'तना छेदक', 'a434053a-ec9d-4b30-8a58-520a7f4f72a5', 'pest'),
('BPH (Brown Plant Hopper)', 'దోమ పురుగు', 'भूरा फुदका', 'a434053a-ec9d-4b30-8a58-520a7f4f72a5', 'pest'),
('Leaf Folder', 'ఆకు ముడత పురుగు', 'पत्ती लपेटक', 'a434053a-ec9d-4b30-8a58-520a7f4f72a5', 'pest'),
('Sheath Blight', 'తొడుగు ఎండు తెగులు', 'शीथ ब्लाइट', 'a434053a-ec9d-4b30-8a58-520a7f4f72a5', 'disease'),
('Weeds', 'కలుపు మొక్కలు', 'खरपतवार', 'a434053a-ec9d-4b30-8a58-520a7f4f72a5', 'weed'),
('Gall Midge', 'గడ్డి ఈగ', 'गॉल मिज', 'a434053a-ec9d-4b30-8a58-520a7f4f72a5', 'pest'),
-- Cotton Problems
('American Bollworm', 'అమెరికన్ కాయతొలుచు పురుగు', 'अमेरिकन बॉलवर्म', '0784ec1c-2112-43be-a58a-c256f1ed0c4a', 'pest'),
('Jassids', 'పేనుబంక', 'जैसिड', '0784ec1c-2112-43be-a58a-c256f1ed0c4a', 'pest'),
('Aphids', 'పేను పురుగు', 'माहू', '0784ec1c-2112-43be-a58a-c256f1ed0c4a', 'pest'),
('Whitefly', 'తెల్ల దోమ', 'सफेद मक्खी', '0784ec1c-2112-43be-a58a-c256f1ed0c4a', 'pest'),
('Thrips', 'తామర పురుగులు', 'थ्रिप्स', '0784ec1c-2112-43be-a58a-c256f1ed0c4a', 'pest'),
('Mites', 'మైట్స్', 'माइट्स', '0784ec1c-2112-43be-a58a-c256f1ed0c4a', 'pest'),
('Weeds', 'కలుపు మొక్కలు', 'खरपतवार', '0784ec1c-2112-43be-a58a-c256f1ed0c4a', 'weed'),
-- Chilli Problems
('Thrips', 'తామర పురుగులు', 'थ्रिप्स', '4e55745b-c5e5-48da-aaba-4f46b0481bea', 'pest'),
('Mites', 'మైట్స్', 'माइट्स', '4e55745b-c5e5-48da-aaba-4f46b0481bea', 'pest'),
('Aphids', 'పేను పురుగు', 'माहू', '4e55745b-c5e5-48da-aaba-4f46b0481bea', 'pest'),
('Anthracnose', 'తెగులు', 'एन्थ्रेक्नोज', '4e55745b-c5e5-48da-aaba-4f46b0481bea', 'disease'),
('Damping Off', 'మొలక తెగులు', 'डैम्पिंग ऑफ', '4e55745b-c5e5-48da-aaba-4f46b0481bea', 'disease'),
('Fruit Borer', 'కాయ తొలుచు పురుగు', 'फल छेदक', '4e55745b-c5e5-48da-aaba-4f46b0481bea', 'pest'),
-- Tomato Problems
('Fruit Borer', 'కాయ తొలుచు పురుగు', 'फल छेदक', '4bda5d39-442c-423e-b557-34a788b04ff3', 'pest'),
('Whitefly', 'తెల్ల దోమ', 'सफेद मक्खी', '4bda5d39-442c-423e-b557-34a788b04ff3', 'pest'),
('Early Blight', 'ఆకు మచ్చ తెగులు', 'अगेती झुलसा', '4bda5d39-442c-423e-b557-34a788b04ff3', 'disease'),
('Late Blight', 'ఆలస్య ఎండు తెగులు', 'पछेती झुलसा', '4bda5d39-442c-423e-b557-34a788b04ff3', 'disease'),
('Mites', 'మైట్స్', 'माइट्स', '4bda5d39-442c-423e-b557-34a788b04ff3', 'pest'),
('Jassids', 'పేనుబంక', 'जैसिड', '4bda5d39-442c-423e-b557-34a788b04ff3', 'pest'),
-- Brinjal Problems
('Shoot and Fruit Borer', 'కాండం మరియు పండు తొలుచు పురుగు', 'तना और फल छेदक', '814ffed6-0650-4aea-a3b7-cdc107250dc7', 'pest'),
('Jassids', 'పేనుబంక', 'जैसिड', '814ffed6-0650-4aea-a3b7-cdc107250dc7', 'pest'),
('Aphids', 'పేను పురుగు', 'माहू', '814ffed6-0650-4aea-a3b7-cdc107250dc7', 'pest'),
('Whitefly', 'తెల్ల దోమ', 'सफेद मक्खी', '814ffed6-0650-4aea-a3b7-cdc107250dc7', 'pest'),
-- Maize Problems
('Fall Armyworm', 'ఫాల్ ఆర్మీవార్మ్', 'फॉल आर्मीवर्म', 'fcecf5b4-4186-4a45-ae97-fac0a17c6a8e', 'pest'),
('Stem Borer', 'తొలిచే పురుగు', 'तना छेदक', 'fcecf5b4-4186-4a45-ae97-fac0a17c6a8e', 'pest'),
('Weeds', 'కలుపు మొక్కలు', 'खरपतवार', 'fcecf5b4-4186-4a45-ae97-fac0a17c6a8e', 'weed'),
-- Sugarcane Problems
('Early Shoot Borer', 'తొలి మొలక తొలుచు పురుగు', 'आरंभिक तना छेदक', '9fae3f77-0122-45ca-816f-17f915a42737', 'pest'),
('Internode Borer', 'కణుపు తొలుచు పురుగు', 'गांठ छेदक', '9fae3f77-0122-45ca-816f-17f915a42737', 'pest'),
('Root Grub', 'వేరు పురుగు', 'जड़ ग्रब', '9fae3f77-0122-45ca-816f-17f915a42737', 'pest'),
-- Grapes Problems
('Thrips', 'తామర పురుగులు', 'थ्रिप्स', '3537573b-6e33-444d-b830-d74ebf1ef10c', 'pest'),
('Mealybug', 'పిండి నల్లి', 'मिलीबग', '3537573b-6e33-444d-b830-d74ebf1ef10c', 'pest'),
('Downy Mildew', 'బూజు తెగులు', 'मृदुरोमिल आसिता', '3537573b-6e33-444d-b830-d74ebf1ef10c', 'disease'),
('Anthracnose', 'తెగులు', 'एन्थ्रेक्नोज', '3537573b-6e33-444d-b830-d74ebf1ef10c', 'disease'),
('Powdery Mildew', 'బూడిద తెగులు', 'पाउडरी मिल्ड्यू', '3537573b-6e33-444d-b830-d74ebf1ef10c', 'disease'),
('Poor Fruit Set', 'తక్కువ కాపు', 'कम फल लगना', '3537573b-6e33-444d-b830-d74ebf1ef10c', 'physiological'),
-- Mango Problems
('Hopper', 'హాపర్', 'हॉपर', '27febf97-f9a4-466d-a9cf-4cab114d2e2c', 'pest'),
('Fruit Fly', 'పండు ఈగ', 'फल मक्खी', '27febf97-f9a4-466d-a9cf-4cab114d2e2c', 'pest'),
('Anthracnose', 'తెగులు', 'एन्थ्रेक्नोज', '27febf97-f9a4-466d-a9cf-4cab114d2e2c', 'disease'),
-- Pomegranate Problems
('Fruit Borer', 'కాయ తొలుచు పురుగు', 'फल छेदक', '421c4594-975c-4c62-ac6d-58f7b5731825', 'pest'),
('Bacterial Blight', 'బాక్టీరియా ఎండు తెగులు', 'जीवाणु झुलसा', '421c4594-975c-4c62-ac6d-58f7b5731825', 'disease'),
('Thrips', 'తామర పురుగులు', 'थ्रिप्स', '421c4594-975c-4c62-ac6d-58f7b5731825', 'pest'),
-- Tea Problems
('Red Spider Mite', 'ఎర్ర సాలె పురుగు', 'लाल मकड़ी', 'f24d889d-e7b7-4dc5-ab07-d572fe3fd9e3', 'pest'),
('Blister Blight', 'బొబ్బ తెగులు', 'ब्लिस्टर ब्लाइट', 'f24d889d-e7b7-4dc5-ab07-d572fe3fd9e3', 'disease'),
-- Potato Problems
('Late Blight', 'ఆలస్య ఎండు తెగులు', 'पछेती झुलसा', '11eb48d2-0b0c-4f1c-a946-f3984930c780', 'disease'),
('Early Blight', 'ఆకు మచ్చ తెగులు', 'अगेती झुलसा', '11eb48d2-0b0c-4f1c-a946-f3984930c780', 'disease'),
('Aphids', 'పేను పురుగు', 'माहू', '11eb48d2-0b0c-4f1c-a946-f3984930c780', 'pest'),
-- Citrus Problems
('Canker', 'కాంకర్ తెగులు', 'कैंकर', '4d5556ea-dbcf-4d46-9038-d8b81a0c9936', 'disease'),
('Citrus Psylla', 'సిట్రస్ సిల్లా', 'सिट्रस सिल्ला', '4d5556ea-dbcf-4d46-9038-d8b81a0c9936', 'pest'),
('Root Rot', 'వేరు తెగులు', 'जड़ सड़न', '4d5556ea-dbcf-4d46-9038-d8b81a0c9936', 'disease'),
-- Wheat Problems
('Weeds', 'కలుపు మొక్కలు', 'खरपतवार', 'bd49f480-9f47-45c5-abf7-61009f4f475a', 'weed'),
('Aphids', 'పేను పురుగు', 'माहू', 'bd49f480-9f47-45c5-abf7-61009f4f475a', 'pest'),
-- Soybean Problems
('Weeds', 'కలుపు మొక్కలు', 'खरपतवार', 'f71979e0-502d-4b53-ac55-a15277e273f7', 'weed'),
('Girdle Beetle', 'గర్డల్ బీటిల్', 'गर्डल बीटल', 'f71979e0-502d-4b53-ac55-a15277e273f7', 'pest'),
-- Cabbage Problems
('Diamond Back Moth', 'డైమండ్ బ్యాక్ మాత్', 'डायमंड बैक मॉथ', 'ed469879-f85b-4a59-92af-52f7ca373ed5', 'pest'),
('Aphids', 'పేను పురుగు', 'माहू', 'ed469879-f85b-4a59-92af-52f7ca373ed5', 'pest'),
-- Cauliflower Problems
('Diamond Back Moth', 'డైమండ్ బ్యాక్ మాత్', 'डायमंड बैक मॉथ', '3697634e-827a-496a-8c8b-9303746a2428', 'pest'),
-- Onion Problems
('Thrips', 'తామర పురుగులు', 'थ्रिप्स', 'f06c440e-1059-4714-822c-e0edb3b4df19', 'pest'),
('Purple Blotch', 'పర్పుల్ బ్లాచ్', 'पर्पल ब्लॉच', 'f06c440e-1059-4714-822c-e0edb3b4df19', 'disease'),
-- Banana Problems
('Banana Weevil', 'అరటి గొంగళి పురుగు', 'केला घुन', '5a3ea690-c50b-44e9-81fb-ac44dfbe5b46', 'pest'),
('Thrips', 'తామర పురుగులు', 'थ्रिप्स', '5a3ea690-c50b-44e9-81fb-ac44dfbe5b46', 'pest'),
-- Cucumber Problems
('Downy Mildew', 'బూజు తెగులు', 'मृदुरोमिल आसिता', 'bf7fc217-8b24-4c63-8701-1094eb315320', 'disease'),
('Fruit Fly', 'పండు ఈగ', 'फल मक्खी', 'bf7fc217-8b24-4c63-8701-1094eb315320', 'pest'),
-- Watermelon Problems
('Fruit Fly', 'పండు ఈగ', 'फल मक्खी', '2a2307bd-aa68-4bd4-a64a-fe95971f6cef', 'pest'),
-- Cardamom Problems
('Capsule Rot', 'కాయ కుళ్ళు తెగులు', 'कैप्सूल सड़न', '8737adb1-cb5a-490d-926e-38daf8c45ee5', 'disease'),
('Thrips', 'తామర పురుగులు', 'थ్रిప్స', '8737adb1-cb5a-490d-926e-38daf8c45ee5', 'pest'),
-- Sunflower Problems
('Head Borer', 'తల తొలుచు పురుగు', 'सिर छेदक', 'ec78d86d-3d6a-4403-ab48-69dffd9cff12', 'pest');

-- ==================== PRODUCTS (60+ total) ====================
-- Paddy Insecticides
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Dhanraja', 'Chlorantraniliprole 0.4% GR', 'insecticide', '4 kg/acre', 4, 4, 'kg', ARRAY['4 kg'], '15-20 days', 'Apply in standing water', 'Ryanodine receptor modulator', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Paddy' AND p.title_en='Stem Borer' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Dobermin', 'Chlorantraniliprole 18.5% SC', 'insecticide', '60 ml/acre', 60, 60, 'ml', ARRAY['100 ml', '250 ml'], '15-20 days', 'Do not mix with alkaline pesticides', 'Ryanodine receptor modulator', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Paddy' AND p.title_en='Stem Borer' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Dhanzyme Gold', 'Thiamethoxam 25% WG', 'insecticide', '100 gm/acre', 100, 100, 'gm', ARRAY['100 gm', '250 gm'], '15-20 days', 'Safe for beneficial insects', 'Nicotinic acetylcholine receptor agonist', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Paddy' AND p.title_en='BPH (Brown Plant Hopper)' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Dhanprid', 'Imidacloprid 17.8% SL', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], '15-20 days', 'Toxic to bees', 'Nicotinic acetylcholine receptor agonist', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Paddy' AND p.title_en='BPH (Brown Plant Hopper)' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Dhanpreet', 'Acephate 75% SP', 'insecticide', '400 gm/acre', 400, 400, 'gm', ARRAY['100 gm', '250 gm', '500 gm', '1 kg'], '15-20 days', 'Wear protective equipment', 'Acetylcholinesterase inhibitor', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Paddy' AND p.title_en='Leaf Folder' AND p.crop_id=c.id;

-- Paddy Fungicides
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Dhanustin', 'Carbendazim 50% WP', 'fungicide', '200 gm/acre', 200, 200, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], '10-15 days', 'Compatible with most pesticides', 'Mitosis inhibitor', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Paddy' AND p.title_en='Sheath Blight' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Amistar', 'Azoxystrobin 23% SC', 'fungicide', '200 ml/acre', 200, 200, 'ml', ARRAY['100 ml', '200 ml', '500 ml'], '10-15 days', 'Broad spectrum systemic', 'QoI fungicide', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Paddy' AND p.title_en='Sheath Blight' AND p.crop_id=c.id;

-- Paddy Herbicides
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Shanmix', '2,4-D Sodium Salt 80% WP', 'herbicide', '250 gm/acre', 250, 250, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], 'Pre-emergence', 'Avoid spray drift', 'Synthetic auxin', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Paddy' AND p.title_en='Weeds' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Nominee Gold', 'Bispyribac Sodium 10% SC', 'herbicide', '100 ml/acre', 100, 100, 'ml', ARRAY['50 ml', '100 ml', '250 ml'], 'Post-emergence', 'Apply 15-25 DAT', 'ALS inhibitor', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Paddy' AND p.title_en='Weeds' AND p.crop_id=c.id;

-- Cotton Insecticides
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Dhanuka Lancer Gold', 'Acephate 50% + Imidacloprid 1.8% SP', 'insecticide', '400 gm/acre', 400, 400, 'gm', ARRAY['100 gm', '250 gm', '500 gm', '1 kg'], '15-20 days', 'Do not apply during hot hours', 'Dual mode of action', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Cotton' AND p.title_en='Jassids' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Largo', 'Spinosad 45% SC', 'insecticide', '75 ml/acre', 75, 75, 'ml', ARRAY['75 ml', '150 ml'], '10-14 days', 'Derived from soil bacterium', 'Nicotinic acetylcholine receptor modulator', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Cotton' AND p.title_en='American Bollworm' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'EM-1', 'Emamectin Benzoate 5% SG', 'insecticide', '80 gm/acre', 80, 80, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], '10-15 days', 'Highly effective against bollworms', 'Chloride channel activator', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Cotton' AND p.title_en='American Bollworm' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Sempra', 'Novaluron 10% EC', 'insecticide', '300 ml/acre', 300, 300, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], '15-20 days', 'Controls immature stages', 'Chitin synthesis inhibitor', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Cotton' AND p.title_en='Whitefly' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Omite', 'Propargite 57% EC', 'insecticide', '400 ml/acre', 400, 400, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], '15-20 days', 'Specific to mites', 'Sulfite ester acaricide', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Cotton' AND p.title_en='Mites' AND p.crop_id=c.id;

-- Cotton Herbicides
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Tendulum Extra', 'Pendimethalin 30% EC', 'herbicide', '1-1.5 L/acre', 1000, 1500, 'ml', ARRAY['500 ml', '1 L', '5 L'], 'Pre-emergence', 'Apply on moist soil', 'Microtubule assembly inhibitor', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Cotton' AND p.title_en='Weeds' AND p.crop_id=c.id;

-- Tomato Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Coragen', 'Chlorantraniliprole 18.5% SC', 'insecticide', '60 ml/acre', 60, 60, 'ml', ARRAY['30 ml', '60 ml', '150 ml'], '15-20 days', 'Highly effective, low toxicity', 'Anthranilic diamide', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Tomato' AND p.title_en='Fruit Borer' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Areva', 'Thiamethoxam 25% WG', 'insecticide', '80 gm/acre', 80, 80, 'gm', ARRAY['40 gm', '100 gm', '250 gm'], '15-20 days', 'Effective against whitefly', 'Neonicotinoid', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Tomato' AND p.title_en='Whitefly' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Kavach', 'Chlorothalonil 75% WP', 'fungicide', '400 gm/acre', 400, 400, 'gm', ARRAY['250 gm', '500 gm', '1 kg'], '10-15 days', 'Preventive fungicide', 'Multi-site contact', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Tomato' AND p.title_en='Early Blight' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Curzate M8', 'Cymoxanil 8% + Mancozeb 64% WP', 'fungicide', '500 gm/acre', 500, 500, 'gm', ARRAY['250 gm', '500 gm', '1 kg'], '7-10 days', 'Preventive and curative', 'Multi-site + systemic', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Tomato' AND p.title_en='Late Blight' AND p.crop_id=c.id;

-- Maize Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Ampligo', 'Chlorantraniliprole 9.3% + Lambda-cyhalothrin 4.6% ZC', 'insecticide', '80 ml/acre', 80, 80, 'ml', ARRAY['40 ml', '80 ml', '200 ml'], '10-15 days', 'Excellent for Fall Armyworm', 'Combination insecticide', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Maize' AND p.title_en='Fall Armyworm' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Delegate', 'Spinetoram 11.7% SC', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['50 ml', '100 ml', '200 ml'], '10-14 days', 'Effective against FAW', 'Nicotinic receptor modulator', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Maize' AND p.title_en='Fall Armyworm' AND p.crop_id=c.id;

-- Grapes Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Rimon', 'Novaluron 10% EC', 'insecticide', '200 ml/acre', 200, 200, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], '10-15 days', 'Safe for grape berries', 'Chitin synthesis inhibitor', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Grapes' AND p.title_en='Thrips' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Confidor', 'Imidacloprid 17.8% SL', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['50 ml', '100 ml', '250 ml'], '15-20 days', 'Effective for mealybug', 'Neonicotinoid', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Grapes' AND p.title_en='Mealybug' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Cabrio Top', 'Pyraclostrobin 5% + Metiram 55% WG', 'fungicide', '600 gm/acre', 600, 600, 'gm', ARRAY['300 gm', '600 gm', '1 kg'], '10-14 days', 'Broad spectrum protection', 'QoI + Multi-site', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Grapes' AND p.title_en='Downy Mildew' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Custodia', 'Azoxystrobin 11% + Tebuconazole 18.3% SC', 'fungicide', '200 ml/acre', 200, 200, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], '10-15 days', 'Preventive and curative', 'QoI + DMI', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Grapes' AND p.title_en='Anthracnose' AND p.crop_id=c.id;

-- Mango Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Tatamida', 'Imidacloprid 17.8% SL', 'insecticide', '100 ml/acre', 100, 100, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], '15-20 days', 'Apply during flowering', 'Neonicotinoid', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Mango' AND p.title_en='Hopper' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Karate', 'Lambda-cyhalothrin 5% EC', 'insecticide', '200 ml/acre', 200, 200, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], '15-20 days', 'Quick knockdown action', 'Sodium channel modulator', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Mango' AND p.title_en='Fruit Fly' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Bavistin', 'Carbendazim 50% WP', 'fungicide', '200 gm/acre', 200, 200, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], '10-15 days', 'Effective against anthracnose', 'Mitosis inhibitor', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Mango' AND p.title_en='Anthracnose' AND p.crop_id=c.id;

-- Potato Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Mancozeb', 'Mancozeb 75% WP', 'fungicide', '500 gm/acre', 500, 500, 'gm', ARRAY['250 gm', '500 gm', '1 kg'], '7-10 days', 'Multi-site contact fungicide', 'Multi-site contact', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Potato' AND p.title_en='Late Blight' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Ridomil Gold', 'Metalaxyl 4% + Mancozeb 64% WP', 'fungicide', '500 gm/acre', 500, 500, 'gm', ARRAY['250 gm', '500 gm', '1 kg'], '10-15 days', 'Excellent for oomycete diseases', 'RNA polymerase inhibitor', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Potato' AND p.title_en='Late Blight' AND p.crop_id=c.id;

-- Sugarcane Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Ferterra', 'Chlorantraniliprole 0.4% GR', 'insecticide', '4 kg/acre', 4, 4, 'kg', ARRAY['4 kg', '10 kg'], '30-45 days', 'Apply at planting', 'Ryanodine receptor modulator', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Sugarcane' AND p.title_en='Early Shoot Borer' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Regent', 'Fipronil 0.3% GR', 'insecticide', '8 kg/acre', 8, 8, 'kg', ARRAY['5 kg', '10 kg'], '30-45 days', 'Effective against root grubs', 'GABA receptor antagonist', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Sugarcane' AND p.title_en='Root Grub' AND p.crop_id=c.id;

-- Pomegranate Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Tracer', 'Spinosad 44.03% SC', 'insecticide', '75 ml/acre', 75, 75, 'ml', ARRAY['50 ml', '100 ml', '200 ml'], '10-14 days', 'IPM compatible', 'Nicotinic receptor modulator', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Pomegranate' AND p.title_en='Fruit Borer' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Streptocycline', 'Streptomycin Sulphate 90% + Tetracycline 10%', 'fungicide', '6 gm/15L water', 6, 6, 'gm', ARRAY['6 gm', '15 gm', '30 gm'], '10-15 days', 'Mix with copper fungicide', 'Antibiotic', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Pomegranate' AND p.title_en='Bacterial Blight' AND p.crop_id=c.id;

-- Tea Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Pegasus', 'Diafenthiuron 50% WP', 'insecticide', '320 gm/acre', 320, 320, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], '10-14 days', 'Effective against red spider mite', 'Mitochondrial ATP synthesis inhibitor', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Tea' AND p.title_en='Red Spider Mite' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Tilt', 'Propiconazole 25% EC', 'fungicide', '200 ml/acre', 200, 200, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], '10-15 days', 'Curative and protective', 'DMI fungicide', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Tea' AND p.title_en='Blister Blight' AND p.crop_id=c.id;

-- Citrus Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Kocide', 'Copper Hydroxide 53.8% DF', 'fungicide', '400 gm/acre', 400, 400, 'gm', ARRAY['200 gm', '500 gm', '1 kg'], '10-15 days', 'Protective action', 'Multi-site contact', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Citrus' AND p.title_en='Canker' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Aliette', 'Fosetyl-AL 80% WP', 'fungicide', '500 gm/acre', 500, 500, 'gm', ARRAY['250 gm', '500 gm', '1 kg'], '10-15 days', 'Upward and downward movement', 'Stimulates plant defense', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Citrus' AND p.title_en='Root Rot' AND p.crop_id=c.id;

-- Chilli Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Nagata', 'Fipronil 5% SC', 'insecticide', '400-600 ml/acre', 400, 600, 'ml', ARRAY['100 ml', '250 ml', '500 ml', '1 L'], '15-20 days', 'Broad spectrum', 'GABA receptor antagonist', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Chilli' AND p.title_en='Thrips' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Dhanucop', 'Copper Oxychloride 50% WP', 'fungicide', '500-600 gm/acre', 500, 600, 'gm', ARRAY['250 gm', '500 gm', '1 kg'], '10-15 days', 'Do not mix with lime', 'Multi-site contact', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Chilli' AND p.title_en='Anthracnose' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Vitavax Power', 'Carboxin 37.5% + Thiram 37.5% WS', 'fungicide', '2 gm/kg seed', 2, 2, 'gm', ARRAY['100 gm', '250 gm'], 'Seed treatment', 'Treat seeds before sowing', 'Dual action fungicide', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Chilli' AND p.title_en='Damping Off' AND p.crop_id=c.id;

-- Brinjal Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Caldan', 'Cartap Hydrochloride 50% SP', 'insecticide', '400 gm/acre', 400, 400, 'gm', ARRAY['100 gm', '250 gm', '500 gm'], '10-15 days', 'Effective against borer', 'Nereistoxin analogue', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Brinjal' AND p.title_en='Shoot and Fruit Borer' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Fame', 'Flubendiamide 20% WG', 'insecticide', '50 gm/acre', 50, 50, 'gm', ARRAY['25 gm', '50 gm', '100 gm'], '15-20 days', 'Low toxicity to beneficials', 'Ryanodine receptor modulator', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Brinjal' AND p.title_en='Shoot and Fruit Borer' AND p.crop_id=c.id;

-- Cabbage Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Proclaim', 'Emamectin Benzoate 5% SG', 'insecticide', '80 gm/acre', 80, 80, 'gm', ARRAY['50 gm', '100 gm', '250 gm'], '10-15 days', 'Excellent for DBM', 'Chloride channel activator', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Cabbage' AND p.title_en='Diamond Back Moth' AND p.crop_id=c.id;

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Lorsban', 'Chlorpyrifos 20% EC', 'insecticide', '500 ml/acre', 500, 500, 'ml', ARRAY['250 ml', '500 ml', '1 L'], '15-20 days', 'Broad spectrum', 'Acetylcholinesterase inhibitor', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Cabbage' AND p.title_en='Aphids' AND p.crop_id=c.id;

-- Wheat Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Buctril', 'Bromoxynil 27.7% EC', 'herbicide', '400 ml/acre', 400, 400, 'ml', ARRAY['200 ml', '500 ml', '1 L'], 'Post-emergence', 'Apply at 2-4 leaf stage', 'Photosystem II inhibitor', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Wheat' AND p.title_en='Weeds' AND p.crop_id=c.id;

-- Soybean Products
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max, dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id) 
SELECT 'Imazethapyr', 'Imazethapyr 10% SL', 'herbicide', '300 ml/acre', 300, 300, 'ml', ARRAY['100 ml', '250 ml', '500 ml'], 'Post-emergence', 'Apply 15-20 DAS', 'ALS inhibitor', c.id, p.id
FROM crops c, problems p WHERE c.name_en='Soybean' AND p.title_en='Weeds' AND p.crop_id=c.id;

-- Add indexes for performance
CREATE INDEX IF NOT EXISTS idx_crops_name_en ON crops(name_en);
CREATE INDEX IF NOT EXISTS idx_problems_crop_id ON problems(crop_id);
CREATE INDEX IF NOT EXISTS idx_problems_title_en ON problems(title_en);
CREATE INDEX IF NOT EXISTS idx_products_problem_id ON products(problem_id);
CREATE INDEX IF NOT EXISTS idx_products_crop_id ON products(crop_id);
CREATE INDEX IF NOT EXISTS idx_products_name ON products(name);

-- End of seed file
