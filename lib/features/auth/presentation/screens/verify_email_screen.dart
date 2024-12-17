import 'package:facebook_clone/core/constants/constants.dart';
import 'package:facebook_clone/core/widgets/round_button.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Constants.defaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
              label: 'Verify Email',
              onPressed: () {},
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            RoundButton(
              label: 'Refresh',
              onPressed: () {},
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            RoundButton(
              label: 'Change Email',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
