import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleSelectionCard extends StatefulWidget {
  const VehicleSelectionCard({super.key});

  @override
  State<VehicleSelectionCard> createState() => _VehicleSelectionCardState();
}

class _VehicleSelectionCardState extends State<VehicleSelectionCard> {
  double cardElevation = 1;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          cardElevation = 8;
        });
      },
      onExit: (event) {
        setState(() {
          cardElevation = 1;
        });
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            cardElevation = 8;
          });
          Future.delayed(Duration(milliseconds: 250), () {
            if (mounted && cardElevation > 1) {
              setState(() {
                cardElevation = 1;
              });
            }
          });
        },

        child: Card(
          elevation: cardElevation,
          color: const Color(0xFFDBFFE2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
            side: BorderSide(color: Color(0xFF0BA766), width: 1),
          ),
          //0xFF0BA766
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [const Color(0xFFDBFFE2), const Color(0x84FFFFFF)],
                center: Alignment.center,
                radius: 0.65,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      width: 50,
                      height: 60,
                      "assets/airplane_related/planealt.svg",
                      colorFilter: ColorFilter.mode(
                        const Color(0xFF0BA766),
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      "Airplane",
                      style: GoogleFonts.notoSerif(
                        color: const Color(0xFF050316),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
