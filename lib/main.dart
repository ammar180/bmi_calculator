import 'package:bmi_calculator/login_page.dart';
import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BmiProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BMI Calculator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          textTheme: Theme.of(context).textTheme.copyWith(
                displayLarge: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.apply(color: Colors.white),
                displayMedium: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.apply(color: Colors.white),
                headlineSmall: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.apply(color: Colors.white),
              ),
          useMaterial3: true,
        ),
        home: const LoginPage(title: "Login Page"),
      ),
    );
  }
}
