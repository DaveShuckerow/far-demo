import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      elevation: 4.0,
      child: new Container(height: 32.0, child: new Text('text input')),
    );
  }
}
