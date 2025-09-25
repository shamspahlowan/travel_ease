import 'package:flutter/material.dart';

class TimeFrameWidget extends StatelessWidget {
  final String? travelTime;
  final String? destinationDistance;
  const TimeFrameWidget({super.key, this.travelTime, this.destinationDistance});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 10,
      child: CustomPaint(
        painter: TimeFramePainter(
          travelTime: travelTime,
          destinationDistance: destinationDistance,
        ),
      ),
    );
  }
}

class TimeFramePainter extends CustomPainter {
  final String? travelTime;
  final String? destinationDistance;
  const TimeFramePainter({this.travelTime, this.destinationDistance});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3;

    // Draw horizontal line (75% width)
    final lineEnd = Offset(size.width * 0.75, 0);
    canvas.drawLine(Offset.zero, lineEnd, paint);

    // Text above the line
    _drawText(
      canvas,
      travelTime.toString(),
      Offset(size.width * 0.35, -24), // adjust vertical offset
      fontSize: 16,
      color: Colors.grey,
    );

    // Text below the line
    _drawText(
      canvas,
      destinationDistance.toString(),
      Offset(size.width * 0.35, 6), // adjust vertical offset
      fontSize: 16,
      color: Colors.grey,
    );
  }

  void _drawText(
    Canvas canvas,
    String text,
    Offset position, {
    double fontSize = 14,
    Color color = Colors.black,
  }) {
    final textSpan = TextSpan(
      text: text,
      style: TextStyle(color: color, fontSize: fontSize),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(); // important!
    // Center the text horizontally at the given position
    final offset = Offset(position.dx - textPainter.width / 2, position.dy);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
