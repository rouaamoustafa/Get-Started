import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final bool isPassword;
  const CustomTextField({Key? key, required this.labelText, required this.hintText, this.icon , this.controller,this.isPassword = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black.withOpacity(0.9),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            controller:controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:const TextStyle(color: Colors.grey, fontSize: 19, fontWeight: FontWeight.normal),
              border: InputBorder.none,
              contentPadding:const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              suffixIcon: icon != null ? Icon(icon) : null,
            ),
          ),
        ),
      ],
    );
  }
}


