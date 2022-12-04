class Venue {
  final String id;
  final String name;
  final List<String> images;
  final String city;
  final String district;
  final String state;
  final double rent;

  Venue({
    required this.id,
    required this.name,
    required this.images,
    required this.city,
    required this.district,
    required this.state,
    required this.rent,
  });

  factory Venue.fromJSON(Map<String, dynamic> json) {
    return Venue(
      id: json["_id"] as String,
      name: json["name"] as String? ?? "",
      images: mapImages(json["images"] as List<dynamic>? ?? []),
      city: json["city"] as String? ?? "",
      district: json["district"] as String? ?? "",
      state: json["state"] as String? ?? "",
      rent: double.tryParse("${json["rent"]}") ?? 0.0,
    );
  }

  static List<String> mapImages(List<dynamic> imagesData) {
    final List<String> images = [];
    for (var imageData in imagesData) {
      images.add(imageData as String);
    }

    return images;
  }
}
