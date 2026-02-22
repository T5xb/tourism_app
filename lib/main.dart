import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/screens/home_screen.dart';
import 'package:tourism_app/screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://lxdqzvjcjjhpkzwptgjv.supabase.co",
    anonKey: "sb_publishable_hKqIpKx1AdL8AaKvEvWC4A_JcRtwrj8",
  );

  runApp(const TourismApp());
}

class TourismApp extends StatelessWidget {
  const TourismApp({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Supabase.instance.client.auth.currentSession;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saudi Tourism',

      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,

        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.appBar,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.accent,
          surface: Colors.white,
        ),
      ),

      home: session != null ? const HomeScreen() : const LoginScreen(),
    );
  }
}
