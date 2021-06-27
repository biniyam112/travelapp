import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class TimeSelectorColumn extends StatefulWidget {
  const TimeSelectorColumn({
    Key? key,
  }) : super(key: key);

  @override
  _TimeSelectorColumnState createState() => _TimeSelectorColumnState();
}

class _TimeSelectorColumnState extends State<TimeSelectorColumn> {
  int selectedTimeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          3,
          (index) {
            List<String> timeFromList = ['10:00', '14:00', '18:00'];
            List<String> timeToList = ['14:00', '16:00', '20:00'];
            return TimeSelectorCard(
              timeFrom: timeFromList[index],
              timeTo: timeToList[index],
              isSelected: selectedTimeIndex == index,
              onPress: () {
                setState(() {
                  selectedTimeIndex = index;
                });
              },
              timeDetails: 'Last spot remaining',
            );
          },
        ),
      ],
    );
  }
}

class TimeSelectorCard extends StatelessWidget {
  const TimeSelectorCard({
    Key? key,
    required this.timeFrom,
    this.isSelected = false,
    required this.onPress,
    required this.timeTo,
    required this.timeDetails,
  }) : super(key: key);
  final String timeFrom, timeTo, timeDetails;
  final bool isSelected;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 10,
                spreadRadius: 1,
                color: Colors.black.withOpacity(.2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      children: [
                        TextSpan(text: timeFrom),
                        TextSpan(text: ' - '),
                        TextSpan(text: timeTo),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    timeDetails,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: isSelected
                      ? null
                      : Border.all(
                          width: 2,
                          color: primaryGrey.withOpacity(.7),
                        ),
                ),
                child: isSelected
                    ? Center(
                        child: Icon(
                          Icons.verified,
                          size: 28,
                          color: primaryColor,
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
