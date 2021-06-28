import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/models/sights.dart';
import 'package:travel_app/screens/siteDetails/site_details_screen.dart';

import '../../../constants.dart';

class AllSights extends StatelessWidget {
  const AllSights({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '3 Sights',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.8),
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...List.generate(
                  Sight.allSights.length,
                  (index) => SightItemBox(
                    sight: Sight.allSights[index],
                  ),
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
    required this.sight,
  }) : super(key: key);
  final Sight sight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SiteDetailsScreen(
                sight: sight,
              );
            },
          ),
        );
      },
      child: Container(
        width: 300,
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              sight.sightImage,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
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
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.bookmark,
                      color: sight.isBookmarked ? primaryColor : primaryGrey,
                      size: 18,
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
                    initialRating: sight.rating,
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
                    '${sight.rating}',
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
                  sight.sightName,
                  style: TextStyle(
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
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
