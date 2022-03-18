import 'package:flutter/material.dart';

class MyElevetedButton extends StatefulWidget {
  int index;
  VoidCallback onpressed;
  String text;
  int currentPage;
  MyElevetedButton(
      {required this.currentPage,required this.onpressed,
      required this.text,
      required this.index,
      Key? key})
      : super(key: key);

  @override
  State<MyElevetedButton> createState() => _MyElevetedButtonState();
}

class _MyElevetedButtonState extends State<MyElevetedButton> {
  int temp = 0;
  Color color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: widget.onpressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: Size(90, 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          primary: widget.currentPage == widget.index
              ? color = Colors.black
              : color = Colors.grey,
        ),
        child: FittedBox(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16.0,
              color: widget.currentPage == widget.index
                ? Colors.white
                : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}