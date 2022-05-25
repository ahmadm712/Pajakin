import 'package:flutter/material.dart';
import 'package:pajakin/utils/global_function.dart';

class ButtonMenu extends StatelessWidget {
  String imgAssets;
  String title;
  String routeName;
  ButtonMenu({
    Key? key,
    required this.imgAssets,
    required this.title,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        height: 112,
        width: 125,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imgAssets,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: GlobalFunctions.textTheme(context: context)
                  .headline3!
                  .copyWith(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
