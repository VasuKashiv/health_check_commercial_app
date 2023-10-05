import 'package:flutter/material.dart';
import 'package:health_check/firebase_options.dart';
import 'package:health_check/src/provider/appointment_provider.dart';
import 'package:health_check/src/provider/product_provider.dart';
import 'package:health_check/src/screens/lab_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ListenableProvider<BookAppointmentsProvider>(
            create: (context) => BookAppointmentsProvider())
      ],
      child: const MaterialApp(
        home: LabTestScreen(),
      ),
    );
  }
}
