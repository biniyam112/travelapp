import 'package:flutter/material.dart';
import 'package:travel_app/screens/siteDetails/components/slider_and_cost_widget.dart';

import '../../../constants.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        bookingDoneModalSheet(context);
      },
      borderRadius: BorderRadius.circular(40),
      splashColor: primaryGrey.withOpacity(.5),
      child: Container(
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: primaryColor,
        ),
        child: Center(
          child: Text(
            'Check out',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
