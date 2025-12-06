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
('27200c49-ff31-4548-807f-86eca3708605', 'Turmeric', 'పసుపు', 'हल्दी'),
('99999999-aaaa-bbbb-cccc-111111111111', 'Mustard', 'ఆవాలు', 'सरसों');


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
-- ==================== MISSING PROBLEMS FROM WORD DOCS ====================

-- Paddy extra pests
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Green Leaf Hopper', 'ఆకుపచ్చ తేమ పురుగు', 'हरा फुदका', c.id, 'pest'
FROM crops c WHERE c.name_en='Paddy';

INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'White Backed Plant Hopper', 'వెన్నెల దోమ', 'सफेद फुदका', c.id, 'pest'
FROM crops c WHERE c.name_en='Paddy';

INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Rice Hispa', 'ఆకు చీల్చు పురుగు', 'राइस हिस्पा', c.id, 'pest'
FROM crops c WHERE c.name_en='Paddy';

INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Thrips', 'తామర పురుగు', 'थ्रिप्स', c.id, 'pest'
FROM crops c WHERE c.name_en='Paddy';

-- Cotton missing
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Pink Bollworm', 'గులాబీ కాయతొలుచు పురుగు', 'गुलाबी सुंडी', c.id, 'pest'
FROM crops c WHERE c.name_en='Cotton';

INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Spotted Bollworm', 'మచ్చల కాయతొలుచు పురుగు', 'चित्तीदार सुंडी', c.id, 'pest'
FROM crops c WHERE c.name_en='Cotton';

-- Tomato missing
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Red Spider Mite', 'ఎర్ర సాలె పురుగు', 'लाल मकड़ी', c.id, 'pest'
FROM crops c WHERE c.name_en='Tomato';

INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Leaf Miner', 'ఆకు త్రవ్వు పురుగు', 'लीफ माइनर', c.id, 'pest'
FROM crops c WHERE c.name_en='Tomato';

-- Groundnut missing
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Leaf Miner', 'ఆకు త్రవ్వు పురుగు', 'लीफ माइनर', c.id, 'pest'
FROM crops c WHERE c.name_en='Groundnut';

-- Chilli missing diseases
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Powdery Mildew', 'బూడిద తెగులు', 'पाउडरी मिल्ड्यू', c.id, 'disease'
FROM crops c WHERE c.name_en='Chilli';

INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Die Back', 'డై బ్యాక్', 'डाइ बैक', c.id, 'disease'
FROM crops c WHERE c.name_en='Chilli';

-- Onion missing
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Stemphylium Blight', 'స్టెమ్ ఫిలియం తెగులు', 'स्टेम्फिलियम ब्लाइट', c.id, 'disease'
FROM crops c WHERE c.name_en='Onion';

-- Cucumber missing
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Powdery Mildew', 'బూడిద తెగులు', 'पाउडरी मिल्ड्यू', c.id, 'disease'
FROM crops c WHERE c.name_en='Cucumber';

-- Watermelon missing
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Downy Mildew', 'బూజు తెగులు', 'डाउनी मिल्ड्यू', c.id, 'disease'
FROM crops c WHERE c.name_en='Watermelon';

-- Banana missing
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Sigatoka Leaf Spot', 'సిగటోకా ఆకుమచ్చ', 'सिगाटोका पत्ती धब्बा', c.id, 'disease'
FROM crops c WHERE c.name_en='Banana';

-- Mustard missing
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'White Rust', 'తెల్ల తుప్పు తెగులు', 'सफेद रतुआ', c.id, 'disease'
FROM crops c WHERE c.name_en='Mustard';

-- Wheat Rust
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Rust', 'తుప్పు తెగులు', 'रतुआ', id, 'disease'
FROM crops WHERE name_en='Wheat';

-- Groundnut Leaf Spot
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Leaf Spot', 'ఆకు మచ్చ తెగులు', 'पत्ती धब्बा', id, 'disease'
FROM crops WHERE name_en='Groundnut';

-- Bhendi Whitefly (used in Megasus)
INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Whitefly', 'తెల్ల దోమ', 'सफेद मक्खी', id, 'pest'
FROM crops WHERE name_en='Bhendi';

INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Powdery Mildew', 'బూడిద తెగులు', 'पाउडरी मिल्ड्यू', id, 'disease'
FROM crops WHERE name_en='Mango';


INSERT INTO problems (title_en, title_te, title_hi, crop_id, problem_type)
SELECT 'Weeds', 'కలుపు మొక్కలు', 'खरपतवार', id, 'weed'
FROM crops WHERE name_en='Potato';


-- ==================== PRODUCTS (60+ total) ====================
--- ==================== PRODUCTS (Shanmukha – CLEAN MAPPING) ====================
-- NOTE:
-- 1) Keep your CROPS and PROBLEMS inserts exactly as in your current seed.sql.
-- 2) Delete or comment out the OLD PRODUCTS block completely.
-- 3) Then paste this whole PRODUCTS block.

-- ========== INSECTICIDES ==========

-- Niwesh – Imidacloprid 30.5% SC (Rice, Cotton)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Niwesh', 'Imidacloprid 30.5% SC', 'insecticide',
       '60–80 ml/acre', 60, 80, 'ml',
       ARRAY['100 ml', '250 ml', '500 ml', '1 L'],
       '10–15 days',
       'Avoid spraying during peak bee activity.',
       'Neonicotinoid; acts on nicotinic acetylcholine receptors.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Paddy' AND p.crop_id=c.id AND p.title_en='BPH (Brown Plant Hopper)';

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Niwesh', 'Imidacloprid 30.5% SC', 'insecticide',
       '50–60 ml/acre', 50, 60, 'ml',
       ARRAY['100 ml', '250 ml', '500 ml'],
       '10–15 days',
       'Target sucking pests only; do not exceed recommended dose.',
       'Neonicotinoid; systemic and contact action.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Cotton' AND p.crop_id=c.id AND p.title_en='Aphids';



-- Shanthoxam – Thiamethoxam 25% WG (Paddy)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Shanthoxam', 'Thiamethoxam 25% WG', 'insecticide',
       '40–80 g/acre', 40, 80, 'gm',
       ARRAY['40 gm', '100 gm', '250 gm'],
       '10–15 days',
       'Do not mix with strong alkaline products.',
       'Neonicotinoid; systemic insecticide.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Paddy' AND p.crop_id=c.id AND p.title_en='BPH (Brown Plant Hopper)';



-- Ryz – Dinotefuran 20% SG (Paddy, Cotton)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Ryz', 'Dinotefuran 20% SG', 'insecticide',
       '60–80 g/acre', 60, 80, 'gm',
       ARRAY['60 gm', '120 gm', '250 gm'],
       '10–15 days',
       'Ensure uniform coverage on lower canopy.',
       'Neonicotinoid with translaminar and systemic action.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Paddy' AND p.crop_id=c.id AND p.title_en='BPH (Brown Plant Hopper)';

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Ryz', 'Dinotefuran 20% SG', 'insecticide',
       '60–80 g/acre', 60, 80, 'gm',
       ARRAY['60 gm', '120 gm', '250 gm'],
       '10–15 days',
       'Controls major sucking pests in cotton.',
       'Neonicotinoid; acts on nicotinic receptors.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Cotton' AND p.crop_id=c.id AND p.title_en='Whitefly';



-- Dominator – Imidacloprid 17.8% SL (Paddy – BPH)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Dominator', 'Imidacloprid 17.8% SL', 'insecticide',
       '60–80 ml/acre', 60, 80, 'ml',
       ARRAY['100 ml', '250 ml', '500 ml', '1 L'],
       '10–15 days',
       'Avoid repeated use for resistance management.',
       'Systemic neonicotinoid; root and foliar uptake.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Paddy' AND p.crop_id=c.id AND p.title_en='BPH (Brown Plant Hopper)';



-- Dominator Ultra – Dinotefuran 15% + Pymetrozine 45% WG (Paddy hopper complex)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Dominator Ultra', 'Dinotefuran 15% + Pymetrozine 45% WG', 'insecticide',
       '133.2 g/acre', 133, 133, 'gm',
       ARRAY['133 gm', '250 gm'],
       '10–15 days',
       'Excellent on BPH, WBPH, GLH and ear head bug.',
       'Combination of neonicotinoid + feeding blocker.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Paddy' AND p.crop_id=c.id AND p.title_en='BPH (Brown Plant Hopper)';



