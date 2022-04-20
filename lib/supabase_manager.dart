import 'package:supabase/supabase.dart';

const supabaseUrl = 'https://uheprqjhrmxfnjxyppbq.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVoZXBycWpocm14Zm5qeHlwcGJxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTAzODM2NTMsImV4cCI6MTk2NTk1OTY1M30.L-1uEtpntYiAcdXHmFeuEXU5NVwDgEWhyt2zA4EExdo';


class SupabaseManager{
  final client = SupabaseClient(supabaseUrl,supabaseKey);

  void signUpUser(String email, String password) async {
    await client.auth.signUp(email, password);
  }

  var table = 'UsersDataTable';
  // var table = 'userdata';
  getData() async{
    var response = await client.from(table).select().execute();
    if (response.error == null) {
      print('response.data: ${response.data}');
    }
  }

  addData(String name, String email, String enrol) async{
    await client.from(table).insert([
      {
        'enrolno':enrol,
        'name': name,
        'email': email,

      },
    ]
    ).execute();
  }

  addData1(String name, String email) async{
    await client.from(table).insert([
      {
        'name': name,
        'email': email,
      },
    ]
    ).execute();
  }

}