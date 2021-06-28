import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/all_sights.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_bottom_navigation_bar.dart';
import 'components/page_selection_tab.dart';
import 'components/popular_sights_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavigationBar(),
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
            CustomAppBar(),
            PageSelectionTab(),
            AllSights(),
            PopularSightsList()
          ],
        ),
      ),
    );
  }
}
