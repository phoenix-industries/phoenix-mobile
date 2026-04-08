import 'package:flutter/material.dart';
import 'package:phoenix/Utils/service/Authservise.dart';
import 'package:phoenix/Utils/validations/registervaldation.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  final Authservise authservise = Authservise();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Image.asset(
            'assets/images/logo.jpeg',
            height: width * 0.08,
            width: width * 0.08,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.05,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .06),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: height * 0.01),
              Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.07,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                'Access your account to manage exchanges',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: height * 0.04),
              TextFormField(
                controller: _emailcontroller,
                validator: Registervaldation.validateEmai,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'hello@phoenix.exchange',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              TextFormField(
                obscureText: true,
                validator: Registervaldation.validatePassword,
                controller: _passcontroller,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: '........',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xfffec517), Color(0xfff43f06)],
                  ),
                ),
                child: InkWell(
                  onTap:
                      ()
                      //   Navigator.pushNamed(context, '/fram');
                      // },
                      async {
                        if (_formKey.currentState!.validate()) {
                          final result = await authservise.login(
                            username: _emailcontroller.text,
                            password: _passcontroller.text,
                          );
                          if (result.success) {
                            print("Login Success, navigating...");
                            Navigator.pushNamed(context, '/fram');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(result?.message ?? "Error"),
                              ),
                            );
                          }
                        }
                      },
                  child: const Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.08),
              Row(
                children: [
                  Text(
                    "Don't have any account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      'Create an Account',
                      style: TextStyle(color: Color(0xfff43f06)),
                    ),
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
