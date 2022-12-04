import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:venue_booking/core/core.dart';

class VenueCard extends StatelessWidget {
  final Venue venue;

  const VenueCard({
    required this.venue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => locator.get<NavigationService>().pushNamed(
        AppRoutes.venueDetails,
        arguments: {
          "venue": venue,
        },
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 18.0, left: 4.0, right: 4.0),
        height: size.height * 0.42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryLightColor.withOpacity(0.2),
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // venue image
            SizedBox(
              height: size.height * 0.3,
              width: size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(imageUrl: venue.images[0], fit: BoxFit.cover),
              ),
            ),
            // spacing
            const SizedBox(height: 16.0),
            // hotel details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // left part
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title
                      Text(
                        venue.name,
                        style: textTheme.headline3!.copyWith(fontWeight: FontWeight.w600),
                      ),
                      // spacing
                      const SizedBox(height: 6.0),
                      // location
                      Text("${venue.city}, ${venue.state}", style: textTheme.headline3),
                    ],
                  ),
                  // right part
                  Text(
                    "₹ ${venue.rent}",
                    style: textTheme.headline3!.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
