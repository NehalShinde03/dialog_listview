import 'package:flutter/material.dart';

TextButton textButton(String txt, Function clicked){
  return TextButton(
      onPressed: (){
        clicked();
      },
      child: Text(txt)
  );
}