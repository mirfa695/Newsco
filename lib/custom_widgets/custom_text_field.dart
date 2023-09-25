import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.controller, this.text, this.choice, this.icon, this.val, Key? key})
      : super(key: key);
  TextEditingController? controller;
  String? text;
  bool? choice;
  IconData? icon;
  String? Function(String?)? val;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: choice ?? false,
      controller: controller,
      onTap: () {},
      validator: val,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.withOpacity(.3),
          prefixIcon: Icon(icon),
          prefixIconColor: Colors.black.withOpacity(.3),
          labelStyle: TextStyle(color: Colors.black.withOpacity(.3)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(.3))),
          hintText: text,
          hintStyle: TextStyle(color: Colors.black.withOpacity(.5))),
    );
  }
}
