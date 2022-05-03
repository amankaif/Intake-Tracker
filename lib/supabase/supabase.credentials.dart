// ignore_for_file: constant_identifier_names, duplicate_ignore

import 'package:supabase/supabase.dart';

class SupabaseCredentials {
  static const String API_KEY =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF0eGZ5bWhoaHFhdW9ubnpxdnB3Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY1MDU1MjUxMCwiZXhwIjoxOTY2MTI4NTEwfQ.umOuT6sIgC4hD1BKDTZzollBh5sk7-68Wq4_bamaKoc";
  // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF0eGZ5bWhoaHFhdW9ubnpxdnB3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTA1NTI1MTAsImV4cCI6MTk2NjEyODUxMH0.oxl9TMBh2bXh7CC_oBfFmIdONFod5X8QOtpY8Y7OWLU";
  // ignore: constant_identifier_names
  static const String API_URL = "https://qtxfymhhhqauonnzqvpw.supabase.co";

  SupabaseClient supabaseClient = SupabaseClient(API_URL, API_KEY);
}
