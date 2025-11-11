import 'package:flutter/material.dart';
import 'package:travel/theme/branding_colors.dart';
import 'features/portfolio/screens/portfolio_home.dart';


class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = const ColorScheme.light(
      primary: TTColors.blue,
      onPrimary: TTColors.onBlue,
      secondary: TTColors.orange,
      onSecondary: TTColors.onOrange,
      surface: Colors.white,
      onSurface: TTColors.text,
      background: TTColors.bg,
      onBackground: TTColors.text,
    );

    return MaterialApp(
        title: 'TransTech — Employee Transport',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: scheme,
          scaffoldBackgroundColor: TTColors.bg,
          appBarTheme: const AppBarTheme(
            backgroundColor:Colors.white70,
            foregroundColor: TTColors.onBlue,
            elevation: 0,
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              backgroundColor: TTColors.blue,
              foregroundColor: TTColors.onBlue,
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: TTColors.orange, width: 1.2),
              foregroundColor: TTColors.orange,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: TTColors.blue),
          ),
          chipTheme: const ChipThemeData(
            backgroundColor: Color(0xFFFFF2E6), // soft orange bg
            labelStyle: TextStyle(color: TTColors.text),
          ),
        ),
        home: const PortfolioHome(),
        builder: (context, child) {
          final w = MediaQuery.sizeOf(context).width;
          final factor = w >= 1600 ? 1.12 : w >= 1200 ? 1.06 : w >= 600 ? 1.0 : w >= 420 ? 0.96 : 0.92;
          final ts = MediaQuery.textScalerOf(context).clamp(maxScaleFactor: factor);
          return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: ts), child: child!);
        },
      );

  }
}
