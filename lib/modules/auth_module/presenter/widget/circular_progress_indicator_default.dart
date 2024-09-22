import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';

class CircularProgressIndicatorDefault extends StatelessWidget {
  const CircularProgressIndicatorDefault({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: AppColor.kWhite,
              strokeWidth: 2,
            )));
  }
}
