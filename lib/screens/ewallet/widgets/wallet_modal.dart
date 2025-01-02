import 'package:flutter/material.dart';

class WalletModal extends StatelessWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const WalletModal({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return ListView(
              controller: scrollController,
              padding: const EdgeInsets.only(top: 16),
              children: items
                  .map((item) => ListTile(
                        leading: Image.asset(
                          'assets/img/icons/${item.toLowerCase()}.png',
                          width: 32,
                          height: 32,
                        ),
                        title: Text(item),
                        onTap: () {
                          onChanged(item);
                          Navigator.pop(context);
                        },
                      ))
                  .toList(),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showModal(context),
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (value != null)
              Row(
                children: [
                  Image.asset(
                    'assets/img/icons/${value!.toLowerCase()}.png',
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            Text(
              value ?? 'Select an option',
              style: TextStyle(
                color: value == null ? Colors.grey : Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
