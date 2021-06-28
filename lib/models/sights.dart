class Sight {
  final String sightName, sightImage;
  final double rating;
  final bool isBookmarked;

  Sight({
    required this.sightName,
    required this.sightImage,
    required this.rating,
    required this.isBookmarked,
  });

  static List<Sight> allSights = [
    Sight(
      sightName: 'LightHouse \nExecursion',
      sightImage: 'assets/images/light_house.jpg',
      rating: 4.5,
      isBookmarked: true,
    ),
    Sight(
      sightName: 'LightHouse \nExecursion',
      sightImage: 'assets/images/light_house_colored.jpg',
      rating: 2.4,
      isBookmarked: false,
    ),
    Sight(
      sightName: 'Hawai island',
      sightImage: 'assets/images/nature.jpg',
      rating: 5,
      isBookmarked: true,
    ),
  ];
}
