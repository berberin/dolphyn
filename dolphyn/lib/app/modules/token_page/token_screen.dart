import 'package:dolphyn/app/data/models/holder.dart';
import 'package:dolphyn/app/data/models/token.dart';
import 'package:dolphyn/app/data/service/api_service.dart';
import 'package:dolphyn/app/modules/homepage/token_card.dart';
import 'package:dolphyn/app/widgets/dialogs/custom_dialog.dart';
import 'package:flutter/material.dart';

import 'holder_card.dart';

class TokenScreen extends StatefulWidget {
  TokenInfo tokenInfo;

  TokenScreen(this.tokenInfo);

  @override
  _TokenScreenState createState() => _TokenScreenState();
}

class _TokenScreenState extends State<TokenScreen> {
  Future<List<Holder>> holders;

  @override
  void initState() {
    super.initState();
    holders = ApiService.getHolders(widget.tokenInfo.address);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TokenCard(widget.tokenInfo),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Holders:",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: holders,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return HolderCard(
                            holder: snapshot.data[index],
                            tokenInfo: widget.tokenInfo,
                          );
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
      ),
    );
  }
}
