import 'package:flutter/material.dart';

Widget card({double ?width = double.infinity, double ?padding = 20, Widget ?child }){
  return Container(
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        padding: const EdgeInsets.all(20),
        child: child,
  );
}
