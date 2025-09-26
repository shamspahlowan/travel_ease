import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:travel_ease/presentation/signup_screen.dart';
// import 'package:travel_ease/utils/theme.dart';
import 'package:travel_ease/widgets/branding_widget.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: [
            //bg
            ..._background(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // _branding(),
                    BrandingWidget(),
                    SizedBox(height: 25),
                    Text(
                      "Smooth Journeys, Thrilling Adventures",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 130),
                    SizedBox(
                      // width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                    return SignupScreen();
                                  },
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        child: Text(
                          "Get Started --->",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _background() {
    return [
      Positioned.fill(
        // bottom: 70
        child: Container(
          height: 200,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/pngs/travelImage.png"),
            ),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.clamp,
            colors: [
              const Color.fromARGB(54, 63, 247, 216),
              const Color.fromARGB(0, 255, 255, 255),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    ];
  }
}
