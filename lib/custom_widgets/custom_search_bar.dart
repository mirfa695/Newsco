import 'package:flutter/material.dart';

import '../utilities/const_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
          labelText: 'search',
          labelStyle:
          TextStyle(color: Colors.black.withOpacity(.2)),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey.withOpacity(.6),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.grey.withOpacity(.3)),
            borderRadius: BorderRadius.circular(30),
          ),
          // Set border for focused state
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ConstColors.constrColor),
            borderRadius: BorderRadius.circular(30),
          )));
  }
}
