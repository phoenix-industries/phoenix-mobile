import 'package:flutter/material.dart';
import 'package:phoenix/Utils/providers/userprovider.dart';
import 'package:phoenix/Utils/service/Authservise.dart';
import 'package:phoenix/Utils/service/usreservice.dart';
import 'package:phoenix/Utils/validations/registervaldation.dart';
import 'package:provider/provider.dart';
import 'package:phoenix/Utils/providers/Themeprovider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLoginTime() async {
  final prefs = await SharedPreferences.getInstance();
  final now = DateTime.now();
  await prefs.setString('lastLogin', now.toIso8601String());
}

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

  final Usreservice usreservice = Usreservice();
  bool _passwordVisible = true;

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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 1.5,
          ),
        ),
        title: Center(
          child: Image.asset(
            'assets/images/Phoenix.png',
            height: width * 0.08,
            width: width * 0.08,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              final themeProvider = Provider.of<ThemeProvider>(
                context,
                listen: false,
              );
              final isDark = Theme.of(context).brightness != Brightness.dark;
              themeProvider.toggleTheme(isDark);
            },
          ),
        ],
      ),

      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.05,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 1.5,
          ),
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
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.07,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                'Access your account to manage exchanges',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
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
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Color(0xfff0500a), width: 2),
                  ),
                  floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                ),
              ),
              SizedBox(height: height * 0.04),
              TextFormField(
                obscureText: _passwordVisible,
                validator: Registervaldation.validatePassword,
                controller: _passcontroller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () =>
                        setState(() => _passwordVisible = !_passwordVisible),
                  ),
                  labelText: 'Password',
                  hintText: '........',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Color(0xfff0500a), width: 2),
                  ),
                  floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
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
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final result = await authservise.login(
                        identifier: _emailcontroller.text,
                        password: _passcontroller.text,
                      );
                      if (result.success) {
                        final user = await Usreservice.getCurrentuser();
                        Provider.of<Userprovider>(
                          context,
                          listen: false,
                        ).setuser(user);
                        await saveLoginTime();
                        Navigator.pushNamed(context, '/fram');
                      } else {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(result.message)));
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
