import 'package:dolphyn/app/data/service/wallet_service.dart';
import 'package:dolphyn/app/modules/homepage/homescreen.dart';
import 'package:dolphyn/app/widgets/dialogs/custom_dialog.dart';
import 'package:dolphyn/app/widgets/text_form.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ImportDialog extends StatefulWidget {
  @override
  _ImportDialogState createState() => _ImportDialogState();
}

class _ImportDialogState extends State<ImportDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Import Private Key",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              "Please enter private key in hex string. This key will be stored in this device only.",
            ),
            SizedBox(
              height: 20,
            ),
            //Text("Private Key", style: Theme.of(context).textTheme.headline6),
            SizedBox(
              height: 10,
            ),
            TextForm(
              labelText: "Private Key",
              hintText: "",
              controller: _privateKeyCtrl,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlineButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Text("CANCEL"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Text("IMPORT"),
                  color: secText,
                  onPressed: () async {
                    showLoadingDialog(context);
                    try {
                      await WalletService.init(
                          privateKey: _privateKeyCtrl.text);
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextEditingController _privateKeyCtrl;

  @override
  void initState() {
    super.initState();
    _privateKeyCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _privateKeyCtrl.dispose();
    super.dispose();
  }
}
