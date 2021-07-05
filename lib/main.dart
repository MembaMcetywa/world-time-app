// import 'dart:js.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/Pages/Choose_Location.dart';
import 'package:myfirstapp/Pages/Home.dart';
import 'package:myfirstapp/Pages/Loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => Loading(),
      '/home': (context) => Home(),
       '/location': (context) => Choose_Location(),
  }
  ));
}