-- Polidar 4G – Cartap Hydrochloride 4% GR (Paddy borer & leaf folder)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Polidar 4G', 'Cartap Hydrochloride 4% GR', 'insecticide',
       '7.5–10 kg/acre', 8, 10, 'kg',
       ARRAY['4 kg', '10 kg'],
       'Apply at 20–30 DAT',
       'Broadcast in standing crop with shallow water.',
       'Nereistoxin analogue; systemic and contact action.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Paddy' AND p.crop_id=c.id AND p.title_en='Stem Borer';



-- Centra – Lambda Cyhalothrin 4.9% CS (several crops)
-- Cotton – Bollworms
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide',
       '200 ml/acre', 200, 200, 'ml',
       ARRAY['100 ml', '250 ml', '500 ml'],
       '10–14 days',
       'Avoid spraying during high winds.',
       'Synthetic pyrethroid; contact and stomach action.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Cotton' AND p.crop_id=c.id AND p.title_en='American Bollworm';

-- Paddy – Stem Borer / Leaf Folder
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide',
       '100 ml/acre', 100, 100, 'ml',
       ARRAY['100 ml', '250 ml', '500 ml'],
       '10–14 days',
       'Apply at early pest incidence.',
       'Pyrethroid; quick knockdown.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Paddy' AND p.crop_id=c.id AND p.title_en='Stem Borer';

-- Tomato – Fruit Borer
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Centra', 'Lambda Cyhalothrin 4.9% CS', 'insecticide',
       '120 ml/acre', 120, 120, 'ml',
       ARRAY['100 ml', '250 ml', '500 ml'],
       '10–14 days',
       'Ensure coverage on flowers and developing fruits.',
       'Pyrethroid insecticide.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Tomato' AND p.crop_id=c.id AND p.title_en='Fruit Borer';



-- Megasus – Diafenthiuron 50% WP (sucking complex & mites)
-- Cotton – Whitefly (use existing problem title)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide',
       '240 g/acre', 240, 240, 'gm',
       ARRAY['240 gm', '480 gm', '1 kg'],
       '10–14 days',
       'Do not spray against strong winds; wear PPE.',
       'Inhibits mitochondrial respiration in pests.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Cotton' AND p.crop_id=c.id AND p.title_en='Whitefly';

-- Cabbage – Diamond Back Moth
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide',
       '240 g/acre', 240, 240, 'gm',
       ARRAY['240 gm', '480 gm', '1 kg'],
       '10–14 days',
       'Rotate with different MOA to manage resistance.',
       'Broad spectrum insecticide and acaricide.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Cabbage' AND p.crop_id=c.id AND p.title_en='Diamond Back Moth';

-- Okra – Whitefly
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Megasus', 'Diafenthiuron 50% WP', 'insecticide',
       '240 g/acre', 240, 240, 'gm',
       ARRAY['240 gm', '480 gm', '1 kg'],
       '10–14 days',
       'Excellent on whitefly and mites.',
       'Diafenthiuron; contact & stomach action.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Bhendi' AND p.crop_id=c.id AND p.title_en='Whitefly';



-- Uniisus – Diafenthiuron 47% + Bifenthrin 9.4% SC
-- Cotton – Thrips
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Uniisus', 'Diafenthiuron 47% + Bifenthrin 9.4% SC', 'insecticide',
       '250 ml/acre', 250, 250, 'ml',
       ARRAY['250 ml', '500 ml', '1 L'],
       '10–14 days',
       'Strong knockdown on thrips and whitefly.',
       'Combination of thiourea insecticide + pyrethroid.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Cotton' AND p.crop_id=c.id AND p.title_en='Thrips';

-- Chilli – Thrips
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Uniisus', 'Diafenthiuron 47% + Bifenthrin 9.4% SC', 'insecticide',
       '250 ml/acre', 250, 250, 'ml',
       ARRAY['250 ml', '500 ml', '1 L'],
       '10–14 days',
       'Controls thrips and aphids in chilli.',
       'Systemic & contact insecticide combination.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Chilli' AND p.crop_id=c.id AND p.title_en='Thrips';



