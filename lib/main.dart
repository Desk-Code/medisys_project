import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medisys/Presentation/Presentation_Patient/Patient_DashBoard/patient_dashboard_page.dart';
import 'package:medisys/Presentation/splash_screen/splash_screen.dart';
import 'package:medisys/Util/constraint.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: ConstraintData.bgAppBarColor),
        useMaterial3: true,
      ),
      home: const SplashScreenPage(),
      // home: const HospitalDashBoard(),
      // home: const PatientDashPage(),
    );
  }
}
