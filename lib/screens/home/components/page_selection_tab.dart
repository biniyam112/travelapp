import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';

class PageSelectionTab extends StatefulWidget {
  const PageSelectionTab({
    Key? key,
  }) : super(key: key);

  @override
  _PageSelectionTabState createState() => _PageSelectionTabState();
}

class _PageSelectionTabState extends State<PageSelectionTab> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          3,
          (index) {
            List<String> menuItems = [
              'Sight',
              'Tours',
              'Adventures',
            ];
            return TabItem(
              onPress: () {
                setState(() {
                  activeIndex = index;
                });
              },
              title: menuItems[index],
              isActive: activeIndex == index,
            );
          },
        ),
      ],
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    Key? key,
    required this.title,
    required this.onPress,
    this.isActive = false,
  }) : super(key: key);
  final String title;
  final GestureTapCallback onPress;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isActive ? primaryColor : Colors.black.withOpacity(.7),
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 6),
              isActive
                  ? Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        color: isActive ? Colors.blue[400] : Colors.black,
                        shape: BoxShape.circle,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
