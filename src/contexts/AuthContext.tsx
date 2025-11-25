import React, { createContext, useContext, useState, useEffect } from 'react';
import { supabase } from '@/integrations/supabase/client';
import bcrypt from 'bcryptjs';

interface User {
  id: string;
  username: string;
  role: 'admin' | 'manager' | 'guest';
  avatar_url?: string;
}

interface AuthContextType {
  user: User | null;
  login: (username: string, password: string) => Promise<boolean>;
  logout: () => void;
  loading: boolean;
  updateAvatar: (avatarUrl: string) => Promise<void>;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export const AuthProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Check localStorage for saved user
    const savedUser = localStorage.getItem('kisansethu_user');
    if (savedUser) {
      setUser(JSON.parse(savedUser));
    }
    setLoading(false);
  }, []);

  const login = async (username: string, password: string): Promise<boolean> => {
    try {
      // Fetch user from database
      const { data: userData, error: userError } = await supabase
        .from('users')
        .select('id, username, role, avatar_url, password_hash')
        .eq('username', username)
        .single();

      if (userError || !userData) {
        return false;
      }

      // Compare password with hashed password
      const isPasswordValid = await bcrypt.compare(password, userData.password_hash);
      
      if (!isPasswordValid) {
        return false;
      }

      const user: User = {
        id: userData.id,
        username: userData.username,
        role: userData.role,
        avatar_url: userData.avatar_url
      };

      setUser(user);
      localStorage.setItem('kisansethu_user', JSON.stringify(user));
      return true;
    } catch (error) {
      console.error('Login error:', error);
      return false;
    }
  };

  const logout = () => {
    setUser(null);
    localStorage.removeItem('kisansethu_user');
  };

  const updateAvatar = async (avatarUrl: string) => {
    if (!user) return;
    
    const { error } = await supabase
      .from('users')
      .update({ avatar_url: avatarUrl })
      .eq('id', user.id);
    
    if (!error) {
      const updatedUser = { ...user, avatar_url: avatarUrl };
      setUser(updatedUser);
      localStorage.setItem('kisansethu_user', JSON.stringify(updatedUser));
    }
  };

  return (
    <AuthContext.Provider value={{ user, login, logout, loading, updateAvatar }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within AuthProvider');
  }
  return context;
};