-- Tall Stroke Plus – Pyriproxyfen 10% + Bifenthrin 10% EC (Cotton Whitefly)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Tall Stroke Plus', 'Pyriproxyfen 10% + Bifenthrin 10% EC', 'insecticide',
       '240 ml/acre', 240, 240, 'ml',
       ARRAY['240 ml', '500 ml', '1 L'],
       '10–14 days',
       'Controls all stages of whitefly (egg, nymph, adult).',
       'IGR + pyrethroid combination.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Cotton' AND p.crop_id=c.id AND p.title_en='Whitefly';



-- Neozen – Pyriproxyfen 5% + Diafenthiuron 25% SE (Cotton Whitefly/Jassids)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Neozen', 'Pyriproxyfen 5% + Diafenthiuron 25% SE', 'insecticide',
       '200–240 ml/acre', 200, 240, 'ml',
       ARRAY['200 ml', '500 ml', '1 L'],
       '10–14 days',
       'Best fit in whitefly management programs.',
       'Combination of IGR and thiourea insecticide.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Cotton' AND p.crop_id=c.id AND p.title_en='Whitefly';



-- Krushmite – Fenpyroximate 5% SC (mites)
-- Tea – Red Spider Mite
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Krushmite', 'Fenpyroximate 5% SC', 'insecticide',
       '240–480 ml/acre', 240, 480, 'ml',
       ARRAY['250 ml', '500 ml', '1 L'],
       '10–14 days',
       'Acaricide; effective on multiple mite stages.',
       'Mitochondrial electron transport inhibitor.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Tea' AND p.crop_id=c.id AND p.title_en='Red Spider Mite';

-- Chilli – Mites
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Krushmite', 'Fenpyroximate 5% SC', 'insecticide',
       '120–240 ml/acre', 120, 240, 'ml',
       ARRAY['250 ml', '500 ml'],
       '10–14 days',
       'Specialist acaricide for chilli mites.',
       'Contact acaricide.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Chilli' AND p.crop_id=c.id AND p.title_en='Mites';



-- Khlocyp – Chlorpyriphos 50% + Cypermethrin 5% EC (Cotton & Paddy)
-- Cotton – complex of sucking + bollworms
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Khlocyp', 'Chlorpyriphos 50% + Cypermethrin 5% EC', 'insecticide',
       '400 ml/acre', 400, 400, 'ml',
       ARRAY['250 ml', '500 ml', '1 L'],
       '10–15 days',
       'Effective on aphids, thrips, jassids, whitefly and bollworms.',
       'OP + pyrethroid combination.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Cotton' AND p.crop_id=c.id AND p.title_en='American Bollworm';

-- Paddy – Stem Borer / Leaf Folder
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Khlocyp', 'Chlorpyriphos 50% + Cypermethrin 5% EC', 'insecticide',
       '250–300 ml/acre', 250, 300, 'ml',
       ARRAY['250 ml', '500 ml', '1 L'],
       '10–15 days',
       'Apply at early borer incidence.',
       'Combination contact insecticide.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Paddy' AND p.crop_id=c.id AND p.title_en='Stem Borer';



-- Khlocyp Complete – Lambda Cyhalothrin 5% + Chlorantraniliprole 9.3% ZC (example mapping)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Khlocyp Complete', 'Lambda Cyhalothrin 5% + Chlorantraniliprole 9.3% ZC', 'insecticide',
       '80–100 ml/acre', 80, 100, 'ml',
       ARRAY['80 ml', '200 ml'],
       '10–14 days',
       'Broad spectrum against borer & sucking pests.',
       'Diamide + pyrethroid combination.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Chilli' AND p.crop_id=c.id AND p.title_en='Fruit Borer';



-- Telluride – Fipronil 80% WG (soil / early sucking pests)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Telluride', 'Fipronil 80% WG', 'insecticide',
       '50–60 g/acre', 50, 60, 'gm',
       ARRAY['40 gm', '80 gm'],
       'Soil/root zone application',
       'Use for nursery or early crop stage.',
       'Phenyl pyrazole; GABA receptor blocker.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Paddy' AND p.crop_id=c.id AND p.title_en='Stem Borer';



