import 'package:flutter/material.dart';
import 'package:pajakin/data/models/kas_model.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/presentation/widgets/widgets.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/styles.dart';

class BukuKasPage extends StatefulWidget {
  const BukuKasPage({Key? key}) : super(key: key);

  @override
  State<BukuKasPage> createState() => _BukuKasPageState();
}

class _BukuKasPageState extends State<BukuKasPage> {
  @override
  Widget build(BuildContext context) {
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
            Text(
              'Buku Kas',
              style: GlobalFunctions.textTheme(context: context)
                  .headline3!
                  .copyWith(
                      color: kColorPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 22,
            ),
            // Total
            TotalPemasukanPengeluaranCard(),
            const Divider(
              thickness: 1,
              color: Color(
                0xffE0E0E0,
              ),
            ),
            const PengeluaranCard(),
            const Divider(
              thickness: 1,
              color: Color(
                0xffE0E0E0,
              ),
            ),
            const PemasukanCard()
          ],
        ),
      ),
    );
  }
}
