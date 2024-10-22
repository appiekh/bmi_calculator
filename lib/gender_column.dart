import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'input_page.dart';
import 'constants.dart';


class GenderColumn extends StatelessWidget {
  final IconData icon;
  final String genderName;
  final Color color;
  const GenderColumn({
    super.key,
    this.genderName = "MALE",
    this.icon = FontAwesomeIcons.mars,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            icon,
            color: Color(0xFF8D8E98),
            size: 80
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          genderName,
          style: kDefautltTextStyle,
        )
      ],
    );
  }
}