import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_list.dart';

class ActionButton extends StatelessWidget {
  final IconData iconData;
  final Function() onPressed;

  const ActionButton({
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.5),
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPressed,
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}
