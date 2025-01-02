import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:wesbeng/screens/ewallet/widgets/dropdown_wallet.dart';
import 'package:wesbeng/widgets/custom_button.dart';

class CashOutScreen extends StatefulWidget {
  const CashOutScreen({super.key});

  @override
  State<CashOutScreen> createState() => _CashOutScreenState();
}

class _CashOutScreenState extends State<CashOutScreen> {
  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Cash Out',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FormField(
              builder: (state) {
                return Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        prefixText: 'IDR ',
                        prefixStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        helperText: 'Minimum amount is Rp10.000',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 12,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    DropdownWallet(
                      labelText: "Select Bank",
                      value: selectedBank,
                      items: const ['ShopeePay', 'OVO', 'DANA', 'LinkAja'],
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBank = newValue;
                        });
                        print('Selected Bank: $newValue');
                      },
                      validator: (value) =>
                          value == null ? 'Please select a bank' : null,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: CustomButton(
                        onPressed: () {
                          if (state.validate()) {
                            print('Cash Out');
                          }
                        },
                        text: 'Cash Out',
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
