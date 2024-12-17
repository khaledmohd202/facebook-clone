import 'dart:io';

import 'package:facebook_clone/core/constants/app_colors.dart';
import 'package:facebook_clone/core/constants/constants.dart';
import 'package:facebook_clone/core/utils/utils.dart';
import 'package:facebook_clone/core/widgets/pick_image_widget.dart';
import 'package:facebook_clone/core/widgets/round_button.dart';
import 'package:facebook_clone/core/widgets/round_text_field.dart';
import 'package:facebook_clone/features/auth/presentation/widgets/birthday_picker.dart';
import 'package:facebook_clone/features/auth/presentation/widgets/gender_picker.dart';
import 'package:facebook_clone/features/auth/utils/utils.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  static const routeName = '/create-account';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  File? image;
  DateTime? birthday;
  String gender = 'male';
  bool isLoading = false;
  // controllers
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Future<void> createAccount() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     setState(() => isLoading = true);
  //     await ref.context.read<SubjectBloc>()
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.realWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        foregroundColor: AppColors.darkWhiteColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Constants.defaultPadding,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    image = await pickImage();
                    setState(() {});
                  },
                  child: PickImageWidget(image: image),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: RoundTextField(
                        controller: _firstNameController,
                        hintText: 'First Name',
                        textInputAction: TextInputAction.next,
                        validator: validateName,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Expanded(
                      child: RoundTextField(
                        controller: _lastNameController,
                        hintText: 'Last Name',
                        textInputAction: TextInputAction.next,
                        validator: validateName,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                BirthdayPicker(
                  dateTime: birthday ?? DateTime.now(),
                  onPressed: () async {
                    birthday = await pickSimpleDate(
                      context: context,
                      date: birthday,
                    );
                    setState(() {});
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                GenderPicker(
                  gender: gender,
                  onChanged: (value) {
                    gender = value ?? 'male';
                    setState(() {});
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                RoundTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                RoundTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  validator: validatePassword,
                  isPassword: true,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                RoundButton(
                  label: 'Next',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
