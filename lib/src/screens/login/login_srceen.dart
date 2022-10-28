import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../utility/bottom_nav_bar_widget.dart';
import '../../utility/button.dart';
import '../../utility/form.dart';
import '../../utility/text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrayColor,
      body: getLoginForm(context),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: primaryColor.withOpacity(0.7),
                ),
                child: const Icon(Icons.lock_open_rounded, color: whiteColor,size: 28,),
              ),
              Text(
                'Sign up your account',
                style: AppTextStyle.headline1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Please Enter your phone number',style: AppTextStyle.headline2,),
              Text('for sign in your account',style: AppTextStyle.headline2,),
              const SizedBox(
                height: defaultPaddin * 3,
              ),
              AppForm.input(
                hintText: 'Phone Number',
                inputType: TextInputType.number,
              ),
              const SizedBox(
                height: defaultPaddin * 2,
              ),
              AppButton.button1('Next',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigationBarExample(index: 0)),
                          (Route<dynamic> route) => false,
                    );
                  }, leftIcon: Icons.navigate_next),
            ],
          ),
        ),
      ),
    );
  }
}
