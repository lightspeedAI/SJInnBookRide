import 'package:book_a_ride/screens/mail_login.dart';
import 'package:book_a_ride/services/auth_service.dart';
import 'package:book_a_ride/widgets/cust_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SignUp extends StatelessWidget {
//   SignUp({super.key});

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         resizeToAvoidBottomInset: true,
//         bottomNavigationBar: _signin(context),
//         // appBar: AppBar(
//         //   backgroundColor: Colors.transparent,
//         //   elevation: 0,
//         //   toolbarHeight: 50,
//         // ),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//             child: Column(
//               children: [
//                 Center(
//                   child: Text(
//                     'Register Account',
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 80,
//                 ),
//                 _emailAddress(),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 _password(),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 CustButton2(
//                     innerText: "Sign Up",
//                     onTP: () async {
//                       await AuthService().signup(
//                           email: _emailController.text,
//                           password: _passwordController.text,
//                           context: context);
//                     },
//                     wid: MediaQuery.of(context).size.width * 0.94,
//                     heig: MediaQuery.of(context).size.width * 0.15),
//                 //  _signup(context),
//               ],
//             ),
//           ),
//         ));
//   }

// }

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: _signin(context),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   toolbarHeight: 50,
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Register Account',
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                _emailAddress(),
                const SizedBox(
                  height: 20,
                ),
                _password(),
                const SizedBox(
                  height: 50,
                ),
                isLoading
                    ? const CircularProgressIndicator()
                    : CustButton2(
                        innerText: "Sign Up",
                        onTP: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await AuthService().signup(
                              email: _emailController.text,
                              password: _passwordController.text,
                              context: context);
                        },
                        wid: MediaQuery.of(context).size.width * 0.94,
                        heig: MediaQuery.of(context).size.width * 0.15),
                //  _signup(context),
              ],
            ),
          ),
        ));
  }

  Widget _emailAddress() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
              filled: true,
              hintText: 'example@gmail.com',
              hintStyle: const TextStyle(
                  color: Color(0xff6A6A6A),
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
              fillColor: const Color(0xffF7F7F9),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(14))),
        )
      ],
    );
  }

  Widget _password() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF7F7F9),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(14))),
        )
      ],
    );
  }

  Widget _signup(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0D6EFD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        minimumSize: const Size(double.infinity, 60),
        elevation: 0,
      ),
      onPressed: () async {
        await AuthService().signup(
            email: _emailController.text,
            password: _passwordController.text,
            context: context);
      },
      child: const Text("Sign Up"),
    );
  }

  Widget _signin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            const TextSpan(
              text: "Already Have Account? ",
              style: TextStyle(
                  color: Color(0xff6A6A6A),
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
            TextSpan(
                text: "Log In",
                style: const TextStyle(
                    color: Color(0xff1A1D1E),
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MailLogin()));
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MailLogin()),
                    // );
                  }),
          ])),
    );
  }
}
