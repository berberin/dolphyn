import 'package:dolphyn/app/data/models/token.dart';
import 'package:dolphyn/app/modules/token_page/token_screen.dart';
import 'package:dolphyn/app/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:jdenticon_dart/jdenticon_dart.dart';

class TokenCard extends StatelessWidget {
  TokenInfo tokenInfo;

  TokenCard(this.tokenInfo);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TokenScreen(tokenInfo)));
      },
      child: Card(
        elevation: 3,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Avatar(
                  svg: Jdenticon.toSvg(tokenInfo.address),
                  size: 50,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tokenInfo.name,
                      style: Theme.of(context).textTheme.headline6,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      tokenInfo.symbol,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SelectableText(
                      tokenInfo.address,
                      style: Theme.of(context).textTheme.caption,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Holders: ${tokenInfo.holdersCount}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          'Transactions: ${tokenInfo.transfersCount}',
                          style: Theme.of(context).textTheme.caption,
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
