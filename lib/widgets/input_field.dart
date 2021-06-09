import 'package:flutter/material.dart';

Widget inputField(
  String hintText, {
  bool hasLabel: false,
  String? bottomNote,
  TextEditingController? controller,
  bool isMultiline: false,
  bool isPassword: false,
  TextInputAction? textInputAction: TextInputAction.next,
  TextInputType? keyboardType,
  Function(String)? onSubmitted,
  Function(String)? onChanged,
}) {
  return TextField(
    onChanged: onChanged,
    controller: controller,
    obscureText: isPassword,
    onSubmitted: onSubmitted,
    textInputAction: isMultiline ? null : textInputAction,
    keyboardType: isMultiline ? TextInputType.multiline : keyboardType,
    minLines: isMultiline ? 5 : null,
    maxLines: isMultiline
        ? 7
        : isPassword
            ? 1
            : null,
    decoration: InputDecoration(
      hintStyle: TextStyle(fontSize: 13),
      contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
      hintText: hintText,
      fillColor: Colors.grey[700],
      focusColor: Colors.grey[700],
      hoverColor: Colors.grey[700],
      border: OutlineInputBorder(
        gapPadding: 0,
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}
