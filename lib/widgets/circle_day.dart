import 'package:flutter/material.dart';

Widget circleDay(day, context, selected){
  return Container(
    width: 50.0,
    height: 50.0,
    decoration: BoxDecoration(
      color: (selected)?Color(0xFFEB1555):Colors.transparent,
      borderRadius: BorderRadius.circular(80.0)
    ),
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0
          ),
        ),
      ),
    )
  );
}