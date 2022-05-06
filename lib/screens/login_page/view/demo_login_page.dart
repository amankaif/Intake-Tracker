// import 'package:calorie_tracker/supabase_manager.dart';

import 'package:calorie_tracker/screens/signup_page/signup.dart';
import 'package:calorie_tracker/core/notifier/authentication.notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase/supabase.dart' hide Provider;
import 'package:calorie_tracker/ui_strings.dart';
import 'package:calorie_tracker/screens/login_page/login_text_style.dart';
import 'package:calorie_tracker/screens/login_page/login_widgets/login_widgets.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _isLoading = false;
  late final TextEditingController _emailController;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    final response = await supabase.auth.signIn(
        email: _emailController.text,
        options: AuthOptions(
            redirectTo: kIsWeb
                ? null
                : 'io.supabase.flutterquickstart://login-callback/'));
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    } else {
      context.showSnackBar(message: 'Check your email for login link!');
      _emailController.clear();
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Stack(
      children: [
        Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   title: const Text("Login Page"),
          //   centerTitle: true,
          // ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: SizedBox(
                        width: 200,
                        height: 150,
                        /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image.asset('assets/images/cartoon.png')),
                  ),
                ),
                const SizedBox(
                  height: 75,
                ),
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
                          border:  InputBorder.none,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.email_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          hintText: "Email",
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.white)
                              ),
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
                      style: TextStyle(fontSize: 28,
                      color:  Colors.white),
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
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // ignore: todo
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () async {
                      // ignore: avoid_print
                      // print("Clicked");
                      String email = _email.text;
                      String password = _password.text;
                      if (email.isNotEmpty && password.isNotEmpty) {
                        await authenticationNotifier.login(
                            context: context, email: email, password: password);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Fill the details")));
                      }
                      // userName = _name.text;
                      // userEmail = userName+'@gmail.com';
                      // supabaseManager.signUpUser("kgflhgfkg", "123456");
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25, ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpWidget()));
                  },
                  child: const Text(
                    'New User? Create Account',
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