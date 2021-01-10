import 'package:dolphyn/app/data/models/token.dart';
import 'package:dolphyn/app/data/models/transaction.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TransactionCard extends StatelessWidget {
  TokenInfo tokenInfo;
  Transaction tx;
  String address;

  TransactionCard({this.tx, this.address, this.tokenInfo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 3,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  tx.from == address ? Icons.arrow_forward : Icons.arrow_back,
                  size: 40,
                  color:
                      tx.from == address ? Colors.red[400] : Colors.green[400],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      'From: ${tx.from}',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 11),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SelectableText(
                      'To: ${tx.to}',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 11),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Value: ',
                                  style: Theme.of(context).textTheme.caption),
                              TextSpan(
                                  text:
                                      '${(double.parse(tx.value) / (1000000000000000000)).toStringAsFixed(3)}  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(color: secText)),
                              TextSpan(
                                text: '${tokenInfo.symbol}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          DateTime.fromMillisecondsSinceEpoch(
                                  tx.timestamp * 1000)
                              .toString(),
                          style: Theme.of(context).textTheme.caption.copyWith(
                                fontSize: 10,
                              ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Transaction Hash:',
                            style: TextStyle(color: priText),
                          ),
                          SizedBox(height: 5),
                          SelectableText(
                            tx.transactionHash,
                            style: TextStyle(fontSize: 12, color: priText),
                          ),
                        ],
                      ),
                    )
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
