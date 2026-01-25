class Place {
  final String name;
  final String description;
  final String image;
  final String location;

  Place({
    required this.name, 
    required this.description, 
    required this.image, 
    required this.location
  });
}


final List<Place> tourismPlaces = [
  Place(
    name: "Diriyah",
    description: "The historic pearl of the Kingdom, showcasing Saudi heritage.",
    image: "assets/images/Addiriyah.jpg",
    location: "Riyadh",
  ),
  Place(
    name: "Al-Ula",
    description: "An ancient oasis and world heritage site with stunning landscapes.",
    image: "assets/images/AL-Ula.webp",
    location: "Al-Ula City",
  ),
  Place(
    name: "Hail",
    description: "The heart of Arabian hospitality, nestled between the majestic Aja and Salma mountains.",
    image: "assets/images/Hail.jpg",
    location: "Hail Region",
  ),
];