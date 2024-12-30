import 'package:book_a_ride/constants/styles.dart';
import 'package:book_a_ride/screens/login2.dart';
import 'package:book_a_ride/widgets/cust_button.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: pageBgCol,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                //color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                    CustButton(
                      innerText: "Log in with phone number",
                      pageToNav: (context) => Login2(logMode: "phone"),
                      wid: MediaQuery.of(context).size.width * 0.94,
                      heig: MediaQuery.of(context).size.width * 0.15,
                      insideIcon: Icon(
                        Icons.phone,
                        color: Colors.green,
                        size: MediaQuery.of(context).size.width / 16,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustButton(
                      innerText: "Use email or username",
                      pageToNav: (context) => Login2(logMode: "email"),
                      wid: MediaQuery.of(context).size.width * 0.94,
                      heig: MediaQuery.of(context).size.width * 0.15,
                      insideIcon: Icon(
                        Icons.email,
                        color: Colors.yellow[600],
                        size: MediaQuery.of(context).size.width / 16,
                      ),
                    ),                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
