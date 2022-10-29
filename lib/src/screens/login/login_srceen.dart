import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loy_eat_merchant_app/src/screens/login/login_veiw_model.dart';
import '../../constants/constants.dart';
import '../../utility/bottom_nav_bar_widget.dart';
import '../../utility/button.dart';
import '../../utility/form.dart';
import '../../utility/text_style.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final loginVeiwModel = Get.put(LoginVeiwModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrayColor,
      body: getLoginForm(context),
    );
  }

  Widget getLoginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultPaddin),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(defaultPaddin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultPaddin),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
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
                  key: loginVeiwModel.formKey,
                  child: Column(
                    children: [
                      Obx(
                        (() => loginVeiwModel.otpPassword.value
                            ? const SizedBox()
                            : AppForm.input(
                                hintText: 'Phone Number',
                                inputType: TextInputType.number,
                                controller: loginVeiwModel.phoneNumber,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Phone Number';
                                  }
                                  return null;
                                },
                              )),
                      ),
                      Obx((() => loginVeiwModel.otpPassword.value
                          ? AppForm.input(
                              hintText: 'OTP Code',
                              inputType: TextInputType.number,
                            )
                          : const SizedBox())),
                    ],
                  ),
                ),
                const SizedBox(
                  height: defaultPaddin * 2,
                ),
                Obx(
                  (() => loginVeiwModel.otpPassword.value
                      ? const SizedBox()
                      : AppButton.button1('Next', onTap: () {
                          loginVeiwModel.butonClick();
                        }, leftIcon: Icons.navigate_next)),
                ),
                Obx(
                  (() => loginVeiwModel.otpPassword.value
                      ? AppButton.button1('Submit', onTap: () {
                          loginVeiwModel.butonClick();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BottomNavigationBarExample(index: 0),
                            ),
                          );
                        }, leftIcon: Icons.verified)
                      : const SizedBox()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
