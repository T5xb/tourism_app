import 'package:flutter/material.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/constants/spacing.dart';
import 'package:tourism_app/models/place.dart';

class DetailsScreen extends StatelessWidget {
  final Place place;

  const DetailsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          place.name ?? 'Details',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.appBar,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: place.name ?? '',
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                child: Image.network(
                  place.image ?? '',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 300,
                    color: Colors.grey,
                    child: Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      height: 300,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Discover ${place.name ?? ''}",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  AppSpacing.s10,

                  Text(
                    place.description ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  AppSpacing.s20,

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.accent,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Location:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: Text(
                      place.location ?? 'Not specified',
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),

                  AppSpacing.s10,

                  const Text(
                    "What are your thoughts?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  AppSpacing.s10,
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Share your experience about this place...",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Icon(Icons.send, color: AppColors.primary),
                      ),
                    ),
                  ),
                  AppSpacing.s20,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
