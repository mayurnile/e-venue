import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:places_service/places_service.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../core/core.dart';

class LocationSearchBar extends StatefulWidget {
  const LocationSearchBar({super.key});

  @override
  State<LocationSearchBar> createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends State<LocationSearchBar> {
  late TextEditingController controller;
  final PlacesService _placesService = PlacesService();

  @override
  void initState() {
    super.initState();
    _placesService.initialize(
      apiKey: '',
    );
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: kIsWeb ? const EdgeInsets.symmetric(horizontal: 240.0, vertical: 22.0) : const EdgeInsets.all(22.0),
      child: Row(
        children: [
          // text field
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryLightColor.withOpacity(0.1),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                    hintText: "Search place",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(height: 18.0, width: 18.0, child: Image.asset(ImageAssets.location, fit: BoxFit.scaleDown)),
                    ),
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
                suggestionsCallback: (pattern) async {
                  if (pattern.length >= 3) {
                    return await getPlacesList(pattern);
                  }
                  return [];
                },
                hideOnEmpty: true,
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
                itemBuilder: (context, suggestion) {
                  final PlacesAutoCompleteResult suggestionResult = suggestion;
                  return ListTile(
                    title: Text(
                      suggestionResult.mainText ?? "",
                      style: textTheme.headline3,
                    ),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  final PlacesAutoCompleteResult suggestionResult = suggestion;
                  searchPlaceByPattern(suggestionResult.placeId!);
                },
              ),
            ),
            // TextInputField(
            //   controller: controller,
            //   inputType: TextInputType.streetAddress,
            //   inputFormatters: const [],
            //   hint: "Search your place",
            //   suffix: Padding(
            //     padding: const EdgeInsets.all(12.0),
            //     child: SizedBox(
            //       height: 18.0,
            //       width: 18.0,
            //       child: Image.asset(
            //         ImageAssets.location,
            //         fit: BoxFit.scaleDown,
            //       ),
            //     ),
            //   ),
            // ),
          ),
          // spacing
          const SizedBox(width: 22.0),
          // filters
          Image.asset(
            ImageAssets.microphone,
            height: 22.0,
            width: 22.0,
          ),
        ],
      ),
    );
  }

  // Member Functions
  Future<List<dynamic>> getPlacesList(String pattern) async {
    final autoCompleteSuggestions = await _placesService.getAutoComplete(pattern);

    return autoCompleteSuggestions;
  }

  Future<void> searchPlaceByPattern(String placeId) async {
    final PlacesDetails placeDetails = await _placesService.getPlaceDetails(placeId);
    locator.get<HomeController>()
      ..lat = placeDetails.lat!
      ..lng = placeDetails.lng!
      ..getAllVenues(isRefresh: true);
    // locator.get<HomeController>().getAllVenues(
    //       placeDetails.lat!,
    //       placeDetails.lng!,
    //       isRefresh: true,
    //     );
  }
}
