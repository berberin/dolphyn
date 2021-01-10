import 'package:dolphyn/app/data/service/wallet_service.dart';
import 'package:dolphyn/app/modules/buy_datatoken_page/buy_datatoken_screen.dart';
import 'package:dolphyn/app/modules/homepage/homescreen.dart';
import 'package:flutter/material.dart';

class Lobby extends StatefulWidget {
  @override
  _LobbyState createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  void initState() {
    super.initState();
    WalletService.checkBalance().then((value) {
      if (value < 99000000000000000.0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BuyDataTokenScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    });
  }
}