-- Telluride Ultra – Fipronil 4% + Imidacloprid 25% WG (Paddy hopper + borer)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Telluride Ultra', 'Fipronil 4% + Imidacloprid 25% WG', 'insecticide',
       '400–500 g/acre', 400, 500, 'gm',
       ARRAY['400 gm', '1 kg'],
       '10–14 days',
       'Controls BPH and stem borer together.',
       'Combination of neonicotinoid + phenyl pyrazole.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Paddy' AND p.crop_id=c.id AND p.title_en='BPH (Brown Plant Hopper)';



-- Bhadra Gold – Emamectin Benzoate 1.9% + Lambda Cyhalothrin 4.9% ZC (borer & caterpillars)
-- Chilli – Fruit Borer
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Bhadra Gold', 'Emamectin Benzoate 1.9% + Lambda Cyhalothrin 4.9% ZC', 'insecticide',
       '80–100 ml/acre', 80, 100, 'ml',
       ARRAY['80 ml', '200 ml'],
       '10–14 days',
       'Excellent on fruit borers in chilli.',
       'Avermectin + pyrethroid combo.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Chilli' AND p.crop_id=c.id AND p.title_en='Fruit Borer';

-- Tomato – Fruit Borer
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Bhadra Gold', 'Emamectin Benzoate 1.9% + Lambda Cyhalothrin 4.9% ZC', 'insecticide',
       '80–100 ml/acre', 80, 100, 'ml',
       ARRAY['80 ml', '200 ml'],
       '10–14 days',
       'Gives quick knockdown and residual control.',
       'Dual mode of action.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Tomato' AND p.crop_id=c.id AND p.title_en='Fruit Borer';



-- Mammath – Chlorantraniliprole 18.5% SC (Fruit Borer complexes)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Mammath', 'Chlorantraniliprole 18.5% SC', 'insecticide',
       '60 ml/acre', 60, 60, 'ml',
       ARRAY['60 ml', '150 ml'],
       '10–14 days',
       'Highly effective on fruit borers with low mammalian toxicity.',
       'Ryanodine receptor modulator.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Tomato' AND p.crop_id=c.id AND p.title_en='Fruit Borer';




-- ========== FUNGICIDES ==========

-- Helenaa – Hexaconazole 5% SC (Powdery Mildew – Grapes, Mango)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Helenaa', 'Hexaconazole 5% SC', 'fungicide',
       '200 ml/acre', 200, 200, 'ml',
       ARRAY['200 ml', '500 ml', '1 L'],
       '10–15 days',
       'Systemic triazole fungicide for powdery mildew.',
       'DMI fungicide; sterol biosynthesis inhibitor.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Grapes' AND p.crop_id=c.id AND p.title_en='Powdery Mildew';

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Helenaa', 'Hexaconazole 5% SC', 'fungicide',
       '200 ml/acre', 200, 200, 'ml',
       ARRAY['200 ml', '500 ml', '1 L'],
       '10–15 days',
       'Use in mango orchards at disease onset.',
       'Systemic fungicide.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Mango' AND p.crop_id=c.id AND p.title_en='Powdery Mildew';



-- Zebexyl – Mancozeb 63% + Hexaconazole 5% WP (Grapes – Downy/Powdery mix)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Zebexyl', 'Mancozeb 63% + Hexaconazole 5% WP', 'fungicide',
       '400–500 g/acre', 400, 500, 'gm',
       ARRAY['250 gm', '500 gm', '1 kg'],
       '10–14 days',
       'Provides both preventive and curative control.',
       'Multi-site + DMI systemic action.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Grapes' AND p.crop_id=c.id AND p.title_en='Downy Mildew';



-- Accute – Azoxystrobin 11% + Tebuconazole 18.3% SC (Tomato Early/Late Blight, Grapes)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Accute', 'Azoxystrobin 11% + Tebuconazole 18.3% SC', 'fungicide',
       '200 ml/acre', 200, 200, 'ml',
       ARRAY['100 ml', '250 ml', '500 ml'],
       '10–14 days',
       'Broad spectrum fungicide for foliar diseases.',
       'QoI + DMI combination.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Tomato' AND p.crop_id=c.id AND p.title_en='Early Blight';

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Accute', 'Azoxystrobin 11% + Tebuconazole 18.3% SC', 'fungicide',
       '200 ml/acre', 200, 200, 'ml',
       ARRAY['100 ml', '250 ml', '500 ml'],
       '10–14 days',
       'Also effective against downy/powdery in grapes.',
       'Systemic fungicide.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Grapes' AND p.crop_id=c.id AND p.title_en='Anthracnose';



