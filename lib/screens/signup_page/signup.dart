import 'package:calorie_tracker/core/notifier/authentication.notifier.dart';
// import 'package:calorie_tracker/supabase_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../login_page/view/demo_login_page.dart';
import 'package:calorie_tracker/screens/login_page/login_widgets/login_widgets.dart';

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
    return Stack(
      children: [
        Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[300]?.withOpacity((0.3))),
                    child: TextField(
                      controller: _email,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.email_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          hintText: "Enter your Email",
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.white)),
                      style: TextStyle(
                          fontSize: 17, color: Colors.white.withOpacity(0.8)),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                Container(
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[300]?.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(fontSize: 28, color: Colors.white),
                      controller: _password,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            Icons.lock_open_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        hintText: 'enter your Password',
                        hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
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
                        await authenticationNotifier.signUp(
                            context: context, email: email, password: password);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Fill the details")));
                      }
                    },
                    
                    child: const Text('Sign Up')),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginDemo()));
                  },
                  child: const Text(
                    'Already Have Account? LogIn',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}