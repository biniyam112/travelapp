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
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(-1, 0),
            spreadRadius: 1,
            blurRadius: 10,
            color: Colors.black.withOpacity(.2),
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
                Icons.home,
                CupertinoIcons.search,
                CupertinoIcons.bookmark_fill,
                Icons.settings,
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
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? primaryColor : Colors.transparent,
      ),
      child: IconButton(
        onPressed: onPress,
        icon: Icon(
          icon,
          color: isSelected ? Colors.white : primaryGrey,
          size: 30,
        ),
      ),
    );
  }
}
