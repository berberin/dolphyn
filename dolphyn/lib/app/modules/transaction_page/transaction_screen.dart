import 'package:dolphyn/app/data/models/holder.dart';
import 'package:dolphyn/app/data/models/token.dart';
import 'package:dolphyn/app/data/models/transaction.dart';
import 'package:dolphyn/app/data/service/api_service.dart';
import 'package:dolphyn/app/modules/token_page/holder_card.dart';
import 'package:dolphyn/app/widgets/dialogs/custom_dialog.dart';
import 'package:flutter/material.dart';

import 'transaction_card.dart';

class TransactionScreen extends StatefulWidget {
  TokenInfo tokenInfo;
  Holder holder;

  TransactionScreen({this.tokenInfo, this.holder});

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  Future<List<Transaction>> trans;

  @override
  void initState() {
    super.initState();
    trans = ApiService.getTransactions(
        widget.tokenInfo.address, widget.holder.address);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              HolderCard(
                holder: widget.holder,
                tokenInfo: widget.tokenInfo,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Transactions in DB:",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: trans,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data.length != 0
                          ? ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return TransactionCard(
                                  tx: snapshot.data[index],
                                  tokenInfo: widget.tokenInfo,
                                  address: widget.holder.address,
                                );
                              },
                            )
                          : Text("No transaction in DB.");
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
