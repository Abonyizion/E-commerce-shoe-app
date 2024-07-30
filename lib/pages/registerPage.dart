import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // controller used to access what thee user types in on the text field
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
// boolean to control password visibility
  bool passwordVisible = false;

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.blue,),
        );
      },
    );

    try {
      if (passwordTextController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("wrong password combination"),
            )
        );
      }
      if (!mounted) return;
      Navigator.pop(context);

    }  on FirebaseAuthException catch (e) {
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
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('REGISTER PAGE',
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
                padding: EdgeInsets.only(top: 20, bottom: 15),
                child: Text('CLOUD', style: TextStyle(
                    color: Colors.purple, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15,),

              const Text('WELCOME!! lets create an account for you',
               ),

              const SizedBox(
                height: 30,),

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

              const SizedBox(
                height: 8,),

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
                height: 8,),

              Center(
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    obscureText: passwordVisible ? false : true,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purpleAccent),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText: 'Confirm Password',
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
                height: 40,),

              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    // sign user up
                    onPressed: signUserUp,

                    child: const Text('SIGN UP',style: TextStyle(
                        fontSize: 20, color: Colors.white), )),
              ),
              const SizedBox(
                  height: 35),

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
                height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const  Text('Already Have an Account?',style: TextStyle(fontSize: 15),),
                  TextButton(
                    child: const Text('SIGN IN',style: TextStyle(fontSize: 20),),
                    onPressed: () {
                      Navigator.pop(
                          context, MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

