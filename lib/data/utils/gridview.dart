import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlignedGrid extends StatelessWidget {
  final double mainSpacing ;
  final double spacing ;
  final int columns ;
  final List<Widget> widgets;

  const AlignedGrid({super.key, required this.mainSpacing, required this.spacing, required this.columns, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Wrap(
          runSpacing: mainSpacing,
          spacing: spacing,
          alignment: WrapAlignment.center,
          children: widgets
        ),
      ),
    );
  }
}