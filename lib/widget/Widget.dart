
import 'package:flutter/material.dart';

class designButton extends StatelessWidget {
  var onpressed;
  var text;

  designButton({this.text,this.onpressed});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.white,
        onTap: onpressed,
        child: Container(
          width: 60,
          height: 70,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Text(
            text.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
