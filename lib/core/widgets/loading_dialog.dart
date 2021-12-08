import 'package:flutter/material.dart';

showLoaderDialog(context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
        Container(
            margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible:false,
    context: context,
    builder: (BuildContext context) {

      // Navigator.of(context).pop(true);

      return alert;
    },
  );
}

