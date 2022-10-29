import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/screens/login/login_view_model.dart';
import '../../constants/constants.dart';
import '../../utility/button.dart';
import '../../utility/form.dart';
import '../../utility/text_style.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrayColor,
      body: SingleChildScrollView(child: getLoginForm(context)),
    );
  }

  Widget getLoginForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPaddin),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(defaultPaddin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPaddin),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: defaultPaddin * 3,
              ),
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: primaryColor.withOpacity(0.7),
                ),
                child: const Icon(
                  Icons.lock_open_rounded,
                  color: whiteColor,
                  size: 28,
                ),
              ),
              Text(
                'Sign up your account',
                style: AppTextStyle.headline1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Please Enter your phone number',
                style: AppTextStyle.headline2,
              ),
              Text(
                'for sign in your account',
                style: AppTextStyle.headline2,
              ),
              const SizedBox(
                height: defaultPaddin * 3,
              ),
              Form(
                key: loginViewModel.formKey,
                child: Column(
                  children: [
                    Obx(
                      (() => loginViewModel.otpPassword.value
                          ? const SizedBox()
                          : AppForm.input(
                              hintText: 'Phone Number',
                              inputType: TextInputType.number,
                              controller: loginViewModel.phoneNumber,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Phone Number';
                                }
                                return null;
                              },
                            )),
                    ),
                    Obx((() => loginViewModel.otpPassword.value
                        ? AppForm.input(
                            hintText: 'OTP Code',
                            controller: loginViewModel.otpCode,
                            inputType: TextInputType.number,
                          )
                        : const SizedBox())),
                  ],
                ),
              ),
              const SizedBox(
                height: defaultPaddin * 2,
              ),
              Obx((() => loginViewModel.otpPassword.value ? const SizedBox() : AppButton.button1('Next', onTap: () => loginViewModel.buttonClick(), rightIcon: Icons.navigate_next)),),
              Obx(
                (() => loginViewModel.otpPassword.value
                    ? AppButton.button1('Submit', onTap: () => loginViewModel.buttonClick(), rightIcon: Icons.verified,)
                    : const SizedBox()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
