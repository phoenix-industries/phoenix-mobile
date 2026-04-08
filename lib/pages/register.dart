import 'package:flutter/material.dart';
import 'package:phoenix/Utils/service/Authservise.dart';
import 'package:phoenix/Utils/validations/registervaldation.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _confrimpassword = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passcontroller.dispose();
    _namecontroller.dispose();
    _confrimpassword.dispose();
    _phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Image.asset(
            'assets/images/logo.jpeg',
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.height * 0.08,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(16, 40, 16, 40),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                'create Account',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                'fill in your details to get started',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              TextFormField(
                controller: _namecontroller,
                validator: Registervaldation.validateName,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'John Doe',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              TextFormField(
                controller: _phoneNumber,
                validator: Registervaldation.validatePhone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: '01.........',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              TextFormField(
                controller: _emailcontroller,
                validator: Registervaldation.validateEmai,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'hello@phoenix.exchange',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              TextFormField(
                obscureText: true,
                validator: (value) => Registervaldation.validateConfirmPassword(
                  value,
                  _passcontroller.text,
                ),
                controller: _confrimpassword,
                decoration: InputDecoration(
                  labelText: 'confirm Password',
                  hintText: '........',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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
                    Navigator.pushNamed(context, '/farm');
                  },
                  //   if (_formKey.currentState!.validate()) {
                  //     bool success = await Authservise.sendOtp(
                  //       _phoneNumber.text,
                  //     );
                  //     if (success) {
                  //       showotpDialog(
                  //         context,
                  //         _phoneNumber.text,
                  //         onVerified: () async {
                  //           final result = await Authservise.register(
                  //             name: _namecontroller.text,
                  //             phone: _phoneNumber.text,
                  //             email: _emailcontroller.text,
                  //             password: _passcontroller.text,
                  //           );
                  //           if (result != null && result.success) {
                  //             ScaffoldMessenger.of(context).showSnackBar(
                  //               SnackBar(
                  //                 content: Text("Registered Successfully"),
                  //               ),
                  //             );
                  //             Navigator.pushNamed(context, '/fram');
                  //           } else {
                  //             ScaffoldMessenger.of(context).showSnackBar(
                  //               SnackBar(
                  //                 content: Text(
                  //                   result?.message ?? "Registration Failed",
                  //                 ),
                  //               ),
                  //             );
                  //           }
                  //         },
                  //       );
                  //     } else {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(content: Text("Failed to send OTP")),
                  //       );
                  //     }
                  //   }
                  // },
                  child: const Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void showotpDialog(context, phone, {required Function() onVerified}) {
//   final TextEditingController _otp = TextEditingController();
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (context) {
//       return Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadiusGeometry.circular(18),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(8),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 "Verify Phone",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 "Enter the OTP sent to your phone",
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: _otp,
//                 keyboardType: TextInputType.number,
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   counterText: '',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 height: 45,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     bool success = await Authservise.VerifyOtp(
//                       phone,
//                       _otp.text,
//                     );
//                     if (success) {
//                       Navigator.pop(context);
//                       onVerified();
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text("Invalid OTP")),
//                       );
//                     }
//                   },
//                   child: const Text("Verify"),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text("Cancel"),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
