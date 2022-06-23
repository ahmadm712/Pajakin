import 'package:flutter/material.dart';
import 'package:pajakin/data/models/pengeluaran_model.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/utils/constans.dart';

import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';

class PengeluaranPage extends StatefulWidget {
  Map<String, dynamic> data;
  PengeluaranPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<PengeluaranPage> createState() => _PengeluaranPageState();
}

class _PengeluaranPageState extends State<PengeluaranPage> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  late TextEditingController keteranganController;
  late TextEditingController pengeluaranController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // @override
  // void dispose() {
  //   super.dispose();
  //   // keteranganController.dispose();
  //   pengeluaranController.dispose();
  // }

  void clearField() {
    setState(() {
      date = "";
    });
    keteranganController.clear();
    pengeluaranController.clear();
  }

  late PengeluaranModel pengeluaran;

  @override
  void initState() {
    super.initState();
    if (widget.data['pengeluaran'] != null) {
      pengeluaran = widget.data['pengeluaran'];
      date = pengeluaran.tanggalPemasukan;
      keteranganController =
          TextEditingController(text: pengeluaran.keterangan);
      pengeluaranController =
          TextEditingController(text: pengeluaran.jumlahPengeluaran.toString());
    } else {
      keteranganController = TextEditingController(text: '');
      pengeluaranController = TextEditingController(text: '');
    }
  }

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
              "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
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
            if (widget.data['status'] == 'tambah') ...[
              Text(
                'Tambah Pengeluaran',
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
                'Edit Pengeluaran',
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
              child: Form(
                key: formKey,
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
                          (widget.data['pengeluaran'] == null)
                              ? date != ""
                                  ? date
                                  : 'Masukan Tanggal/Bulan/Tahun'
                              : pengeluaran.tanggalPemasukan,
                          style: GlobalFunctions.textTheme(context: context)
                              .headline3!
                              .copyWith(
                                color: date != ""
                                    ? Colors.black
                                    : const Color(0xff9E9E9E),
                                fontSize: date != "" ? 14 : 12,
                                fontWeight: date != ""
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      'Keterangan',
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(
                            color: kColorPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 11),
                      child: TextFormField(
                        controller: keteranganController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tolong isi keterangan';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.all(16),
                            fillColor: kColorPrimary,
                            hintText: (widget.data['pengeluaran'] == null)
                                ? 'Masukan Keterangan'
                                : pengeluaran.keterangan,
                            hintStyle:
                                GlobalFunctions.textTheme(context: context)
                                    .headline3!
                                    .copyWith(
                                      color: const Color(0xff9E9E9E),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: kColorPrimary,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffD6D6D6),
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.red.shade300,
                                width: 1,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      'Jumlah Pengeluaran',
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(
                            color: kColorPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 11),
                      child: TextFormField(
                        controller: pengeluaranController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tolong isi jumlah Pengeluaran';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.all(16),
                            fillColor: kColorPrimary,
                            hintText: (widget.data['pengeluaran'] == null)
                                ? 'Masukan Jumlah Pengeluaran'
                                : pengeluaran.jumlahPengeluaran.toString(),
                            hintStyle:
                                GlobalFunctions.textTheme(context: context)
                                    .headline3!
                                    .copyWith(
                                      color: const Color(0xff9E9E9E),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: kColorPrimary,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xffD6D6D6),
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.red.shade300,
                                width: 1,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Center(
                        child: SizedBox(
                      width: 154,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          if (GlobalFunctions.validate(
                              context: context, formkey: formKey)) {
                            if (widget.data['status'] == 'tambah') {
                              FirebaseServices.addPengeluaran(
                                  id: auth.currentUser!.uid,
                                  date: date,
                                  description: keteranganController.text,
                                  jumlahPengeluaran: int.parse(
                                    pengeluaranController.text,
                                  )).then((value) {
                                clearField();
                                GlobalFunctions.scaffoldMessage(
                                    context: context,
                                    message: 'Pengeluaran Succes Ditambahkan',
                                    color: Colors.green);
                              }).catchError((e) {
                                GlobalFunctions.scaffoldMessage(
                                    context: context,
                                    message: e,
                                    color: Colors.green);
                              });
                            } else {
                              // updatePengeluaran
                              FirebaseServices.updatePengeluaran(
                                  idPengeluaran: pengeluaran.id,
                                  date: date,
                                  description: keteranganController.text,
                                  jumlahPengeluaran: int.parse(
                                    pengeluaranController.text,
                                  )).then((value) {
                                clearField();
                                GlobalFunctions.scaffoldMessage(
                                  context: context,
                                  message: 'Pengeluaran Succes Di Update',
                                  color: kColorPrimary,
                                );
                                Navigator.pop(context);
                              }).catchError((e) {
                                GlobalFunctions.scaffoldMessage(
                                    context: context,
                                    message: e,
                                    color: Colors.red);
                              });
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(widget.data['status'] == 'tambah'
                            ? 'Tambahkan'
                            : 'Simpan'),
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
