import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:venue_booking/core/core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import "./widgets/widgets.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      bottomNavigationBar: const MyBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // location search bar
              const LocationSearchBar(),
              // date time picker
              const MyDateTimePicker(),
              // section heading
              _buildSectionTitle("Categories", textTheme),
              // categpries
              _buildCategories(size, textTheme),
              // section heading
              _buildSectionTitle("Popular Venues", textTheme),
              // event places
              GetBuilder<HomeController>(
                initState: (_) {
                  locator.get<HomeController>().getAllVenues();
                },
                builder: (HomeController controller) {
                  switch (controller.state) {
                    case HomeState.loading:
                      return Center(
                        child: Transform.translate(
                          offset: const Offset(0.0, 72.0),
                          child: const CircularProgressIndicator(
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      );
                    case HomeState.loaded:
                      return _buildEventPlaces(controller.venues);
                    case HomeState.error:
                      return Center(
                        child: Transform.translate(
                          offset: const Offset(0.0, 72.0),
                          child: const Text("Something went wrong..."),
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Builder Functions
  Widget _buildSectionTitle(String title, TextTheme textTheme) => Padding(
        padding: kIsWeb ? const EdgeInsets.symmetric() : const EdgeInsets.symmetric(vertical: 12.0, horizontal: 22.0),
        child: Text(title, style: textTheme.headline3),
      );

  Widget _buildCategories(Size size, TextTheme textTheme) {
    return GetBuilder<HomeController>(builder: (HomeController controller) {
      return SizedBox(
        height: size.height * 0.2,
        child: ListView(
          padding: const EdgeInsets.only(left: 28.0),
          scrollDirection: Axis.horizontal,
          children: [
            // wedding
            CategoryCard(
              title: "Wedding",
              icon: ImageAssets.cWedding,
              myIndex: 0,
              isSelected: controller.selectedCategory == 0,
            ),
            // birthday
            CategoryCard(
              title: "Birthday",
              icon: ImageAssets.cBirthday,
              myIndex: 1,
              isSelected: controller.selectedCategory == 1,
            ),
            // corporate
            CategoryCard(
              title: "Corporate",
              icon: ImageAssets.cCorporate,
              myIndex: 2,
              isSelected: controller.selectedCategory == 2,
            ),
            // get together
            CategoryCard(
              title: "Get-together",
              icon: ImageAssets.cGetTogether,
              myIndex: 3,
              isSelected: controller.selectedCategory == 3,
            ),
          ],
        ),
      );
    });
  }

  Widget _buildEventPlaces(List<Venue> venues) {
    return venues.isNotEmpty
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            shrinkWrap: true,
            itemCount: venues.length,
            itemBuilder: (_, int index) {
              return VenueCard(venue: venues[index]);
            },
          )
        : Center(
            child: Transform.translate(
              offset: const Offset(0.0, 72.0),
              child: const Text("No venues found!"),
            ),
          );
  }
}
