import 'package:dolphyn/app/data/models/token.dart';
import 'package:dolphyn/app/data/service/api_service.dart';
import 'package:dolphyn/app/modules/homepage/token_card.dart';
import 'package:dolphyn/app/widgets/dialogs/custom_dialog.dart';
import 'package:dolphyn/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<TokenInfo>> tokens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Choose a token: ',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: priText),
            ),
            Expanded(
              child: FutureBuilder(
                future: tokens,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return TokenCard(snapshot.data[index]);
                      },
                    );
                  }
                  return AsyncSpinKit();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    tokens = ApiService.getTokenInfo();
  }
}
