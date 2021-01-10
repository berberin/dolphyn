import 'package:dolphyn/app/data/models/holder.dart';
import 'package:dolphyn/app/data/models/token.dart';
import 'package:dolphyn/app/modules/transaction_page/transaction_screen.dart';
import 'package:dolphyn/app/widgets/avatar.dart';
import 'package:dolphyn/constants.dart';
import 'package:flutter/material.dart';
import 'package:jdenticon_dart/jdenticon_dart.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HolderCard extends StatelessWidget {
  TokenInfo tokenInfo;
  Holder holder;

  HolderCard({this.holder, this.tokenInfo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionScreen(
              tokenInfo: tokenInfo,
              holder: holder,
            ),
          ),
        );
      },
      child: Card(
        elevation: 3,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CircularPercentIndicator(
                  radius: 50,
                  lineWidth: 7.0,
                  percent: holder.share != null ? holder.share / 100 : 0,
                  backgroundColor: Colors.blueGrey[200],
                  progressColor: secText,
                  center: Text(
                    holder.share != null
                        ? '${holder.share.toStringAsFixed(1)}%'
                        : '---',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 10),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      holder.address,
                      style: Theme.of(context).textTheme.caption,
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
                                text: 'Balance: ',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              TextSpan(
                                text: holder.balance != null
                                    ? '${(holder.balance / (1000000000000000000)).toStringAsFixed(3)}  '
                                    : '---   ',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              TextSpan(
                                text: '${tokenInfo.symbol}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        Avatar(
                          svg: Jdenticon.toSvg(holder.address),
                          size: 30,
                        ),
                      ],
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
