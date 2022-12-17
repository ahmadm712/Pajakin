import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:pajakin/data/models/pemasukan_model.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/styles.dart';

class PemasukanPage extends StatefulWidget {
  Map<String, dynamic> data;
  PemasukanPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<PemasukanPage> createState() => _PemasukanPageState();
}

class _PemasukanPageState extends State<PemasukanPage> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  late TextEditingController keteranganController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late MoneyMaskedTextController controllerPemasukan;

  @override
  void dispose() {
    super.dispose();
    keteranganController.dispose();
    controllerPemasukan.dispose();
  }

  late PemasukanModel pemasukan;

  @override
  void initState() {
    super.initState();
    if (widget.data['pemasukan'] != null) {
      pemasukan = widget.data['pemasukan'];
      setState(() {
        date = pemasukan.tanggalPemasukan;
        keteranganController =
            TextEditingController(text: pemasukan.keterangan);

        controllerPemasukan = MoneyMaskedTextController(
          leftSymbol: 'Rp ',
          decimalSeparator: '.',
          thousandSeparator: ',',
          initialValue: pemasukan.jumlahPemasukan.toDouble(),
        );
      });
    } else {
      keteranganController = TextEditingController(text: '');

      controllerPemasukan = MoneyMaskedTextController(
          leftSymbol: 'Rp ',
          decimalSeparator: '.',
          thousandSeparator: ',',
          initialValue: 0);
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
                          (widget.data['pemasukan'] == null)
                              ? date != ""
                                  ? date
                                  : 'Masukan Tanggal/Bulan/Tahun'
                              : pemasukan.tanggalPemasukan,
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
                            hintText: (widget.data['pemasukan'] == null)
                                ? 'Masukan Keterangan'
                                : pemasukan.keterangan,
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
                      'Jumlah Pemasukan',
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
                        controller: controllerPemasukan,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Tolong isi jumlah pemasukan';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.all(16),
                            fillColor: kColorPrimary,
                            hintText: (widget.data['pemasukan'] == null)
                                ? 'Masukan Jumlah Pemasukan'
                                : pemasukan.jumlahPemasukan.toString(),
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
                                FirebaseServices.addPemasukan(
                                        id: auth.currentUser!.uid,
                                        date: date,
                                        description: keteranganController.text,
                                        jumlahPemasukan: controllerPemasukan
                                            .numberValue
                                            .toInt())
                                    .then((value) {
                                  GlobalFunctions.scaffoldMessage(
                                      context: context,
                                      message: 'Pemasukan Succes Ditambahkan',
                                      color: Colors.green);
                                  Navigator.pop(context);
                                }).catchError((e) {
                                  GlobalFunctions.scaffoldMessage(
                                      context: context,
                                      message: e,
                                      color: Colors.red);
                                });
                              } else {
                                FirebaseServices.updatePemasukan(
                                        idPemasukan: pemasukan.id,
                                        date: date,
                                        description: keteranganController.text,
                                        jumlahPemasukan: controllerPemasukan
                                            .numberValue
                                            .toInt())
                                    .then((value) {
                                  GlobalFunctions.scaffoldMessage(
                                    context: context,
                                    message: 'pemasukan Succes Di Update',
                                    color: kColorPrimary,
                                  );
                                  Navigator.pop(context);
                                }).catchError(
                                  (e) {
                                    GlobalFunctions.scaffoldMessage(
                                        context: context,
                                        message: e,
                                        color: Colors.red);
                                  },
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(widget.data['status'] == 'tambah'
                              ? 'Tambahkan'
                              : 'Simpan'),
                        ),
                      ),
                    )
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
