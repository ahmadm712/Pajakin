import 'package:flutter/material.dart';
import 'package:pajakin/data/models/pemasukan_model.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/currency_format.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';

class PemasukanCard extends StatelessWidget {
  const PemasukanCard({
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
              'Pemasukan',
              style: GlobalFunctions.textTheme(context: context)
                  .headline3!
                  .copyWith(
                      color: kColorPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.PEMASUKAN_PAGE,
                  arguments: {
                    'status': "tambah",
                  },
                );
              },
              child: Image.asset(
                '${assetIcons}icon-add.png',
              ),
            )
          ],
        ),
        const SizedBox(
          height: 21,
        ),
        Container(
          height: 200,
          child: FutureBuilder<List<PemasukanModel>>(
            future:
                FirebaseServices().retrievePemasukan(id: auth.currentUser!.uid),
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
                    final pemasukan = snapshot.data![index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.PEMASUKAN_PAGE,
                            arguments: {
                              'status': "edit",
                              'pemasukan': pemasukan
                            });
                      },
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Text(pemasukan.tanggalPemasukan,
                                style:
                                    GlobalFunctions.textTheme(context: context)
                                        .headline3!
                                        .copyWith(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400)),
                            const SizedBox(width: 11),
                            Text(pemasukan.keterangan,
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
                                    pemasukan.jumlahPemasukan, 0),
                                style:
                                    GlobalFunctions.textTheme(context: context)
                                        .headline3!
                                        .copyWith(
                                            color: Colors.green,
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
                    'Tidak ada data Pemasukan',
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
