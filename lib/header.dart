import 'package:flutter/material.dart';

Widget header(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color(0xFFE7EEF8),
                    blurRadius: 4.0,
                    offset: Offset(0.6, 0.7))
              ],
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(18)),
          child: const Icon(Icons.keyboard_backspace),
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color(0xFFE7EEF8),
                    blurRadius: 4.0,
                    offset: Offset(0.6, 0.7))
              ],
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(18)),
          child: const Icon(Icons.local_grocery_store),
        ),
        const SizedBox(width: 20),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color(0xFFE7EEF8),
                    blurRadius: 4.0,
                    offset: Offset(0.6, 0.7))
              ],
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(18)),
          child: const Icon(Icons.menu),
        )
      ])
    ],
  );
}
