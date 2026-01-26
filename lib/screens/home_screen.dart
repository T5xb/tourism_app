import 'package:flutter/material.dart';
import 'package:tourism_app/constants/color.dart';
import 'package:tourism_app/constants/spacing.dart';
import 'package:tourism_app/extensions/nav.dart';
import 'package:tourism_app/extensions/screen_size.dart';
import 'package:tourism_app/models/place.dart';
import 'details_screen.dart';
import 'package:tourism_app/data/global_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Place> tourismPlaces = tourismData
        .map((item) => Place.fromJson(item))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Saudi Arabia"),
        backgroundColor: AppColors.appBar,
        centerTitle: true,
        
      ),
      body: ListView.builder(
        itemCount: tourismPlaces.length,
        itemBuilder: (context, index) {
          final place = tourismPlaces[index];
          return Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 6)],
            ),
            child: Column(
              children: [
                Image.asset(
                  place.image!,
                  width: context.width * 0.9,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                AppSpacing.s10,
                Text(
                  place.name!,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  place.description!,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                AppSpacing.s10,
                ElevatedButton(
                  child: Text("Explore"),
                  onPressed: () => context.push(DetailsScreen(place: place)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