-- Kornia – Propiconazole 25% EC (Rusts, Leaf Spots – Wheat, Groundnut, etc.)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Kornia', 'Propiconazole 25% EC', 'fungicide',
       '200 ml/acre', 200, 200, 'ml',
       ARRAY['100 ml', '250 ml', '500 ml'],
       '10–15 days',
       'Systemic fungicide; apply at first symptom.',
       'DMI; sterol biosynthesis inhibitor.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Wheat' AND p.crop_id=c.id AND p.title_en='Rust';

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Kornia', 'Propiconazole 25% EC', 'fungicide',
       '200 ml/acre', 200, 200, 'ml',
       ARRAY['100 ml', '250 ml', '500 ml'],
       '10–15 days',
       'Good on leaf spot/tikka in groundnut.',
       'Systemic; protective and curative.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Groundnut' AND p.crop_id=c.id AND p.title_en='Leaf Spot';



-- Kornia Complete – Azoxystrobin 4.8% + Chlorothalonil 40% SC (Potato, Tomato)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Kornia Complete', 'Azoxystrobin 4.8% + Chlorothalonil 40% SC', 'fungicide',
       '400–500 ml/acre', 400, 500, 'ml',
       ARRAY['250 ml', '500 ml', '1 L'],
       '7–10 days',
       'Excellent for late blight management.',
       'QoI + multi-site contact.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Potato' AND p.crop_id=c.id AND p.title_en='Late Blight';



-- Qute – Metalaxyl 8% + Mancozeb 64% WP (Downy/Phytophthora)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Qute', 'Metalaxyl 8% + Mancozeb 64% WP', 'fungicide',
       '400–500 g/acre', 400, 500, 'gm',
       ARRAY['250 gm', '500 gm', '1 kg'],
       '7–10 days',
       'Use preventively against downy mildew.',
       'Systemic + contact fungicide.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Grapes' AND p.crop_id=c.id AND p.title_en='Downy Mildew';



-- Extra Qute – Cymoxanil 8% + Mancozeb 64% WP (curative, e.g. Potato Late Blight)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Extra Qute', 'Cymoxanil 8% + Mancozeb 64% WP', 'fungicide',
       '400–500 g/acre', 400, 500, 'gm',
       ARRAY['250 gm', '500 gm', '1 kg'],
       '7–10 days',
       'Curative plus protective activity.',
       'Locally systemic + contact.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Potato' AND p.crop_id=c.id AND p.title_en='Late Blight';



-- Kavacham – Mancozeb 75% WP (broad contact protectant)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Kavacham', 'Mancozeb 75% WP', 'fungicide',
       '500 g/acre', 500, 500, 'gm',
       ARRAY['500 gm', '1 kg'],
       '7–10 days',
       'Multi-site protectant fungicide.',
       'Multi-site contact.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Tomato' AND p.crop_id=c.id AND p.title_en='Early Blight';



-- Shansulf – Sulphur 80% WDG (Powdery Mildew – multiple crops)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Shansulf', 'Sulphur 80% WDG', 'fungicide',
       '600–800 g/acre', 600, 800, 'gm',
       ARRAY['500 gm', '1 kg'],
       '7–10 days',
       'CONTACT fungicide and acaricide.',
       'Multi-site; elemental sulphur.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Grapes' AND p.crop_id=c.id AND p.title_en='Powdery Mildew';



-- ========== HERBICIDES ==========

