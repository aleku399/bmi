import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {
    CustomColumn({
        super.key,
        required this.text,
        required this.child,
    });

    String text;
    Widget child;

    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                Text(
                    text,
                    style: TextStyle(fontSize: 18),
                ),
                child
            ],
        );
    }
}
