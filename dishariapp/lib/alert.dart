import 'package:flutter/material.dart';


Future<void> showMyDialog(BuildContext context, String alertTitle, String alertBody, String action) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '$alertTitle',
            style: TextStyle(
              fontFamily: 'Hindsiliguri',
              fontSize: 18.0,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '$alertBody',
                  style: TextStyle(
                    fontFamily: 'Hindsiliguri',
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                '$action',
                style: TextStyle(
                  fontFamily: 'Hindsiliguri',
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
