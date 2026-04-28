// Supabase project credentials.
// Replace the placeholder values below with your real project URL and anon key.
// Find them at: https://supabase.com/dashboard → Project Settings → API
//
// ⚠️  Never commit real credentials — use environment variables or a secrets
//     manager for production builds.

class SupabaseOptions {
  /// Your Supabase project URL, e.g. https://xyzxyzxyz.supabase.co
  static const String supabaseUrl = 'YOUR_SUPABASE_URL';

  /// Your project's anon/public key (safe to use client-side)
  static const String anonKey = 'YOUR_SUPABASE_ANON_KEY';
}
