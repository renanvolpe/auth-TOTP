import 'package:flutter/material.dart';
import 'package:flutter_dev_test/modules/auth_module/presenter/widget/container_primary.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';

class RecoverySecretPage extends StatelessWidget {
  const RecoverySecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Modular.to.pop(), child: const Icon(Icons.chevron_left, color: AppColor.kPrimary)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Verificação", style: Style.darkStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w600)),
            const Gap(10),
            Text("Insira o código que foi enviado:", style: Style.greyStyle.copyWith(fontSize: 16)),
            const Gap(85),
            PinCodeTextField(
              appContext: context,
              length: 6,
              animationType: AnimationType.fade,
              blinkWhenObscuring: true,
              validator: (v) {
                if (v!.length < 6) {
                  return "Insert the 6 values";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                activeColor: AppColor.kPrimary,
                selectedColor: AppColor.kPrimary,
                inactiveColor: AppColor.kBorderLight,
                inactiveFillColor: AppColor.kBackgroundLight,
                inactiveBorderWidth: 2,
                selectedFillColor: AppColor.kWhite,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: AppColor.kWhite,
              ),
              cursorColor: AppColor.kBlack,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
              boxShadows: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              onCompleted: (v) {
                debugPrint("Completed");
              },
              onChanged: (value) {
                debugPrint(value);
                // setState(() {
                //   currentText = value;
                // });
              },
              beforeTextPaste: (text) {
                debugPrint("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            ),
            const Gap(20),
            AbsorbPointer(
              absorbing: true,
              child: GestureDetector(
                onTap: () {},
                child: ContainerPrimary(
                  child: Text(
                    "Continuar",
                    textAlign: TextAlign.center,
                    style: Style.whiteStyle,
                  ),
                ),
              ),
            ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.messenger_outline,
                  color: AppColor.kPrimary,
                ),
                const Gap(10),
                Text(
                  "Não Recebi o código",
                  style: Style.defaultStyle.copyWith(fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
