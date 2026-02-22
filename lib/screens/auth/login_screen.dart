import 'package:flutter/material.dart';
import 'package:tourism_app/services/supabase_service.dart';
import 'package:tourism_app/extensions/nav.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/constants/spacing.dart';
import 'package:tourism_app/widget/custom_button.dart';
import 'package:tourism_app/screens/home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool loading = false;

  void handleLogin() async {
    if (emailController.text.isEmpty || passController.text.isEmpty) {
      showSnackBar("Please enter your email and password", isError: true);
      return;
    }

    setState(() => loading = true);
    try {
      await SupabaseService().signIn(
        emailController.text.trim(),
        passController.text.trim(),
      );

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(e.toString(), isError: true);
      }
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.redAccent : AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSpacing.s10,

              const Icon(
                Icons.explore_outlined,
                size: 100,
                color: AppColors.primary,
              ),
              AppSpacing.s20,
              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const Text(
                "Login to continue your Saudi journey",
                style: TextStyle(color: AppColors.textSecondary),
              ),
              AppSpacing.s10,

              buildTextField(
                controller: emailController,
                label: "Email",
                icon: Icons.email_outlined,
              ),
              AppSpacing.s10,

              buildTextField(
                controller: passController,
                label: "Password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              AppSpacing.s10,

              CustomButton(
                label: "Login",
                isLoading: loading,
                onPressed: handleLogin,
              ),

              AppSpacing.s10,
              TextButton(
                onPressed: () => context.push(const SignUpScreen()),
                child: const Text(
                  "Don't have an account? Create one",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.textSecondary),
        prefixIcon: Icon(icon, color: AppColors.primary),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }
}
