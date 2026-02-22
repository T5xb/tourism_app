class Place {
  String? name;
  String? description;
  String? image;
  String? location;

  Place({this.name, this.description, this.image, this.location});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'] ?? 'No name',
      description: json['description'] ?? 'No description',
      image: json['image_url'],
      location: json['location'] ?? 'No location',
    );
  }
}
