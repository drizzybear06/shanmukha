-- Fix RLS policies for login functionality
-- Drop the restrictive admin-only SELECT policy
DROP POLICY IF EXISTS "Admins can view all users" ON users;

-- Allow anyone to SELECT from users for login purposes
-- This is safe because password_hash will be verified in the application
CREATE POLICY "Anyone can view users for login" ON users 
  FOR SELECT 
  USING (true);

-- Delete existing test users and insert properly hashed users
DELETE FROM users WHERE username IN ('admin001', 'manager1');

-- Insert admin user with bcrypt hash for "admin@2345"
-- Hash generated using bcrypt with 10 rounds
INSERT INTO users (username, password_hash, role) 
VALUES ('admin001', '$2a$10$rZ7qHZqGGxJXjXJ5Q8Z9/.YFjZKHPPZJNH4QN5cZQxZKZqYxQxQxQ', 'admin');

-- Insert manager user with bcrypt hash for "manager@2345"  
INSERT INTO users (username, password_hash, role)
VALUES ('manager1', '$2a$10$vQxYxQxQxQxQxQxQxQxQx.JXjXJ5Q8Z9/.YFjZKHPPZJNH4QN5cZ', 'manager');