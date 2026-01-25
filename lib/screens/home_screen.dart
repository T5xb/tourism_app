import 'package:flutter/material.dart';
import 'package:tourism_app/place/place.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Saudi Arabia"),
        backgroundColor: const Color.fromARGB(255, 57, 126, 59),
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
                  place.image,
                  width: screenWidth * 0.9,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10), 
                Text(place.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text(place.description, style: TextStyle(color: Colors.grey[600])),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text("Explore"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsScreen(place: place)),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}