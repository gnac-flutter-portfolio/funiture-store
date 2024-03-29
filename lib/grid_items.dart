import 'package:flutter/material.dart';

import 'category_model.dart';

class GridItems extends StatelessWidget {
  final int index;
  const GridItems(this.index, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Color(0xFFEAEEF9), blurRadius: 1, offset: Offset(4.5, 4.5))
        ],
        color: const Color(0xFFFFFFFF),
        borderRadius: index == 0 || index % 3 == 0
            ? const BorderRadius.only(
                topRight: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
      ),
      child: Column(
        children: [
          Image(
            width: 100,
            height: index % 2 == 0 ? 100 : 200,
            image:
                AssetImage("assets/images/${categoriesGrid[index].imageUrl}"),
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 4),
          Text(
            categoriesGrid[index].name,
            style: const TextStyle(
              color: Color(0xFFAAC8FC),
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            categoriesGrid[index].price,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
