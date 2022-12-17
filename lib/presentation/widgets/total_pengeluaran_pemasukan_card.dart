import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pajakin/data/models/pemasukan_model.dart';
import 'package:pajakin/data/models/pengeluaran_model.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/utils/currency_format.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/styles.dart';

class TotalPemasukanPengeluaranCard extends StatefulWidget {
  const TotalPemasukanPengeluaranCard({
    Key? key,
  }) : super(key: key);

  @override
  State<TotalPemasukanPengeluaranCard> createState() =>
      _TotalPemasukanPengeluaranCardState();
}

class _TotalPemasukanPengeluaranCardState
    extends State<TotalPemasukanPengeluaranCard> {
  FirebaseServices firebaseServices = FirebaseServices();

  late int totalPengeluaran;

  late int totalPemasukan;

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Pemasukan',
                style: GlobalFunctions.textTheme(context: context)
                    .headline3!
                    .copyWith(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
              ),
              StreamBuilder<List<PemasukanModel>>(
                stream: firebaseServices.streamPemasukan.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: kColorPrimary,
                        strokeWidth: 0.8,
                      ),
                    );
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
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                    );
                  }
                  return SizedBox(
                    child: Center(
                      child: Text(
                        CurrencyFormat.convertToIdr(0, 0),
                        style: GlobalFunctions.textTheme(context: context)
                            .headline3!
                            .copyWith(
                                color: Colors.green,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                },
              ),
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
              StreamBuilder<List<PengeluaranModel>>(
                stream: firebaseServices.streamPengeluaran.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: kColorPrimary,
                      strokeWidth: 0.8,
                    ));
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
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                    );
                  }
                  return SizedBox(
                    child: Center(
                      child: Text(
                        CurrencyFormat.convertToIdr(0, 0),
                        style: GlobalFunctions.textTheme(context: context)
                            .headline3!
                            .copyWith(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Saldo',
                style: GlobalFunctions.textTheme(context: context)
                    .headline3!
                    .copyWith(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
              ),
              StreamBuilder<int>(
                stream: firebaseServices.streamSaldo.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: kColorPrimary,
                        strokeWidth: 0.8,
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return Text(
                      CurrencyFormat.convertToIdr(snapshot.data, 0),
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                    );
                  }
                  return SizedBox(
                    child: Center(
                      child: Text(
                        CurrencyFormat.convertToIdr(0, 0),
                        style: GlobalFunctions.textTheme(context: context)
                            .headline3!
                            .copyWith(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
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
