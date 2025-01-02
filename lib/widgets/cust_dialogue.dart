import 'package:book_a_ride/screens/home.dart';
import 'package:flutter/material.dart';

class CustDialogue extends StatelessWidget {
  String confText;
  VoidCallback fnOnAccept;
  String conButton;
  CustDialogue({
    super.key,
    required this.confText,
    required this.fnOnAccept,
    required this.conButton,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            // color: Colors.red,
            padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.80,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    confText,
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel")),
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             const Home()));
                            fnOnAccept.call();                            
                            
                          },
                          child: Text(conButton),
                        ),
                      ])
                ])));
  }
}
