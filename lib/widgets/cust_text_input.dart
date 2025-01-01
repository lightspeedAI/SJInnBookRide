import 'package:book_a_ride/constants/styles.dart';
import 'package:flutter/material.dart';

class CustTextInput extends StatefulWidget {
  final String hint;
  final Color backColor;
  final Color textColor;
  final Color hintColor;
  final int? lines;
  final TextEditingController textCont;
  final TextInputType? keyType;

  const CustTextInput(
      {super.key,
      required this.hint,
      required this.backColor,
      required this.textColor,
      required this.textCont,
      required this.hintColor,
      this.keyType,
      this.lines});

  @override
  State<CustTextInput> createState() => _CustTextInputState();
}

class _CustTextInputState extends State<CustTextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        width: MediaQuery.of(context).size.width * 0.94,
        height: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
            color: inputBgColor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Center(
            child: TextField(
          keyboardType: widget.keyType,
          controller: widget.textCont,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: inputHintColor,
                fontSize: normalFontSize,
              )),
          style: TextStyle(fontSize: normalFontSize, color: widget.textColor),
          maxLines: widget.lines ?? 1,
        )));
  }
}
