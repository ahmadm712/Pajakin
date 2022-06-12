import 'package:flutter/material.dart';

import 'package:pajakin/data/models/kas_model.dart';
import 'package:pajakin/utils/currency_format.dart';
import 'package:pajakin/utils/global_function.dart';

class TotalPemasukanPengeluaranCard extends StatelessWidget {
  KasModel kas;
  TotalPemasukanPengeluaranCard({
    Key? key,
    required this.kas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Pemasukan',
                  style: GlobalFunctions.textTheme(context: context)
                      .headline3!
                      .copyWith(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
              Text(CurrencyFormat.convertToIdr(kas.pemasukan, 0),
                  style: GlobalFunctions.textTheme(context: context)
                      .headline3!
                      .copyWith(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Pengeluaran',
                style: GlobalFunctions.textTheme(context: context)
                    .headline3!
                    .copyWith(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
              ),
              Text(CurrencyFormat.convertToIdr(kas.pengeluaran, 0),
                  style: GlobalFunctions.textTheme(context: context)
                      .headline3!
                      .copyWith(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Saldo',
                  style: GlobalFunctions.textTheme(context: context)
                      .headline3!
                      .copyWith(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
              Text(
                CurrencyFormat.convertToIdr(kas.saldo, 0),
                style: GlobalFunctions.textTheme(context: context)
                    .headline3!
                    .copyWith(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
