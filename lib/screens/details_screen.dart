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
      appBar: AppBar(
        title: Text(place.name!),
        backgroundColor: AppColors.appBar,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              place.image!,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Discover ${place.name!}",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  AppSpacing.s10,
                  Text(
                    place.description!,
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  AppSpacing.s20,

                  Text(
                    "Comments:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  AppSpacing.s20,
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Write your thoughts about this place...",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.send),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Not used but for future
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: "Share"),
        ],
      ),
    );
  }
}
