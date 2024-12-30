import 'package:book_a_ride/constants/styles.dart';
import 'package:book_a_ride/screens/home.dart';
import 'package:book_a_ride/widgets/cust_button.dart';
import 'package:book_a_ride/widgets/cust_text_input.dart';
import 'package:flutter/material.dart';

class Login2 extends StatefulWidget {
  String logMode;
  Login2({super.key, required this.logMode});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  TextEditingController phoneCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

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
                    widget.logMode == "phone"
                        ? CustTextInput(
                            hint: "Phone",
                            backColor: Colors.grey[100]!,
                            textColor: Colors.black,
                            lines: 3,
                            textCont: phoneCont,
                            hintColor: Colors.grey,
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    widget.logMode == "email"
                        ? CustTextInput(
                            hint: "Email",
                            backColor: Colors.grey[100]!,
                            textColor: Colors.black,
                            lines: 3,
                            textCont: emailCont,
                            hintColor: Colors.grey,
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    widget.logMode == "email"
                        ? CustTextInput(
                            hint: "Password",
                            backColor: Colors.grey[100]!,
                            textColor: Colors.black,
                            lines: 3,
                            textCont: passCont,
                            hintColor: Colors.grey,
                          )
                        : const SizedBox(),
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
