import 'package:flutter/material.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/styles.dart';

class BukuKasPage extends StatefulWidget {
  const BukuKasPage({Key? key}) : super(key: key);

  @override
  State<BukuKasPage> createState() => _BukuKasPageState();
}

class _BukuKasPageState extends State<BukuKasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kColorSecondary,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            '${assetIcons}icon-back.png',
            height: 25,
            width: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buku Kas',
              style: GlobalFunctions.textTheme(context: context)
                  .headline3!
                  .copyWith(
                      color: kColorPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 22,
            ),
            // Total
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Pemasukan',
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(
                              color: kColorPrimary,
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
                            color: kColorPrimary,
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
                              color: kColorPrimary,
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
        ),
      ),
    );
  }
}
