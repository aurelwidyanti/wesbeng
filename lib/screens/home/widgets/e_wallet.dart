import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("assets/img/wallet.png"),
          ),
        ),
        Positioned(
          top: 4,
          left: 12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _isHidden ? '**********' : 'Rp 1.000.000',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                iconSize: 22,
                icon: Icon(
                  _isHidden ? HeroiconsSolid.eye : HeroiconsSolid.eyeSlash,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isHidden = !_isHidden;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
