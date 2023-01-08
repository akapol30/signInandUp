
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
 // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
 // _scaffoldKey.currentState.showSnackBar(
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
