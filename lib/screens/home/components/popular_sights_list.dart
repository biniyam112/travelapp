import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PopularSightsList extends StatelessWidget {
  const PopularSightsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Popular',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.8),
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              PopularSiteCard(
                imagePath: 'assets/images/ocean_wave.jpg',
                sightName: 'European Tour',
              ),
              PopularSiteCard(
                imagePath: 'assets/images/light_house.jpg',
                sightName: 'Atlantic shore',
              ),
              PopularSiteCard(
                imagePath: 'assets/images/shore.jpg',
                sightName: 'Rio, Brazil',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PopularSiteCard extends StatelessWidget {
  const PopularSiteCard({
    Key? key,
    required this.imagePath,
    required this.sightName,
  }) : super(key: key);
  final String imagePath, sightName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              color: Colors.black.withOpacity(.18),
              spreadRadius: 1,
              blurRadius: 20,
            )
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(
                  imagePath,
                  height: 70,
                  width: 120,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    sightName,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.8),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                      '${DateFormat('dd-MMMM').format(DateTime(2021, 24, 06))} - ${DateFormat('dd-MMMM-yyyy ').format(DateTime.now())}')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
