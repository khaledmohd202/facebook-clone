import 'package:facebook_clone/config/assets/app_icons.dart';
import 'package:facebook_clone/core/constants/constants.dart';
import 'package:facebook_clone/core/widgets/round_button.dart';
import 'package:facebook_clone/core/widgets/round_text_field.dart';
import 'package:facebook_clone/features/auth/presentation/screens/create_account_screen.dart';
import 'package:facebook_clone/features/auth/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.1,
          child: Padding(
            padding: Constants.defaultPadding,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(AppIcons.facebookIcon, width: 60.w),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      RoundTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      RoundTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        validator: validatePassword,
                        isPassword: true,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      RoundButton(
                        label: 'Login',
                        onPressed: () {},
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Text(
                        'Forget Password',
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    RoundButton(
                      label: 'Create new account',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          CreateAccountScreen.routeName,
                        );
                      },
                      color: Colors.transparent,
                    ),
                    Image.asset(
                      AppIcons.metaIcon,
                      height: 50.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
