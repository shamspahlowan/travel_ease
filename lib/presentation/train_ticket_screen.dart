import 'package:flutter/material.dart';
import 'package:travel_ease/models/ticket_card_models.dart';
import 'package:travel_ease/widgets/train_ticket_card.dart';

class TrainTicketScreen extends StatelessWidget {
  const TrainTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                // height: 300,
                width: double.infinity,
                color: const Color.fromARGB(255, 255, 243, 163),
                child: ListView.builder(
                  itemCount: ticketList.length,
                  itemBuilder: (context, index) {
                    return TrainTicketCard(
                      oparetorName: ticketList[index].operator,
                      fare: ticketList[index].fare.toString(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
