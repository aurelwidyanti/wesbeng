import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:wesbeng/screens/ewallet/detail_wallet_screen.dart';

class EWallet extends StatefulWidget {
  const EWallet({super.key});

  @override
  State<EWallet> createState() => _EWalletState();
}

class _EWalletState extends State<EWallet> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            alignment: AlignmentDirectional.bottomStart,
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  const Text(
                    'E-Wallet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      HeroiconsSolid.arrowLongRight,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailWalletScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Positioned(
              child: Container(
                height: 144,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 12,
              left: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Available balance",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _isHidden ? '**********' : 'Rp5000,00',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        iconSize: 22,
                        icon: Icon(
                          _isHidden
                              ? HeroiconsSolid.eye
                              : HeroiconsSolid.eyeSlash,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 200,
              child: Image.asset("assets/img/mascot.png", width: 160),
            ),
          ],
        ),
      ],
    );
  }
}
