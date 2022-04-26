import 'package:calorie_tracker/supabase/authentication.notifier.dart';
// import 'package:calorie_tracker/supabase_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../login_page/view/demo_login_page.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  // SupabaseManager supabaseManager = SupabaseManager();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  // final TextEditingController _enrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _password,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your Password'),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: TextField(
            //     controller: _phone,
            //     decoration: const InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Enter your Phone No'
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: TextField(
            //     controller: _enrol,
            //     decoration: const InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Enter your Enrollment No'),
            //   ),
            // ),
            ElevatedButton(
                onPressed: () async {
                  String email = _email.text;
                  String password = _password.text;

                  if (email.isNotEmpty && password.isNotEmpty) {
                    await authenticationNotifier.signUp(context: context,
                        email: email, password: password);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Fill the details")));
                  }
                },
                child: const Text('Sign Up')),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginDemo()));
              },
              child: const Text(
                'Already Have Account? LogIn',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