-- Designate – Pendimethalin 30% EC (Paddy/Cotton pre-emergence)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Designate', 'Pendimethalin 30% EC', 'herbicide',
       '1.0–1.5 L/acre', 1000, 1500, 'ml',
       ARRAY['500 ml', '1 L', '5 L'],
       'Pre-emergence',
       'Apply on moist soil within 2 days of sowing/transplanting.',
       'Microtubule assembly inhibitor.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Cotton' AND p.crop_id=c.id AND p.title_en='Weeds';

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Designate', 'Pendimethalin 30% EC', 'herbicide',
       '1.0–1.5 L/acre', 1000, 1500, 'ml',
       ARRAY['500 ml', '1 L', '5 L'],
       'Pre-emergence',
       'Uniform spray – do not disturb soil after application.',
       'Pre-emergence residual herbicide.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Paddy' AND p.crop_id=c.id AND p.title_en='Weeds';



-- Thrive – Bispyribac Sodium 10% SC (Paddy post-emergence)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Thrive', 'Bispyribac Sodium 10% SC', 'herbicide',
       '80–100 ml/acre', 80, 100, 'ml',
       ARRAY['80 ml', '100 ml', '250 ml'],
       'Post-emergence (15–25 DAT)',
       'Spray when weeds are 2–4 leaf stage.',
       'ALS inhibitor.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Paddy' AND p.crop_id=c.id AND p.title_en='Weeds';



-- Weed Cure Gold – 2,4-D Amine Salt 58% SL (Broadleaf weeds)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Weed Cure Gold', '2,4-D Amine Salt 58% SL', 'herbicide',
       '400–500 ml/acre', 400, 500, 'ml',
       ARRAY['500 ml', '1 L'],
       'Post-emergence',
       'Avoid drift to sensitive crops.',
       'Synthetic auxin herbicide.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Wheat' AND p.crop_id=c.id AND p.title_en='Weeds';



-- Aarka – Imazethapyr 10% SL (Soybean broad spectrum weeds)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Aarka', 'Imazethapyr 10% SL', 'herbicide',
       '300 ml/acre', 300, 300, 'ml',
       ARRAY['250 ml', '500 ml'],
       'Early post-emergence',
       'Apply 15–20 DAS on young weeds.',
       'ALS inhibitor.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Soybean' AND p.crop_id=c.id AND p.title_en='Weeds';



-- Landmine – Atrazine 50% WP (Maize, Sugarcane)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Landmine', 'Atrazine 50% WP', 'herbicide',
       '800–1000 g/acre', 800, 1000, 'gm',
       ARRAY['500 gm', '1 kg'],
       'Pre-emergence',
       'Light irrigation after application improves efficacy.',
       'Photosystem II inhibitor.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Maize' AND p.crop_id=c.id AND p.title_en='Weeds';

INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Landmine', 'Atrazine 50% WP', 'herbicide',
       '800–1000 g/acre', 800, 1000, 'gm',
       ARRAY['500 gm', '1 kg'],
       'Pre-emergence',
       'Controls major broadleaf and grassy weeds.',
       'Residual herbicide.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Sugarcane' AND p.crop_id=c.id AND p.title_en='Weeds';



-- Taizen – Topramezone 33.6% SC (Maize post-emergence)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Taizen', 'Topramezone 33.6% SC', 'herbicide',
       '50–70 ml/acre', 50, 70, 'ml',
       ARRAY['50 ml', '100 ml'],
       'Post-emergence',
       'Target 2–4 leaf stage weeds for best results.',
       'HPPD inhibitor herbicide.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Maize' AND p.crop_id=c.id AND p.title_en='Weeds';



-- Bromett Plus – Metribuzin 70% WP (Potato, Sugarcane weeds)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Bromett Plus', 'Metribuzin 70% WP', 'herbicide',
       '200–300 g/acre', 200, 300, 'gm',
       ARRAY['250 gm', '500 gm'],
       'Pre/post-emergence (as per label)',
       'Selectivity may vary by soil type; do compatibility test.',
       'Photosystem II inhibitor.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Potato' AND p.crop_id=c.id AND p.title_en='Weeds';



-- ========== PLANT GROWTH REGULATORS (mapped to “Poor Fruit Set” where available) ==========

-- Protonn – NAA + nutrients (Grapes poor fruit set)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Protonn', 'Plant Growth Regulator (NAA based)', 'pgr',
       '1–2 ml/L (foliar spray)', 1, 2, 'ml',
       ARRAY['100 ml', '250 ml'],
       'At flowering / fruit set',
       'Do not mix with strong alkaline products.',
       'Auxin-based PGR; improves fruit set and retention.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Grapes' AND p.crop_id=c.id AND p.title_en='Poor Fruit Set';



