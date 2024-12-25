import 'package:flutter/material.dart';

class MyOffers extends StatelessWidget {
  const MyOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 180,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 1, // Spread of the shadow
              blurRadius: 5, // Blurring of the shadow
              offset: Offset(2, 2), // Position of the shadow (x, y)
            ),
          ],
        ),
        child: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO4FOqC4XDD0xDD9_M0X793kTlLi8qRnR-5A&s",
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Text(
              'Failed to load image',
              style: TextStyle(color: Colors.red),
            );
          },
        ),
      ),
    );
  }
}
