import 'package:flutter/material.dart';

Widget commonDrawerTile({
  required IconData icon,
  required String name,
  required Function()? onTap,
}) =>
    ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: onTap,
    );

Widget commonDrawerText({
  required String text,
  Color color = Colors.grey,
  double size = 14,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: size),
      ),
    );
