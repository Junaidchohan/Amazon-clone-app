// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:amazon_clone_app/constants/global_variables.dart';

class Stars extends StatelessWidget {
  final double rating;
  const Stars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemCount: 5,
      rating: BorderSide.strokeAlignInside,
      itemSize: 15,
      itemBuilder:
          (context, _) =>
              Icon(Icons.star, color: GlobalVariables.secondaryColor),
    );
  }
}
