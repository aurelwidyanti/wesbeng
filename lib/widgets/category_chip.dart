import 'package:flutter/material.dart';

class CategoryChip extends StatefulWidget {
  final String label;

  const CategoryChip({Key? key, required this.label}) : super(key: key);

  @override
  _CategoryChipState createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  bool _isSelected = false;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      child: Chip(
        backgroundColor:
            _isSelected ? Theme.of(context).primaryColor : Colors.white,
        label: Text(
          widget.label,
          style: TextStyle(color: _isSelected ? Colors.white : Colors.black),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
