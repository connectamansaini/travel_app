import 'package:flutter/material.dart';
import 'package:travel_app/src/model/packages_model.dart';

import '../../core/constants.dart';
import '../../core/star_rating.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.packages});
  final Packages packages;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(packages.image),
          colorFilter: const ColorFilter.mode(
              // Colors.black.withOpacity(0.8)
              Colors.black38,
              BlendMode.darken),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    packages.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.location_on_outlined,
                    size: 14,
                    color: Colors.white,
                  ),
                  Text(
                    packages.location,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Constants.sizedBoxDefaultHeight,
              Text(
                packages.description,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Constants.sizedBoxDefaultHeight,
              StarRating(
                rating: packages.rating,
                iconSize: 18,
                color: Colors.white,
              ),
              Constants.sizedBoxDefaultHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹${packages.price}/person',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: const Color.fromARGB(255, 252, 210, 64),
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: const Text('Book Now'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
