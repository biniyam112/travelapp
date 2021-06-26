import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            'Explore',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PageSelectionTab(),
            SizedBox(height: 30),
            Text(
              '10 Sights',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
          (index) => TabItem(
            onPress: () {
              setState(() {
                activeIndex = index;
              });
            },
            title: 'Sight',
            isActive: activeIndex == index,
          ),
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
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.blue[400] : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6),
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              color: isActive ? Colors.blue[400] : Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
