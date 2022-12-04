import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:venue_booking/presentation/widgets/widgets.dart';

import '../../../core/core.dart';

class VenueDetails extends StatelessWidget {
  final Venue venue;

  const VenueDetails({required this.venue, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: AppTheme.primaryColor),
        title: Text(
          venue.name,
          style: textTheme.headline2!.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // image carousel
            _buildImageCarousel(size),
            // venue details
            _buildVenueDetails(size, textTheme),
          ],
        ),
      ),
    );
  }

  // Builder Functions
  Widget _buildImageCarousel(Size size) => CarouselImages(
        scaleFactor: 1.0,
        listImages: venue.images,
        height: size.height * 0.41,
        viewportFraction: 1.0,
        borderRadius: 0.0,
        cachedNetworkImage: true,
        verticalAlignment: Alignment.topCenter,
      );

  Widget _buildVenueDetails(Size size, TextTheme textTheme) => Transform.translate(
        offset: const Offset(0.0, -22.0),
        child: Container(
          padding: const EdgeInsets.all(22.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0),
              topRight: Radius.circular(22.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title and save option
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    venue.name,
                    style: textTheme.headline6,
                  ),
                  SvgPicture.asset(
                    ImageAssets.nSaved,
                    height: 32.0,
                    width: 32.0,
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              // location
              Row(
                children: [
                  Image.asset(
                    ImageAssets.location,
                    fit: BoxFit.scaleDown,
                    height: 18.0,
                    width: 18.0,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    "${venue.city}, ${venue.state}",
                    style: textTheme.headline3,
                  )
                ],
              ),
              const SizedBox(height: 8.0),
              // rating
              Row(
                children: const [
                  // icon
                  Icon(
                    Icons.star,
                    color: Color(0xFFfbb50e),
                  ),
                  SizedBox(width: 8.0),
                  Text("4.7 (120)"),
                ],
              ),
              const SizedBox(height: 12.0),
              Text(
                "Description",
                style: textTheme.headline2,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean bibendum leo at eros facilisis bibendum. Praesent eleifend odio at gravida pulvinar. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean cursus quam vitae neque aliquam iaculis. Donec vulputate in nibh at volutpat. Proin magna enim, fermentum vel molestie nec, volutpat a metus. Sed vehicula vitae nibh ut tincidunt.",
                style: textTheme.bodyText2,
              ),
              const SizedBox(height: 22.0),
              // book button
              _buildBookButton(size, textTheme),
              const SizedBox(height: 22.0),
            ],
          ),
        ),
      );

  Widget _buildBookButton(Size size, TextTheme textTheme) => SizedBox(
        width: size.width,
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(EnquiryForm(venue: venue));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
          ),
          child: Text(
            "Book Now",
            style: textTheme.headline4!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
}
