import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/screens/siteDetails/site_details_screen.dart';

import '../../../constants.dart';

class AllSights extends StatelessWidget {
  const AllSights({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '3 Sights',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(.8),
                  fontSize: 24,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SightItemBox(
                  sightName: 'LightHouse \nExecursion',
                  sightImage: 'assets/images/light_house.jpg',
                  sightRating: 4.5,
                  isbookmarked: true,
                ),
                SightItemBox(
                  sightName: 'LightHouse \nExecursion',
                  sightImage: 'assets/images/light_house_colored.jpg',
                  sightRating: 2.4,
                  isbookmarked: false,
                ),
                SightItemBox(
                  sightName: 'Hawai island',
                  sightImage: 'assets/images/nature.jpg',
                  sightRating: 5,
                  isbookmarked: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SightItemBox extends StatelessWidget {
  const SightItemBox({
    Key? key,
    required this.sightName,
    required this.sightImage,
    required this.sightRating,
    this.isbookmarked = false,
  }) : super(key: key);
  final String sightName, sightImage;
  final double sightRating;
  final bool isbookmarked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SiteDetailsScreen();
            },
          ),
        );
      },
      child: Container(
        width: 300,
        height: 240,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              sightImage,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.bookmark,
                      color: isbookmarked ? primaryColor : primaryGrey,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  RatingBar.builder(
                    allowHalfRating: true,
                    itemCount: 5,
                    glow: false,
                    itemSize: 28,
                    ignoreGestures: true,
                    initialRating: sightRating,
                    itemPadding: EdgeInsets.only(right: 5),
                    itemBuilder: (context, _) {
                      return Icon(
                        Icons.star,
                        color: Colors.amber[600],
                      );
                    },
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(width: 8),
                  Text(
                    '$sightRating',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  sightName,
                  style: TextStyle(
                    height: 1.1,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
