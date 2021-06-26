import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/constants.dart';

import 'components/page_selection_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      color: Colors.black.withOpacity(.8),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.soundcloud,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PageSelectionTab(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    '10 Sights',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
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
    return Container(
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
    );
  }
}
