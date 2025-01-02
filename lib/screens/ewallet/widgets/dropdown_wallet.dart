import 'package:flutter/material.dart';

class DropdownWallet extends StatelessWidget {
  final String labelText;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const DropdownWallet({
    Key? key,
    required this.labelText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      ),
      items: items.map((String item) {
        final Map<String, String> bankIcons = {
          'ShopeePay': 'assets/img/icons/shopeepay.png',
          'OVO': 'assets/img/icons/ovo.png',
          'DANA': 'assets/img/icons/dana.png',
          'LinkAja': 'assets/img/icons/linkaja.png',
        };

        final String? img = bankIcons[item];
        return DropdownMenuItem<String>(
          value: item,
          child: Row(
            children: [
              if (img != null)
                Image.asset(
                  img,
                  width: 24,
                  height: 24,
                )
              else
                const Icon(Icons.error_outline),
              const SizedBox(width: 8),
              Text(
                item,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
