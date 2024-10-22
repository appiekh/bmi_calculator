import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark().copyWith(

            scaffoldBackgroundColor : const Color(0xFF0D101F),
            textTheme: TextTheme(
                bodyMedium: TextStyle(
                    color: Colors.white
                )

      ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
        ).copyWith(
          primary: const Color(0xFF0D101F),
          secondary: Colors.purple,
        ),
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          backgroundColor: const Color(0xFF0D101F), // Use the primary color for AppBar
        ),
      ),
      home: InputPage(),
    );
  }
}

