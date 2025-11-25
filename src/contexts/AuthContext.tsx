import React, { createContext, useContext, useState, useEffect } from 'react';
import { supabase } from '@/integrations/supabase/client';

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
    checkUser();
  }, []);

  const checkUser = async () => {
    try {
      const { data: { session } } = await supabase.auth.getSession();
      if (session?.user) {
        const { data: userData } = await supabase
          .from('users')
          .select('*')
          .eq('id', session.user.id)
          .single();
        
        if (userData) {
          setUser({
            id: userData.id,
            username: userData.username,
            role: userData.role,
            avatar_url: userData.avatar_url
          });
        }
      }
    } catch (error) {
      console.error('Check user error:', error);
    } finally {
      setLoading(false);
    }
  };

  const login = async (username: string, password: string): Promise<boolean> => {
    try {
      // First check if user exists in custom users table
      const { data: userData, error: userError } = await supabase
        .from('users')
        .select('id, username, role, avatar_url')
        .eq('username', username)
        .single();

      if (userError || !userData) {
        return false;
      }

      // Sign in with Supabase Auth using the user's ID
      const { error: signInError } = await supabase.auth.signInWithPassword({
        email: `${userData.id}@kisansethu.local`,
        password: userData.id
      });

      if (signInError) {
        // User doesn't exist in auth.users, create them
        const { error: signUpError } = await supabase.auth.signUp({
          email: `${userData.id}@kisansethu.local`,
          password: userData.id,
          options: {
            data: {
              username: userData.username,
              role: userData.role,
              avatar_url: userData.avatar_url
            }
          }
        });

        if (signUpError) {
          return false;
        }
      }

      setUser({
        id: userData.id,
        username: userData.username,
        role: userData.role,
        avatar_url: userData.avatar_url
      });
      
      return true;
    } catch (error) {
      console.error('Login error:', error);
      return false;
    }
  };

  const logout = async () => {
    await supabase.auth.signOut();
    setUser(null);
  };

  const updateAvatar = async (avatarUrl: string) => {
    if (!user) return;
    
    const { error } = await supabase
      .from('users')
      .update({ avatar_url: avatarUrl })
      .eq('id', user.id);
    
    if (!error) {
      setUser({ ...user, avatar_url: avatarUrl });
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
