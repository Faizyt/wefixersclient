import 'package:flutter/material.dart';

import '../utils/colorconst.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? colorofbutton;
  final Color? coloroftext;
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.colorofbutton,
    this.coloroftext,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        clipBehavior: Clip.antiAlias,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: colorofbutton ?? ColorConst.primaryColor,
          minimumSize: const Size(180, 50),
          shadowColor: Colors.black,
          foregroundColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: coloroftext ?? Colors.white),
        ));
  }
}
