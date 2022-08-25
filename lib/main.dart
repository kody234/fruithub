import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/authentication_screens/login_screen.dart';
import 'package:fruit_hub/screens/home_screen.dart';
import 'package:fruit_hub/screens/onboarding/onboarding.dart';

import 'package:fruit_hub/services/firebase_authentication_services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('onboarding');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialize = Firebase.initializeApp();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
          theme: _buildTheme(Brightness.light),
          home: FutureBuilder(
              future: _initialize,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('error'));
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Hive.box('onboarding').isEmpty
                      ? OnBoardingScreen()
                      : const Root();
                }

                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: Color(0xffFFA451),
                    ),
                  ),
                );
              })),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.gorditasTextTheme(baseTheme.textTheme),
    );
  }
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: AuthenticationServices(auth: _auth).user,
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data?.uid == null) {
              return LoginScreen(
                auth: _auth,
              );
            }
            if (snapshot.data?.emailVerified == false) {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('verify your mail to continue'),
                      ElevatedButton(
                          onPressed: () async {
                            setState(() {});
                            debugPrint(snapshot.data?.emailVerified.toString());
                            await snapshot.data?.reload();
                          },
                          child: const Text('click to verify'))
                    ],
                  ),
                ),
              );
            } else if (snapshot.data?.emailVerified == true) {
              return const HomeScreen();
            }
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

String? errorChecker({required String error}) {
  if (error == 'user-not-found') {
    return '';
  }
  return null;
}
