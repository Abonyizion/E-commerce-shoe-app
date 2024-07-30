import 'package:authentication/pages/registerPage.dart';
import 'package:authentication/pages/resetPasswordPage.dart';
//import 'package:authentication/register.dart';
//import 'package:authentication/reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  // controller used to access what thee user types in on the text field
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
  bool passwordVisible = false;
  // method to sign user in with email and password
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.blue,),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextController.text.trim(),
          password: passwordTextController.text.trim());
      if (!mounted) return;
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }


  // showing error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text('LOGIN PAGE',
            style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 70, bottom: 30),
                    child: Text('CLOUD', style: TextStyle(
                        color: Colors.purple, fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Center(
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        controller: emailTextController,
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purpleAccent),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            labelText: 'Email',
                            labelStyle: const TextStyle( color: Colors.grey)
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),
                  Center(
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        obscureText: passwordVisible ? false : true,
                        controller: passwordTextController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purpleAccent),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon:  Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          labelStyle: const TextStyle( color: Colors.grey),

                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) => const ResetPasswordPage()));
                          },
                          child: const Text('Forgot Password?',style: TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,),

                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple
                      ),
                      onPressed: signUserIn,
                      child:  const Text('LOGIN', style: TextStyle(
                          fontSize: 20, color: Colors.white),),
                    ),
                  ),

                  const SizedBox(
                    height: 35,),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        Text('OR'),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const  Text('Does not Have an Account?',style: TextStyle(fontSize: 15),),
                      TextButton(
                        child: const Text('SIGN UP',style: TextStyle(fontSize: 20),),
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
