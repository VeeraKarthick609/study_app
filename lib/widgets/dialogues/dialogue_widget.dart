import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._singleton;
  factory Dialogs() {
    return _singleton;
  }

  static Widget questionStartDialog({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text('Please login to continue')
          ]),
      actions: [TextButton(onPressed: onTap, child: Text('Confirm'))],
    );
  }
}
