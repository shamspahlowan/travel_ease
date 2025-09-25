import 'package:flutter/material.dart';

class TrainTicketCard extends StatelessWidget {
  final String oparetorName;
  final String fare;
  const TrainTicketCard({
    super.key,
    required this.oparetorName,
    required this.fare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Text(oparetorName, style: TextStyle(color: Colors.black)),
                Expanded(child: SizedBox()),
                Text("BDT $fare", style: TextStyle(color: Colors.black)),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
