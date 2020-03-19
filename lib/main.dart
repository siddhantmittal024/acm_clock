
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MaterialApp(
  title: 'My Clock',

  home:HomeScreen(),

  debugShowCheckedModeBanner: false,
  theme: ThemeData(fontFamily: 'Berlin'),
));


