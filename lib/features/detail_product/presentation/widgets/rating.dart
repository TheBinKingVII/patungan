import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';  

class Rating extends StatelessWidget {
  final double ratingValue;
  final double? size;
  final double? fontSize;

  const Rating({super.key, required this.ratingValue, this.size, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RatingBarIndicator(
          rating: ratingValue, 
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: size ?? 24.0, 
          direction: Axis.horizontal,
          unratedColor: Colors.grey.shade300, 
        ),
        
        SizedBox(width: 8), 
        
        Text(
          "$ratingValue",
          style: TextStyle(
            fontSize: fontSize ?? 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}