-- Laser – GA3 based PGR (also map to Grapes Poor Fruit Set)
INSERT INTO products (name, scientific_formula, product_type, dosage_recommendation, dosage_min, dosage_max,
                      dosage_unit, pack_sizes, spray_interval, safety_notes, mode_of_action, crop_id, problem_id)
SELECT 'Laser', 'Plant Growth Regulator (GA₃ based)', 'pgr',
       '0.5–1 ml/L (spray)', 1, 1, 'ml',
       ARRAY['100 ml', '250 ml'],
       'As per label at bunch development stage',
       'Avoid overdosage; use during cool hours.',
       'Gibberellin-based PGR; improves berry size.',
       c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Grapes' AND p.crop_id=c.id AND p.title_en='Poor Fruit Set';

-- ==================== PRODUCT MAPPINGS FOR NEW PROBLEMS ====================

--- ==================== PRODUCT MAPPINGS FOR NEW PROBLEMS (FIXED) ====================

-- Paddy → Green Leaf Hopper, White Backed Plant Hopper
INSERT INTO products (
name, scientific_formula, product_type,
dosage_recommendation, dosage_min, dosage_max, dosage_unit,
pack_sizes, spray_interval, safety_notes, mode_of_action,
crop_id, problem_id
)
SELECT 'Shanthoxam', 'Thiamethoxam 25% WG', 'insecticide',
'40 gm/acre', 40, 40, 'gm',
ARRAY['40 gm'], '15 days',
'Systemic neonicotinoid', 'Systemic action',
c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Paddy'
AND p.title_en IN ('Green Leaf Hopper','White Backed Plant Hopper');


-- Chilli → Powdery Mildew
INSERT INTO products (
name, scientific_formula, product_type,
dosage_recommendation, dosage_min, dosage_max, dosage_unit,
pack_sizes, spray_interval, safety_notes, mode_of_action,
crop_id, problem_id
)
SELECT 'Shansulf', 'Sulphur 80% WG', 'fungicide',
'750 gm/acre', 750, 1000, 'gm',
ARRAY['1 kg'], '10 days',
'Contact fungicide', 'Multi-site',
c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Chilli'
AND p.title_en='Powdery Mildew';


-- Onion → Stemphylium Blight
INSERT INTO products (
name, scientific_formula, product_type,
dosage_recommendation, dosage_min, dosage_max, dosage_unit,
pack_sizes, spray_interval, safety_notes, mode_of_action,
crop_id, problem_id
)
SELECT 'Avventus',
'Azoxystrobin 18.2% + Difenoconazole 11.4% SC',
'fungicide',
'40 ml/acre', 40, 40, 'ml',
ARRAY['100 ml'], '12 days',
'Systemic fungicide', 'Dual systemic',
c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Onion'
AND p.title_en='Stemphylium Blight';


-- Banana → Sigatoka Leaf Spot
INSERT INTO products (
name, scientific_formula, product_type,
dosage_recommendation, dosage_min, dosage_max, dosage_unit,
pack_sizes, spray_interval, safety_notes, mode_of_action,
crop_id, problem_id
)
SELECT 'Avventus',
'Azoxystrobin 18.2% + Difenoconazole 11.4% SC',
'fungicide',
'40 ml/acre', 40, 40, 'ml',
ARRAY['100 ml'], '12 days',
'Systemic fungicide', 'Dual systemic',
c.id, p.id
FROM crops c, problems p
WHERE c.name_en='Banana'
AND p.title_en='Sigatoka Leaf Spot';



-- Add indexes for performance
CREATE INDEX IF NOT EXISTS idx_crops_name_en ON crops(name_en);
CREATE INDEX IF NOT EXISTS idx_problems_crop_id ON problems(crop_id);
CREATE INDEX IF NOT EXISTS idx_problems_title_en ON problems(title_en);
CREATE INDEX IF NOT EXISTS idx_products_problem_id ON products(problem_id);
CREATE INDEX IF NOT EXISTS idx_products_crop_id ON products(crop_id);
CREATE INDEX IF NOT EXISTS idx_products_name ON products(name);

-- End of seed file
