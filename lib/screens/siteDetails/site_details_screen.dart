import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/constants.dart';

import 'components/day_selector_row.dart';
import 'components/slider_and_cost_widget.dart';
import 'components/time_selector_column.dart';
import 'components/top_bar.dart';

class SiteDetailsScreen extends StatelessWidget {
  const SiteDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .6,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/light_house_colored.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      TopBarWidget(),
                      Spacer(),
                      Row(
                        children: [
                          RatingBar.builder(
                            allowHalfRating: true,
                            itemCount: 5,
                            glow: false,
                            itemSize: 28,
                            ignoreGestures: true,
                            initialRating: 4.5,
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
                            '4.5',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '(334)',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Lighthouse \n execurtion',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * .46,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: backgroundColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Text(
                            'Netherland Light house',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(.7),
                            ),
                          ),
                          SizedBox(height: 22),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Available:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(width: 10),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(text: '10:00'),
                                    TextSpan(text: ' -- '),
                                    TextSpan(text: '18:00'),
                                    TextSpan(text: '  .  '),
                                    TextSpan(text: 'Mon'),
                                    TextSpan(text: ' -- '),
                                    TextSpan(text: 'Sat'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Duration:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                '4 hours',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 40),
                              Text(
                                'Price:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                '\$20',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          SliderAndCostWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 330,
                right: 40,
                child: Container(
                  height: 66,
                  width: 66,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(4, 4),
                        color: Colors.black.withOpacity(.2),
                        blurRadius: 16,
                        spreadRadius: 2,
                      ),
                    ],
                    color: backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.bookmark,
                    size: 32,
                    color: Color(0xff4776F6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
