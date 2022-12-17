import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pajakin/data/models/pengeluaran_model.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/currency_format.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';

class PengeluaranCard extends StatefulWidget {
  const PengeluaranCard({
    Key? key,
  }) : super(key: key);

  @override
  State<PengeluaranCard> createState() => _PengeluaranCardState();
}

class _PengeluaranCardState extends State<PengeluaranCard> {
  FirebaseServices firebaseServices = FirebaseServices();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      firebaseServices.retrievePengeluaran(id: auth.currentUser!.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pengeluaran',
              style: GlobalFunctions.textTheme(context: context)
                  .headline3!
                  .copyWith(
                      color: kColorPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
            ),
            Container(
              child: Row(
                children: [
                  const SizedBox(
                    width: 18,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.PENGELUARAN_PAGE,
                        arguments: {
                          'status': "tambah",
                        },
                      );
                    },
                    child: Image.asset(
                      '${assetIcons}icon-add.png',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 21,
        ),
        Container(
          height: 200,
          child: StreamBuilder<List<PengeluaranModel>>(
            stream: firebaseServices.streamPengeluaran.stream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                      child: CircularProgressIndicator(
                    color: kColorPrimary,
                    strokeWidth: 0.8,
                  ));
                default:
                  if (snapshot.hasError) {
                    return const Text('Please Wait....');
                  } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                    return const SizedBox(
                      child: Center(
                        child: Text(
                          'Tidak ada data pengeluaran',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final pengeluaran = snapshot.data![index];
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) async {
                            if (direction == DismissDirection.startToEnd) {
                              await firebaseServices
                                  .deleteItemPengeluaran(docId: pengeluaran.id)
                                  .whenComplete(
                                    () => GlobalFunctions.scaffoldMessage(
                                        context: context,
                                        message: 'Hapus Pengeluaran Succes',
                                        color: Colors.red),
                                  );
                            } else {
                              await firebaseServices
                                  .deleteItemPengeluaran(docId: pengeluaran.id)
                                  .whenComplete(
                                    () => GlobalFunctions.scaffoldMessage(
                                        context: context,
                                        message: 'Hapus Pengeluaran Succes',
                                        color: Colors.red),
                                  );
                            }
                          },
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.PENGELUARAN_PAGE,
                                arguments: {
                                  'status': "edit",
                                  'pengeluaran': pengeluaran
                                },
                              );
                            },
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    pengeluaran.tanggalPemasukan,
                                    style: GlobalFunctions.textTheme(
                                            context: context)
                                        .headline3!
                                        .copyWith(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 11),
                                  Text(
                                    pengeluaran.keterangan,
                                    style: GlobalFunctions.textTheme(
                                            context: context)
                                        .headline3!
                                        .copyWith(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  const Spacer(),
                                  Text(
                                    CurrencyFormat.convertToIdr(
                                        pengeluaran.jumlahPengeluaran, 0),
                                    style: GlobalFunctions.textTheme(
                                            context: context)
                                        .headline3!
                                        .copyWith(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
              }
            },
          ),
        ),
      ],
    );
  }
}
