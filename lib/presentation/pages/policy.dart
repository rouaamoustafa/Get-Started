import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextWithLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black,
          letterSpacing: -1,
          height: 1.2,
        ),
        children: [
           const TextSpan(
            text: "By signing up you agree to our ",
          ),
          _buildClickableTextSpan("Terms", () {

            print("Terms clicked");
          }),
          const TextSpan(
            text: ", ",
          ),
          _buildClickableTextSpan("Privacy Policy", () {

            print("Privacy Policy clicked");
          }),
          const TextSpan(
            text: ", and ",
          ),
          _buildClickableTextSpan("Cookie Use", () {

            print("Cookie Use clicked");
          }),
        ],
      ),
    );
  }

  TextSpan _buildClickableTextSpan(String text, VoidCallback onTap) {
    return TextSpan(
      text: text,
      style:const TextStyle(
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = onTap,
    );
  }
}
