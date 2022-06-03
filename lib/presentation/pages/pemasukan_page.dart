import 'package:flutter/material.dart';
import 'package:pajakin/utils/constans.dart';

import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/styles.dart';

class PemasukanPage extends StatefulWidget {
  String status;
  PemasukanPage({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  State<PemasukanPage> createState() => _PemasukanPageState();
}

class _PemasukanPageState extends State<PemasukanPage> {
  String date = "";
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final size = GlobalFunctions.screenSize(context: context);

    _selectDate(BuildContext context) async {
      final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2025),
      );
      if (selected != null && selected != selectedDate) {
        setState(() {
          selectedDate = selected;
          date =
              "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
        });
      }
    }

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
            if (widget.status == 'tambah') ...[
              Text(
                'Tambah Pemasukan',
                style: GlobalFunctions.textTheme(context: context)
                    .headline3!
                    .copyWith(
                      color: kColorPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ] else ...[
              Text(
                'Edit Pemasukan',
                style: GlobalFunctions.textTheme(context: context)
                    .headline3!
                    .copyWith(
                      color: kColorPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
            const SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggal/Bulan/Tahun',
                    style: GlobalFunctions.textTheme(context: context)
                        .headline3!
                        .copyWith(
                          color: kColorPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 11),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(
                            0xffD6D6D6,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 15),
                      height: 45,
                      width: size.width,
                      child: Text(
                        date != "" ? date : 'Masukan Tanggal/Bulan/Tahun',
                        style: GlobalFunctions.textTheme(context: context)
                            .headline3!
                            .copyWith(
                              color: const Color(0xff9E9E9E),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
