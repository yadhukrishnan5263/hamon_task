import 'package:flutter/material.dart';

showLoading(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(child: CircularProgressIndicator(
          color: Colors.indigo,

        ))
      );
    },
  );
}
hideLoading(context) {
  Navigator.of(context).pop();
}