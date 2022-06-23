import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/data/models/pengeluaran_model.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/currency_format.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';

class PengeluaranCard extends StatelessWidget {
  const PengeluaranCard({
    Key? key,
  }) : super(key: key);

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
          child: FutureBuilder<List<PengeluaranModel>>(
            future: FirebaseServices()
                .retrievePengeluaran(id: auth.currentUser!.uid),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: CircularProgressIndicator(
                  color: kColorPrimary,
                  strokeWidth: 0.8,
                ));
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final pengeluaran = snapshot.data![index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.PENGELUARAN_PAGE,
                            arguments: {
                              'status': "edit",
                              'pengeluaran': pengeluaran
                            });
                      },
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Text(pengeluaran.tanggalPemasukan,
                                style:
                                    GlobalFunctions.textTheme(context: context)
                                        .headline3!
                                        .copyWith(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                            const SizedBox(width: 11),
                            Text(pengeluaran.keterangan,
                                style:
                                    GlobalFunctions.textTheme(context: context)
                                        .headline3!
                                        .copyWith(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                            const Spacer(),
                            Text(
                                CurrencyFormat.convertToIdr(
                                    pengeluaran.jumlahPengeluaran, 0),
                                style:
                                    GlobalFunctions.textTheme(context: context)
                                        .headline3!
                                        .copyWith(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return const SizedBox(
                child: Center(
                  child: Text(
                    'Tidak ada data pengeluaran',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
