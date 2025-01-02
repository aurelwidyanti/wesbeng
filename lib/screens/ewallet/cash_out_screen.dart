import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wesbeng/providers/cash_out_provider.dart';
import 'package:wesbeng/screens/ewallet/widgets/wallet_modal.dart';
import 'package:wesbeng/services/api_service.dart';
import 'package:wesbeng/widgets/custom_button.dart';

class CashOutScreen extends StatefulWidget {
  const CashOutScreen({super.key});

  @override
  State<CashOutScreen> createState() => _CashOutScreenState();
}

class _CashOutScreenState extends State<CashOutScreen> {
  String? selectedBank;
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final cashOutProvider = Provider.of<CashOutProvider>(context);

    if (cashOutProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final cashOuts = cashOutProvider.cashOuts;

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
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    WalletModal(
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
                  ],
                );
              },
            ),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: Consumer<CashOutProvider>(
                builder: (context, provider, child) {
                  return CustomButton(
                    text: 'Cash Out',
                    onPressed: () {
                      provider.createCashOut(
                          cashOuts.map((cashOut) => cashOut.amount).toString(),
                          cashOuts
                              .map((cashOut) => cashOut.ewalletName)
                              .toString());
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
