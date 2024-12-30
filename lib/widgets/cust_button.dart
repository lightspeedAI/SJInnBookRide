import 'package:book_a_ride/constants/styles.dart';
import 'package:flutter/material.dart';

class CustButton extends StatelessWidget {
  final String innerText; 
  final Widget Function(BuildContext) pageToNav;
  final double wid;
  final double heig;
  final Icon insideIcon;
  const CustButton(
      {super.key,
      required this.innerText,
      required this.pageToNav,
      required this.wid,
      required this.heig,
      required this.insideIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: pageToNav));
      },
      child: Container(
        width: wid,
        height: heig,
        decoration: BoxDecoration(
            color: buttonBgColor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: insideIcon,
            ),            
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text(
              innerText,
              style: buttonFont,
            )),
          ],
        ),
      ),
    );
  }
}
