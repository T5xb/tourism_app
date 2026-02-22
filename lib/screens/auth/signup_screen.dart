import 'package:flutter/material.dart';
import 'package:tourism_app/widget/custom_button.dart';
import 'package:tourism_app/services/supabase_service.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/constants/spacing.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  bool loading = false;

  void handleSignUp() async {
  
    if (passController.text != confirmPassController.text) {
      showSnackBar("Passwords do not match!", isError: true);
      return;
    }

    
    if (emailController.text.isEmpty || passController.text.isEmpty) {
      showSnackBar("Please fill in all fields", isError: true);
      return;
    }

    setState(() => loading = true);
    try {
      await SupabaseService().signUp(
        emailController.text.trim(),
        passController.text.trim(),
      );

      if (mounted) {
        showSnackBar("Account created! Please check your email for verification.");
        Navigator.pop(context);
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
      appBar: AppBar(
        title: const Text("Create Account", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: AppColors.appBar,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(
              Icons.person_add_outlined,
              size: 80,
              color: AppColors.primary,
            ),
            AppSpacing.s20,
            const Text(
              "Welcome to Saudi Arabia!",
              style: TextStyle(
                fontSize: 28, 
                fontWeight: FontWeight.bold, 
                color: AppColors.textPrimary,
              ),
            ),
            const Text(
              "Register to explore the wonders of Saudi Arabia",
              style: TextStyle(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
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

            buildTextField(
              controller: confirmPassController,
              label: "Confirm Password",
              icon: Icons.lock_clock_outlined,
              isPassword: true,
            ),
            AppSpacing.s10,

            CustomButton(
              label: "Sign Up",
              isLoading: loading,
              onPressed: handleSignUp,
            ),

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Already have an account? Login here",
                style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
              ),
            ),
          ],
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