import 'package:flutter/material.dart';
import 'package:travel_ease/models/ticket_card_models.dart';
import 'package:travel_ease/widgets/time_frame_widget.dart';

class TrainTicketCard extends StatefulWidget {
  final TicketCardModel ticketDetails;
  const TrainTicketCard({super.key, required this.ticketDetails});

  @override
  State<TrainTicketCard> createState() => _TrainTicketCardState();
}

class _TrainTicketCardState extends State<TrainTicketCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          children: [
            //title part
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: "${widget.ticketDetails.operator.toUpperCase()}\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: widget.ticketDetails.ticketId,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(235, 202, 238, 161),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.star,
                            color: const Color.fromARGB(251, 113, 204, 9),
                          ),
                        ),
                        TextSpan(
                          text: 4.8.toString(),
                          style: TextStyle(
                            color: Colors.green,

                            // textBaseline: TextBaseline.ideographic,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //time table part
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: RichText(
                    text: TextSpan(
                      text: "${widget.ticketDetails.arrivalTime.toString()}\n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: widget.ticketDetails.from,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Spacer(),
                TimeFrameWidget(
                  travelTime: widget.ticketDetails.duration,
                  destinationDistance: "240km",
                ),
                // SizedBox(width: 30),
                Spacer(),
                SizedBox(
                  width: 100,
                  child: RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                      text:
                          "${widget.ticketDetails.departureTime.toString()}\n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: widget.ticketDetails.to,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // tags part
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(73, 40, 212, 255),
                  ),
                  child: Text("Luxury", style: TextStyle(color: Colors.blue)),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(76, 58, 231, 42),
                  ),
                  child: Text(
                    "56 seats left",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),

            // booking price and button part
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: "Starting from\n",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.currency_lira_rounded,
                          color: Colors.blue,
                        ),
                      ),
                      TextSpan(
                        text: "300",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                ElevatedButton(onPressed: () {}, child: Text("Select Seats")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
