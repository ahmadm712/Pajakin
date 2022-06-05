import 'package:flutter/material.dart';
import 'package:pajakin/utils/constans.dart';
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
            Container(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.PEMASUKAN_PAGE,
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
                        Routes.PEMASUKAN_PAGE,
                        arguments: 'tambah',
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
              Text('Rp.55.000.000',
                  style: GlobalFunctions.textTheme(context: context)
                      .headline3!
                      .copyWith(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w400))
            ],
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
              Text('Rp.55.000.000',
                  style: GlobalFunctions.textTheme(context: context)
                      .headline3!
                      .copyWith(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w400))
            ],
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
              Text('Rp.55.000.000',
                  style: GlobalFunctions.textTheme(context: context)
                      .headline3!
                      .copyWith(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w400))
            ],
          ),
        ),
      ],
    );
  }
}
