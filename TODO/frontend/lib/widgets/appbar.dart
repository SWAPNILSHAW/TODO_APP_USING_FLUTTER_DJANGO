import 'package:flutter/material.dart';
import 'package:frontend/Constants/colors.dart';

AppBar customAppbar(){
  return AppBar(
    title: const Text('Django Todos',style: TextStyle(color: Colors.white),),
    elevation: 0.0,
    backgroundColor: darkBlue,
  );
}