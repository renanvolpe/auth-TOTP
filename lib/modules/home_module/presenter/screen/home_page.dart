import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Modular.to.pop(), child: const Icon(Icons.chevron_left, color: AppColor.kPrimary)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page", textAlign: TextAlign.center, style: Style.greyStyle),
            const Gap(20),
            Text("I hope you enjoyed the app :)", textAlign: TextAlign.center, style: Style.greyStyle),
          ],
        ),
      ),
    );
  }
}
