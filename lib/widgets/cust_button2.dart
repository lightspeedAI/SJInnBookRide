import 'package:book_a_ride/constants/styles.dart';
import 'package:flutter/material.dart';

class CustButton2 extends StatelessWidget {
  final String innerText;
  final VoidCallback onTP;
  final double wid;
  final double heig;
  const CustButton2({
    super.key,
    required this.innerText,
    required this.onTP,
    required this.wid,
    required this.heig,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTP.call();
      },
      child: Container(
        width: wid,
        height: heig,
        decoration: BoxDecoration(
            color: buttonBgColor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Center(
            child: Text(
          innerText,
          style: buttonFont,
        )),
      ),
    );
  }
}