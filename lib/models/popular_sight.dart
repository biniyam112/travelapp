class PopularSight {
  final String imagePath, sightName;

  PopularSight({
    required this.imagePath,
    required this.sightName,
  });

  static List<PopularSight> popularSights = [
    PopularSight(
      imagePath: 'assets/images/ocean_wave.jpg',
      sightName: 'European Tour',
    ),
    PopularSight(
      imagePath: 'assets/images/light_house.jpg',
      sightName: 'Atlantic shore',
    ),
    PopularSight(
      imagePath: 'assets/images/shore.jpg',
      sightName: 'Rio, Brazil',
    ),
  ];
}
