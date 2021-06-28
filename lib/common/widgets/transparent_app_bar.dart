import 'package:flutter/material.dart';

AppBar transparentAppBar(
    {Widget? title, Widget? leading, List<Widget>? actions}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title != null
        ? Center(
      child: title,
    )
        : null,
    leading: leading,
    actions: actions,
  );
}