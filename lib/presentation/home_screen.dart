import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_ease/presentation/train_ticket_screen.dart';
import 'package:travel_ease/utils/theme.dart';
import 'package:travel_ease/widgets/frosted_rectangle.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> tickets = [
    {
      "vehicleType": "bus",
      "asset": "assets/pngs/bus.jpg",
      "note": "Buy Bus Tickets",
      "height": 200.0,
    },
    {
      "vehicleType": "train",
      "asset": "assets/pngs/train.jpg",
      "note": "Buy Train Tickets",
      "height": 200.0,
    },
    {
      "vehicleType": "ship",
      "asset": "assets/pngs/ship.jpg",
      "note": "Buy Ship Tickets",
      "height": 200.0,
    },
    {
      "vehicleType": "plane",
      "asset": "assets/pngs/plane.jpg",
      "note": "Buy Air Tickets",
      "height": 200.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ThemeManager.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/map.svg",
                      colorFilter: ColorFilter.mode(
                        const Color.fromARGB(255, 150, 149, 149),
                        BlendMode.srcIn,
                      ),
                    ),
                    AppBarWidget(),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Seamless travel planning, just for you.",
                  softWrap: true,
                  style: TextStyle(
                    height: 1.1,
                    color: ThemeManager.errorColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 246, 215),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      final ticket = tickets[index];
                      return TicketCards(
                        vehicleType: ticket["vehicleType"],
                        height: ticket["height"],
                        asset: ticket["asset"],
                        note: ticket["note"],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketCards extends StatelessWidget {
  final String asset;
  final double height;
  final String note;
  final String vehicleType;
  const TicketCards({
    super.key,
    required this.vehicleType,
    required this.height,
    required this.asset,
    required this.note,
  });

  VoidCallback? _guestureSelector(BuildContext context) {
    switch (vehicleType) {
      case "bus":
        return () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TrainTicketScreen();
              },
            ),
          );
        };
      case "train":
        return () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TrainTicketScreen();
              },
            ),
          );
        };
      case "plane":
        return () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TrainTicketScreen();
              },
            ),
          );
        };
      case "ship":
        return () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TrainTicketScreen();
              },
            ),
          );
        };
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: _guestureSelector(context),
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFCCD1C4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Positioned.fill(child: Image.asset(asset, fit: BoxFit.cover)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FrostedRectangle(
                    height: 60,
                    width: double.infinity,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        note,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: const Color(0xFFFFF7DB),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          GestureDetector(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE9E7D5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SvgPicture.asset("assets/svgs/user.svg"),
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 10),
          Text(
            "Hello, USER",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Expanded(child: SizedBox()),
          GestureDetector(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFE9E7D5).withAlpha(120),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.settings),
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
