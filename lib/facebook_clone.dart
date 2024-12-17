import 'package:facebook_clone/config/routes/routes.dart';
import 'package:facebook_clone/core/screens/home_screen.dart';
import 'package:facebook_clone/core/screens/loader.dart';
import 'package:facebook_clone/features/auth/presentation/screens/login_screen.dart';
import 'package:facebook_clone/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FacebookClone extends StatelessWidget {
  const FacebookClone({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            }
            if (snapshot.hasData) {
              final user = snapshot.data;
              if (user!.emailVerified) {
                return const HomeScreen();
              } else {
                return const VerifyEmailScreen();
              }
            }
            return const LoginScreen();
          },
        ),
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}
