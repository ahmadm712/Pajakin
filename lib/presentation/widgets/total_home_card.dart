import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pajakin/data/models/pemasukan_model.dart';
import 'package:pajakin/data/models/pengeluaran_model.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/utils/currency_format.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/styles.dart';

class TotalHomeCard extends StatefulWidget {
  const TotalHomeCard({
    Key? key,
  }) : super(key: key);

  @override
  State<TotalHomeCard> createState() => _TotalHomeCardState();
}

class _TotalHomeCardState extends State<TotalHomeCard> {
  FirebaseServices firebaseServices = FirebaseServices();

  late int totalPengeluaran;

  late int totalPemasukan;

  @override
  void dispose() {
    super.dispose();
    firebaseServices.streamSaldo.close();
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      firebaseServices.calculateSaldo(id: auth.currentUser!.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Pemasukan',
                style: GlobalFunctions.textTheme(context: context)
                    .headline3!
                    .copyWith(
                      color: kColorPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              StreamBuilder<List<PemasukanModel>>(
                stream: firebaseServices.streamPemasukan.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('memproses...');
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    totalPemasukan = 0;
                    for (var element in snapshot.data!) {
                      totalPemasukan += element.jumlahPemasukan;
                    }
                    return Text(
                      CurrencyFormat.convertToIdr(totalPemasukan, 0),
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                    );
                  }
                  return SizedBox(
                    child: Text(
                      CurrencyFormat.convertToIdr(0, 0),
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(
                            color: kColorPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Pengeluaran',
                style: GlobalFunctions.textTheme(context: context)
                    .headline3!
                    .copyWith(
                      color: kColorPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              StreamBuilder<List<PengeluaranModel>>(
                stream: firebaseServices.streamPengeluaran.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('memproses...');
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    totalPengeluaran = 0;
                    for (var element in snapshot.data!) {
                      totalPengeluaran += element.jumlahPengeluaran;
                    }

                    return Text(
                      CurrencyFormat.convertToIdr(totalPengeluaran, 0),
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                    );
                  }
                  return SizedBox(
                    child: Text(
                      CurrencyFormat.convertToIdr(0, 0),
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(
                            color: kColorPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Saldo',
                style: GlobalFunctions.textTheme(context: context)
                    .headline3!
                    .copyWith(
                      color: kColorPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              StreamBuilder<int>(
                stream: firebaseServices.streamSaldo.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('memproses...');
                  } else if (snapshot.hasData) {
                    return Text(
                      CurrencyFormat.convertToIdr(snapshot.data, 0),
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(
                            color: kColorPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                    );
                  }
                  return SizedBox(
                    child: Text(
                      CurrencyFormat.convertToIdr(0, 0),
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(
                            color: kColorPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
