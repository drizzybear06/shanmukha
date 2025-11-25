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
}

export interface Product {
  id: string;
  crop_id: string;
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
}

export interface TreatmentData {
  crop: Crop;
  problem: Problem;
  product: Product;
  acres: number;
  totalDosageMin: number;
  totalDosageMax: number;
}
