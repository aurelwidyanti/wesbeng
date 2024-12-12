import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.white,
      label: Text(label),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
    );
  }
}
