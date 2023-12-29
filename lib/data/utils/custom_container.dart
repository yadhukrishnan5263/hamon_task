import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContanier extends StatelessWidget {
  final Widget child;
  final double borderradius;
  final double height;
  final double width;

  const CustomContanier({super.key, required this.child, required this.borderradius, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 8,
            spreadRadius: 0.5,
            offset: Offset(0, 0),
          )
        ],
        borderRadius: BorderRadius.circular(borderradius),
      ),
      child:child
    );
  }
}
