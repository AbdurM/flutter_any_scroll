import 'dart:math';

import 'package:example/picsum_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageCell extends StatelessWidget {
  const ImageCell({super.key, required this.picsumImage});

  final PicSumImage picsumImage;

  int _getRandomNumber(int min, int max) {
    final random = Random();

    return min + random.nextInt(max - min);
  }

  @override
  Widget build(BuildContext context) {
    final randomNumber = _getRandomNumber(150, 500).toDouble();
    return LimitedBox(
      maxWidth: randomNumber,
      child: Card(
        color: Colors.transparent,
        child: Stack(
          children: [
            // ignore: sized_box_shrink_expand
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  picsumImage.downloadUrl!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  picsumImage.author!,
                  style: GoogleFonts.caveatBrush(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
