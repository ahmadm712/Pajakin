import 'package:flutter/material.dart';
import 'package:pajakin/utils/styles.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  Widget _buildShortAppBar(BuildContext context) {
    return Card(
      color: kColorPrimary,
      margin: const EdgeInsets.all(0),
      shape: const ContinuousRectangleBorder(
        side: BorderSide.none,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Berita Terbaru Seputar Bisnis',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SafeArea(
        child: Stack(
          children: [
            body,
            _buildShortAppBar(context),
          ],
        ),
      ),
    );
  }
}
