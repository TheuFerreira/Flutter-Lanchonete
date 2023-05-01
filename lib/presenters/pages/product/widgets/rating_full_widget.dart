import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/shimmer_widget.dart';

class RatingFullWidget extends StatelessWidget {
  final bool isLoading;
  final double rating;
  final String totalRatings;
  const RatingFullWidget({
    super.key,
    required this.isLoading,
    required this.rating,
    required this.totalRatings,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      isLoading: isLoading,
      height: 20,
      width: 175,
      child: Row(
        children: [
          RatingBar.builder(
            initialRating: rating,
            minRating: 1,
            itemSize: 20,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            unratedColor: Colors.grey[300],
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Color.fromARGB(255, 235, 143, 5),
            ),
            onRatingUpdate: (rating) {},
          ),
          const SizedBox(width: 8),
          Text(
            rating.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(width: 8),
          Text(
            '($totalRatings)',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
