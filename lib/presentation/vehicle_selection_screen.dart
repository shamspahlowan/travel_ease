import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_ease/widgets/vehicle_selection_card.dart';

class VehicleSelectionScreen extends StatelessWidget {
  const VehicleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [const Color(0xFFDBFFE2), const Color(0xFFFFFFFF)],
                  center: Alignment.topCenter,
                  radius: 1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: "How would you like to\n".toUpperCase(),
                      style: GoogleFonts.notoSerif(
                        height: 1.5,
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        wordSpacing: 3,
                      ),
                      children: [
                        TextSpan(
                          text: "Travel?".toUpperCase(),
                          style: GoogleFonts.robotoFlex(
                            height: 1.5,
                            letterSpacing: 20,
                            fontSize: 56,
                            color: const Color(0xDC050316),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Text("How would you like to \ntravel?"),
                SizedBox(height: 80),
                Card(
                  elevation: 2,
                  color: Colors.white,
                  child: GridView.builder(
                    padding: EdgeInsets.all(12),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 4,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return VehicleSelectionCard();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
