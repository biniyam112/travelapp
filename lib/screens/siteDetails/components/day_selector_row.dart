import 'package:flutter/material.dart';

import '../../../constants.dart';

class DaySelectorRow extends StatefulWidget {
  const DaySelectorRow({
    Key? key,
  }) : super(key: key);

  @override
  _DaySelectorRowState createState() => _DaySelectorRowState();
}

class _DaySelectorRowState extends State<DaySelectorRow> {
  int selectedDay = 5;
  @override
  Widget build(BuildContext context) {
    List<String> dayStringList = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
    List<int> dayNumberList = [4, 5, 6, 7, 8, 9, 10];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...List.generate(
          7,
          (index) => DayItem(
            dayNumber: dayNumberList[index],
            dayString: dayStringList[index],
            isSelected: selectedDay == index,
            onPress: () {
              setState(() {
                selectedDay = index;
              });
            },
          ),
        )
      ],
    );
  }
}

class DayItem extends StatelessWidget {
  const DayItem({
    Key? key,
    required this.dayString,
    required this.isSelected,
    required this.dayNumber,
    required this.onPress,
  }) : super(key: key);
  final String dayString;
  final bool isSelected;
  final int dayNumber;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? primaryColor : Colors.transparent,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              Text(
                dayString,
                style: TextStyle(
                  fontSize: 20,
                  color: isSelected ? Colors.white : Colors.black26,
                ),
              ),
              Text(
                '$dayNumber'.padLeft(2, '0'),
                style: TextStyle(
                  fontSize: 20,
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
