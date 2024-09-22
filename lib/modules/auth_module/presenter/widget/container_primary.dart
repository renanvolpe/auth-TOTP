import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';

class ContainerPrimary extends StatelessWidget {
  const ContainerPrimary({super.key, required this.child, this.isDisable});

  final Widget child;
  final bool? isDisable;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: isDisable == true ? AppColor.kDisableColor : AppColor.kPrimary,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [child],
        ));
  }
}
