import 'package:flutter/material.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/styles.dart';
import 'package:pajakin/utils/currency_format.dart';

class PajakPage extends StatefulWidget {
  const PajakPage({Key? key}) : super(key: key);

  @override
  _PajakPageState createState() => _PajakPageState();
}

class _PajakPageState extends State<PajakPage> {
  int omzetPerhari = 0;
  int omzetPerbulan = 0;
  double pajakUMKM = 0;
  TextEditingController controllerOmzet = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            '${assetIcons}icon-back(1).png',
            scale: 1.6,
            height: 25,
            width: 25,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 16.0,
              top: 16.0,
              bottom: 20.0,
            ),
            child: Text(
              'Ayo Hitung Pajakmu!',
              style: GlobalFunctions.textTheme(context: context)
                  .headline6!
                  .copyWith(color: Colors.white, fontSize: 25),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(25, 0, 0, 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Omzet Sehari',
                        style: GlobalFunctions.textTheme(context: context)
                            .headline3!
                            .copyWith(color: Colors.white, fontSize: 20),
                      ),
                      Container(
                        width: 320,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                        ),
                        child: TextFormField(
                          controller: controllerOmzet,
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Masukan Omzet Anda Dalam Sehari',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFFFFFF),
                                width: 0,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: GlobalFunctions.textTheme(context: context)
                              .subtitle1!
                              .copyWith(color: Colors.black, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.04, 0.56),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: kColorPrimary,
                    side: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                        style: BorderStyle.solid),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        6,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      omzetPerhari = int.parse(controllerOmzet.text);
                      omzetPerbulan = omzetPerhari * 30;
                      pajakUMKM = omzetPerbulan * 0.5 / 100;
                    });
                  },
                  child: Text(
                    'Hitung Pajak',
                    style: GlobalFunctions.textTheme(context: context)
                        .button!
                        .copyWith(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, bottom: 20.0, top: 25.0),
                child: Text(
                  'Cek Hasilnya Disini!',
                  style: GlobalFunctions.textTheme(context: context)
                      .headline6!
                      .copyWith(color: Colors.white, fontSize: 25),
                )),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25, 0, 0, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Omzet Sebulan',
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(color: Colors.white, fontSize: 20),
                    ),
                    Container(
                        width: 320,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: const Color(0xFF005478),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            CurrencyFormat.convertToIdr(omzetPerbulan, 0),
                            textAlign: TextAlign.center,
                            style: GlobalFunctions.textTheme(context: context)
                                .headline3!
                                .copyWith(color: Colors.black, fontSize: 18),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pajak UMKM',
                      style: GlobalFunctions.textTheme(context: context)
                          .headline3!
                          .copyWith(color: Colors.white, fontSize: 20),
                    ),
                    Container(
                      width: 320,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: kColorPrimary,
                        ),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            CurrencyFormat.convertToIdr(pajakUMKM, 0),
                            textAlign: TextAlign.center,
                            style: GlobalFunctions.textTheme(context: context)
                                .headline3!
                                .copyWith(color: Colors.black, fontSize: 18),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
