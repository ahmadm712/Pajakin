import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/utils/constans.dart';
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
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.PENGELUARAN_PAGE,
                        arguments: 'edit',
                      );
                    },
                    child: Image.asset(
                      '${assetIcons}icon-edit.png',
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.PENGELUARAN_PAGE,
                        arguments: 'tambah',
                      );
                      FirebaseServices.addPemasukan(
                          date: '10-10-2022',
                          description: 'Jajan',
                          jumlahPemasukan: 100);
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
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('pengeluaran')
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: CircularProgressIndicator(
                  color: kColorPrimary,
                  strokeWidth: 0.8,
                ));
              } else if (snapshot.hasData) {
                print(snapshot.data);
                return ListView.builder(
                  itemCount: snapshot.data!.size,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Text(snapshot.data.toString(),
                              style: GlobalFunctions.textTheme(context: context)
                                  .headline3!
                                  .copyWith(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                          const SizedBox(width: 11),
                          Text('Transportasi',
                              style: GlobalFunctions.textTheme(context: context)
                                  .headline3!
                                  .copyWith(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                          const Spacer(),
                          Text('Rp.-55.000.000',
                              style: GlobalFunctions.textTheme(context: context)
                                  .headline3!
                                  .copyWith(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400))
                        ],
                      ),
                    );
                  },
                );
              }
              return const SizedBox(
                child: Center(
                  child: Text(
                    'No Data',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text('27/05/2022',
                  style: GlobalFunctions.textTheme(context: context)
                      .headline3!
                      .copyWith(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
              const SizedBox(width: 11),
              Text('Transportasi',
                  style: GlobalFunctions.textTheme(context: context)
                      .headline3!
                      .copyWith(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
              const Spacer(),
              Text('Rp.-55.000.000',
                  style: GlobalFunctions.textTheme(context: context)
                      .headline3!
                      .copyWith(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w400))
            ],
          ),
        ),
        // Container(
        //   margin: const EdgeInsets.only(bottom: 10),
        //   child: Row(
        //     children: [
        //       Text('27/05/2022',
        //           style: GlobalFunctions.textTheme(context: context)
        //               .headline3!
        //               .copyWith(
        //                   color: Colors.black,
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w400)),
        //       const SizedBox(width: 11),
        //       Text('Transportasi',
        //           style: GlobalFunctions.textTheme(context: context)
        //               .headline3!
        //               .copyWith(
        //                   color: Colors.black,
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w400)),
        //       const Spacer(),
        //       Text('Rp.-55.000.000',
        //           style: GlobalFunctions.textTheme(context: context)
        //               .headline3!
        //               .copyWith(
        //                   color: Colors.red,
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w400))
        //     ],
        //   ),
        // ),
        // Container(
        //   margin: const EdgeInsets.only(bottom: 10),
        //   child: Row(
        //     children: [
        //       Text('27/05/2022',
        //           style: GlobalFunctions.textTheme(context: context)
        //               .headline3!
        //               .copyWith(
        //                   color: Colors.black,
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w400)),
        //       const SizedBox(width: 11),
        //       Text('Transportasi',
        //           style: GlobalFunctions.textTheme(context: context)
        //               .headline3!
        //               .copyWith(
        //                   color: Colors.black,
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w400)),
        //       const Spacer(),
        //       Text('Rp.-55.000.000',
        //           style: GlobalFunctions.textTheme(context: context)
        //               .headline3!
        //               .copyWith(
        //                   color: Colors.red,
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w400))
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
