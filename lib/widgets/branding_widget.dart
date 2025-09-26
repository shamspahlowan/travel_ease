import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BrandingWidget extends StatelessWidget {
  const BrandingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          "assets/svgs/roundtrip.svg",
          width: 200,
          height: 100,
          fit: BoxFit.contain,
          alignment: Alignment.center,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        Positioned(
          top: 70,
          child: Text(
            "Travel Ease",
            style: TextStyle(
              fontFamily: "Righteous",
              fontSize: 46,
              fontWeight: FontWeight.w100,
              letterSpacing: 2,
              wordSpacing: 3,
            ),
          ),
        ),
      ],
    );
  }
}
