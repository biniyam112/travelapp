import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int activeBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            spreadRadius: 1,
            blurRadius: 6,
            color: Colors.black.withOpacity(.1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...List.generate(
            4,
            (index) {
              List<IconData> bottomNavigationIcons = [
                CupertinoIcons.home,
                CupertinoIcons.search,
                CupertinoIcons.bookmark,
                CupertinoIcons.settings,
              ];
              return BottomNavigationItem(
                icon: bottomNavigationIcons[index],
                onPress: () {
                  setState(() {
                    activeBarIndex = index;
                  });
                },
                isSelected: activeBarIndex == index,
              );
            },
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    Key? key,
    required this.icon,
    this.isSelected = false,
    required this.onPress,
  }) : super(key: key);
  final IconData icon;
  final bool isSelected;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? primaryColor : Colors.transparent,
      ),
      child: IconButton(
        onPressed: onPress,
        icon: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black,
          size: 24,
        ),
      ),
    );
  }
}
