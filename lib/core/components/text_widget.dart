
import 'package:flutter/material.dart';

class TextWidget{
  static textWidget({required String text, Color color = Colors.black, FontWeight fontWeight = FontWeight.normal, double size = 20, TextOverflow? textOverflow, int? maxLines}){
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight, ),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}