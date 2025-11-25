-- Create enum for user roles
CREATE TYPE app_role AS ENUM ('admin', 'manager', 'guest');

-- Create users table
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  username TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  role app_role NOT NULL DEFAULT 'guest',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Create crops table with multi-language support
CREATE TABLE crops (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name_en TEXT NOT NULL,
  name_te TEXT NOT NULL,
  name_hi TEXT NOT NULL,
  image_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Create problems table
CREATE TABLE problems (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  crop_id UUID REFERENCES crops(id) ON DELETE CASCADE NOT NULL,
  title_en TEXT NOT NULL,
  title_te TEXT NOT NULL,
  title_hi TEXT NOT NULL,
  image_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Create products table with dosage information
CREATE TABLE products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  problem_id UUID REFERENCES problems(id) ON DELETE CASCADE NOT NULL,
  name TEXT NOT NULL,
  dosage_recommendation TEXT NOT NULL,
  dosage_min NUMERIC NOT NULL,
  dosage_max NUMERIC NOT NULL,
  dosage_unit TEXT NOT NULL DEFAULT 'ml',
  pack_sizes TEXT[] NOT NULL,
  spray_interval TEXT,
  safety_notes TEXT,
  image_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Create submissions table for manager proposals
CREATE TABLE submissions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  manager_id UUID REFERENCES users(id) ON DELETE CASCADE NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('crop', 'problem', 'product')),
  payload_json JSONB NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  reviewed_at TIMESTAMP WITH TIME ZONE,
  reviewed_by UUID REFERENCES users(id)
);

-- Create analytics table
CREATE TABLE analytics (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  crop_id UUID REFERENCES crops(id),
  problem_id UUID REFERENCES problems(id),
  product_id UUID REFERENCES products(id),
  acres NUMERIC,
  language TEXT NOT NULL,
  timestamp TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE crops ENABLE ROW LEVEL SECURITY;
ALTER TABLE problems ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE analytics ENABLE ROW LEVEL SECURITY;

-- RLS Policies for public read access (guests can view crops, problems, products)
CREATE POLICY "Anyone can view crops" ON crops FOR SELECT USING (true);
CREATE POLICY "Anyone can view problems" ON problems FOR SELECT USING (true);
CREATE POLICY "Anyone can view products" ON products FOR SELECT USING (true);

-- RLS Policies for analytics (anyone can insert)
CREATE POLICY "Anyone can insert analytics" ON analytics FOR INSERT WITH CHECK (true);

-- RLS Policies for users (only admins can manage)
CREATE POLICY "Admins can view all users" ON users FOR SELECT 
  USING (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

CREATE POLICY "Admins can insert users" ON users FOR INSERT 
  WITH CHECK (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

CREATE POLICY "Admins can update users" ON users FOR UPDATE 
  USING (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

-- RLS Policies for crops, problems, products (admins can manage)
CREATE POLICY "Admins can insert crops" ON crops FOR INSERT 
  WITH CHECK (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

CREATE POLICY "Admins can update crops" ON crops FOR UPDATE 
  USING (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

CREATE POLICY "Admins can delete crops" ON crops FOR DELETE 
  USING (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

CREATE POLICY "Admins can insert problems" ON problems FOR INSERT 
  WITH CHECK (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

CREATE POLICY "Admins can update problems" ON problems FOR UPDATE 
  USING (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

CREATE POLICY "Admins can delete problems" ON problems FOR DELETE 
  USING (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

CREATE POLICY "Admins can insert products" ON products FOR INSERT 
  WITH CHECK (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

CREATE POLICY "Admins can update products" ON products FOR UPDATE 
  USING (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

CREATE POLICY "Admins can delete products" ON products FOR DELETE 
  USING (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

-- RLS Policies for submissions
CREATE POLICY "Managers can insert submissions" ON submissions FOR INSERT 
  WITH CHECK (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'manager'));

CREATE POLICY "Managers can view their submissions" ON submissions FOR SELECT 
  USING (manager_id = auth.uid());

CREATE POLICY "Admins can view all submissions" ON submissions FOR SELECT 
  USING (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

CREATE POLICY "Admins can update submissions" ON submissions FOR UPDATE 
  USING (EXISTS (SELECT 1 FROM users WHERE users.id = auth.uid() AND users.role = 'admin'));

-- Insert seed admin user (password: admin@2345 - will be hashed in the application)
INSERT INTO users (username, password_hash, role) 
VALUES ('admin001', '$2a$10$8K1p/a0dL3LKzKH8NQUZG.gHfWjNqYrN8BdKSNXe1NmH5mE1gKpri', 'admin');

-- Seed Cotton crop data
INSERT INTO crops (name_en, name_te, name_hi) VALUES 
  ('Cotton', 'పత్తి', 'कपास')
RETURNING id;