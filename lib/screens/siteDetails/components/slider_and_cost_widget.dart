import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/siteDetails/components/time_selector_column.dart';

import '../../../constants.dart';
import 'check_out_button.dart';
import 'day_selector_row.dart';

class SliderAndCostWidget extends StatefulWidget {
  const SliderAndCostWidget({
    Key? key,
  }) : super(key: key);

  @override
  _SliderAndCostWidgetState createState() => _SliderAndCostWidgetState();
}

class _SliderAndCostWidgetState extends State<SliderAndCostWidget> {
  Future<dynamic> bookingBottomModalSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * .8,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                      ),
                    ),
                    Text(
                      'Booking',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: DaySelectorRow(),
              ),
              SizedBox(height: 30),
              TimeSelectorColumn(),
              SizedBox(height: 20),
              CheckOutButton(),
            ],
          ),
        );
      },
    );
  }

  int sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: CupertinoSlider(
            value: sliderValue.toDouble(),
            min: 1,
            max: 20,
            onChanged: (value) {
              setState(() {
                sliderValue = value.toInt();
              });
            },
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            sliderValue > 1 ? '$sliderValue persons' : '$sliderValue person',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total : \$${sliderValue * 20}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            InkWell(
              onTap: () {
                bookingBottomModalSheet(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    'Book now',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

Future<dynamic> bookingDoneModalSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * .55,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                // ignore: deprecated_member_use
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            Text(
                              'Execurtion',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black.withOpacity(.7),
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Light House',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Text(
                                  'Time : ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  ' 24 Nov, 10:00 AM ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Person :  ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '3',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Duration: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '4',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Price :  ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '\$80',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Open Execursion',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 250,
                    child: Container(
                      height: 100,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/light_house.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.pop(context);
                },
                splashColor: primaryColor.withOpacity(.4),
                child: Container(
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}
