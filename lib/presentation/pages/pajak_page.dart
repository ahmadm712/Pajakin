import 'package:flutter/material.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';

class PajakPage extends StatefulWidget {
  const PajakPage({Key? key}) : super(key: key);

  @override
  _PajakPageState createState() => _PajakPageState();
}

class _PajakPageState extends State<PajakPage> {
  /*late int omzetPerhari;
  late int omzetPerbulan = omzetPerhari * 30;
  late double pajakUMKM = omzetPerbulan * 0.5 / 100;*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(0),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          await Navigator.pushNamed(context, Routes.HOME_PAGE);
                        },
                        child: Container(
                          child: Icon(
                          Icons.arrow_left,
                          color: Colors.white,
                          size: 30,
                        )
                        )
                      ),
                      Text(
                        'Ayo Hitung Pajakmu!',
                        style: GlobalFunctions.textTheme(context: context)
                            .headline3!
                            .copyWith(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
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
                          onChanged: (txt) {
                            setState(() {
                            });
                          },
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Masukan Omzet Anda Dalam Sehari',
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFFFFFF),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: GlobalFunctions.textTheme(context: context)
                              .subtitle1!
                              .copyWith(color: kColorPrimary, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.04, 0.56),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kColorPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                    ),
                  ),
                  onPressed: () {
                    print('Button Pressed...');
                  },
                  child: Text(
                    'Hitung Pajak',
                    style: GlobalFunctions.textTheme(context: context)
                        .button!
                        .copyWith(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0)),
                  Text(
                    'Cek Hasilnya Disini!',
                style: GlobalFunctions.textTheme(context: context)
                    .headline3!
                    .copyWith(color: Colors.white, fontSize: 25),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Omzet Sebulan',
                        style: GlobalFunctions.textTheme(context: context)
                            .headline3!
                            .copyWith(color: Colors.white, fontSize: 18),
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
                        child: Text(''),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0.23),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
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
                              .copyWith(color: Colors.white, fontSize: 18),
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
                          child: Text(''),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ]
        ),
      ),
      )
    );
  }
}
