import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/styles.dart';

class TotalPemasukanPengeluaranCard extends StatelessWidget {
  const TotalPemasukanPengeluaranCard({
    Key? key,
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
              Text('RP.55.000.000',
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
              Text('Rp.-55.000.000',
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
                '55.000.000',
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
