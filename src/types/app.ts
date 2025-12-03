export interface Crop {
  id: string;
  name_en: string;
  name_te: string;
  name_hi: string;
  image_url?: string;
}

export interface Problem {
  id: string;
  crop_id: string;
  title_en: string;
  title_te: string;
  title_hi: string;
  image_url?: string;
  problem_type?: string;
  description?: string;
}

export interface Product {
  id: string;
  crop_id?: string;
  problem_id: string;
  name: string;
  dosage_recommendation: string;
  dosage_min: number;
  dosage_max: number;
  dosage_unit: string;
  pack_sizes: string[];
  spray_interval?: string;
  safety_notes?: string;
  image_url?: string;
  product_type?: string;
  scientific_formula?: string;
  description?: string;
  mode_of_action?: string;
  features?: string[];
}

export interface TreatmentData {
  crop: Crop;
  problem: Problem;
  product: Product;
  acres: number;
  totalDosageMin: number;
  totalDosageMax: number;
}

export interface ProductProblem {
  id: string;
  product_id: string;
  problem_id: string;
  dosage_for_problem?: string;
}

export interface CropProblem {
  id: string;
  crop_id: string;
  problem_id: string;
}
