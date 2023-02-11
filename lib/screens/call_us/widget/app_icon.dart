import 'package:flutter/material.dart';

import '../../../helper/app_assets.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      alignment: Alignment.center,
      child: Image.asset(
        AppAssets.appIcon,
        width: 150,
        height: 150,
      ),
    );
  }
}
