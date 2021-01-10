import 'package:dolphyn/app/data/service/wallet_service.dart';
import 'package:dolphyn/app/modules/homepage/homescreen.dart';
import 'package:dolphyn/app/modules/login/import_dialog.dart';
import 'package:dolphyn/app/widgets/dialogs/custom_dialog.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    AssetImage('assets/pexels-daniel-torobekov-4886376.jpg'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    'Dolphyn',
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          color: priText,
                        ),
                  ),
                  Text(
                    'Token\'s Holders Tracking App',
                    style: TextStyle(color: priText),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  //side: BorderSide(color: Colors.red, width: 2),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    "IMPORT WALLET",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                color: priText,
                textColor: secText,
                onPressed: () async {
                  showNormalDialog(
                    context: context,
                    widget: ImportDialog(),
                  );
                },
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              ),
              SizedBox(
                height: 30,
              ),
              OutlineButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  //side: BorderSide(color: Colors.red, width: 2),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    "CREATE NEW WALLET",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                color: priText,
                textColor: secText,
                onPressed: () async {
                  await WalletService.init();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'You will need at least 1 Lovely Dolphin Token (LOVDOL-69) to use this app.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: secText),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
