import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
    CustomButton({
        super.key,
        required this.onTap,
        this.color = Colors.white30,
        required this.icon 
    });

    VoidCallback onTap;
    Color? color;
    IconData icon;

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: onTap,
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(30),
                ),
                child:Icon(icon),
            ),
        );
    }
}