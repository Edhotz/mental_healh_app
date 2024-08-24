// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Feelingbutton extends StatelessWidget {
  final String label;
  final String image;
  final Color color;
  final VoidCallback onTap;

  const Feelingbutton(
      {super.key,
      required this.label,
      required this.image,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Image.asset(
            image,
            height: 25,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall,
        )
      ],
    );
  }
}
