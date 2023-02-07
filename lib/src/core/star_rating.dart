import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating, iconSize;
  // final RatingChangeCallback? onRatingChanged;
  final Color? color;

  const StarRating({
    super.key,
    this.starCount = 5,
    this.rating = .0,
    // this.onRatingChanged,
    this.color,
    required this.iconSize,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Colors.white,
        size: iconSize,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: const Color.fromARGB(255, 252, 210, 64),
        size: iconSize,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: const Color.fromARGB(255, 252, 210, 64),
        size: iconSize,
      );
    }
    return InkResponse(
      // onTap:
      // onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
            starCount,
            (index) => buildStar(context, index),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          rating.toString(),
          style: TextStyle(
            color: color ?? Colors.white,
          ),
        ),
      ],
    );
  }
}
