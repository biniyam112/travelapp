import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/models/popular_sight.dart';

class PopularSightsList extends StatelessWidget {
  const PopularSightsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Popular',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(.8),
                fontSize: 20,
              ),
            ),
          ),
          Column(
            children: [
              ...List.generate(
                  PopularSight.popularSights.length,
                  (index) => PopularSiteCard(
                        sight: PopularSight.popularSights[index],
                      )),
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
    required this.sight,
  }) : super(key: key);
  final PopularSight sight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              color: Colors.black.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 10,
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
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  sight.imagePath,
                  height: 70,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    sight.sightName,
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
