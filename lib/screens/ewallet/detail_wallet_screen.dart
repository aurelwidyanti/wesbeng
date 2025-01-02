import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wesbeng/providers/transaction_provider.dart';
import 'package:wesbeng/providers/user_provider.dart';
import 'package:wesbeng/screens/ewallet/cash_out_screen.dart';
import 'package:wesbeng/screens/ewallet/widgets/action_button.dart';
import 'package:wesbeng/services/api_service.dart';

class DetailWalletScreen extends StatefulWidget {
  const DetailWalletScreen({super.key});

  @override
  State<DetailWalletScreen> createState() => _DetailWalletScreenState();
}

class _DetailWalletScreenState extends State<DetailWalletScreen> {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    if (transactionProvider.isFetching) {
      return const Center(child: CircularProgressIndicator());
    }

    final transactions = transactionProvider.transactions;
    final user = userProvider.user;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'E-Wallet',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 24),
                height: 240,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.9],
                    colors: [
                      Color.fromRGBO(30, 32, 30, 1),
                      Color.fromRGBO(60, 61, 55, 1),
                      Color.fromRGBO(105, 117, 101, 1)
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      'Rp${user!.balance!}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                    const Spacer(),
                    ActionButton(
                      iconData: HeroiconsSolid.arrowRightOnRectangle,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CashOutScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recent Transactions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    transactions.isEmpty
                        ? const SizedBox(
                            height: 120,
                            child: const Center(
                              child: Text('No transactions yet'),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              final transaction = transactions[index];
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  side: BorderSide(
                                    color: Colors.grey[300]!,
                                    width: 1,
                                  ),
                                ),
                                color: Colors.white,
                                child: ListTile(
                                  title: Text(
                                    index % 2 == 0
                                        ? 'Penarikan ke e-wallet'
                                        : 'Uang masuk ke e-wallet',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  subtitle: Text(
                                    transaction.date!.toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        transaction.amount!.toString(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: index % 2 == 0
                                              ? Colors.red
                                              : Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
