import 'package:dolphyn/app/modules/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

String dataTokenUrl =
    "https://market.oceanprotocol.com/asset/did:op:555a0DD8B24963e38FFF1a0c84F13f694Bd0f4F6";

class BuyDataTokenScreen extends StatefulWidget {
  @override
  _BuyDataTokenScreenState createState() => _BuyDataTokenScreenState();
}

class _BuyDataTokenScreenState extends State<BuyDataTokenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Oops, you don\'t have enough Lovely Dolphin Datatoken (LOVDOL-69). You will need at least 1 LOVDOL-69 to use this application. You can go to Ocean to buy some.',
                    style: TextStyle(
                      color: secText,
                    ),
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    //side: BorderSide(color: Colors.red, width: 2),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "GO TO OCEAN",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  color: priText,
                  textColor: secText,
                  onPressed: () async {
                    if (await canLaunch(dataTokenUrl)) {
                      await launch(dataTokenUrl);
                    }
                  },
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  splashColor: Colors.grey,
                ),
              ],
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Dataset on Ocean:',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SelectableText(dataTokenUrl),
              ],
            ),
            OutlineButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                //side: BorderSide(color: Colors.red, width: 2),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  "CHANGE WALLET",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              color: priText,
              textColor: secText,
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
