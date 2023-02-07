import 'package:flutter/material.dart';

import '../../../core/size_config.dart';
import '../../../core/star_rating.dart';
import '../../../model/packages_model.dart';

class TourCard extends StatelessWidget {
  final Packages packages;

  const TourCard({super.key, required this.packages});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        Container(
          margin: const EdgeInsets.only(right: 12),
          width: SizeConfig.safeBlockVertical! * 22,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter:
                  const ColorFilter.mode(Colors.black38, BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage(
                packages.image,
              ),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 14, height: 1.6),
                    children: [
                      TextSpan(
                        text: "${packages.title}\n",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      const WidgetSpan(
                        child: Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: " ${packages.location}",
                      ),
                      WidgetSpan(
                        child: StarRating(
                          rating: packages.rating, iconSize: 18,
                          // onRatingChanged: (rating) =>
                          //     setState(() => this.rating = rating),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
