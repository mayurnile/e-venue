import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';

import '../core/core.dart';

List<String> categories = ["wedding", "birthday", "coorporate", "get-together"];

enum HomeState { loading, loaded, error }

class HomeController extends GetxController {
  final HttpServices httpServices;

  HomeController({
    required this.httpServices,
  });

  // controller variables
  int selectedPage = 0;
  int selectedCategory = 0;
  HomeState state = HomeState.loading;
  String errorMessage = "";

  // data variables
  double lat = -73.9928;
  double lng = 40.7193;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<Venue> venues = [];
  String name = "";
  String email = "";
  String phone = "";

  // Method for getting all venues
  Future<void> getAllVenues({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        state = HomeState.loading;
        update();
      }

      // Preparing call
      final Map<String, dynamic> variables = <String, dynamic>{
        "location": {
          "lat": lng,
          "lng": lat,
        },
        "category": categories[selectedCategory],
        "start_date_time": startDate.toIso8601String(),
        "end_date_time": endDate.toIso8601String(),
      };
      print(variables);
      // Firing Query
      final http.Response result = await httpServices.postCall(
        url: APIEndpoints.getAllVenues,
        variables: variables,
        // queryParams: "?=lat=$lat&lng=$lang",
      );
      final List<dynamic> responseData = json.decode(utf8.decode(result.bodyBytes)) as List<dynamic>;
      venues = [];
      for (var venueData in responseData) {
        final Venue venue = Venue.fromJSON(venueData);
        venues.add(venue);
      }

      state = HomeState.loaded;
      update();
    } catch (e) {
      log(e.toString());
      errorMessage = e.toString();
      state = HomeState.error;
      update();
    }
  }

  // Method for sending enquiry
  Future<void> sendUserEnquiry(String venueID) async {
    try {
      // Preparing call
      final Map<String, dynamic> variables = <String, dynamic>{
        "venue_id": venueID,
        "email": email,
        "phone": phone,
        "start_date_time": startDate.toIso8601String(),
        "end_date_time": endDate.toIso8601String(),
      };

      // Firing Query
      await httpServices.postCall(
        url: APIEndpoints.sendEnquiry,
        variables: variables,
      );

      return;
    } catch (e) {
      log(e.toString());
    }
    // final List<dynamic> responseData = json.decode(utf8.decode(result.bodyBytes)) as List<dynamic>;
  }

  // methods
  void updateSelectedPage(int index) {
    selectedPage = index;
    update();
  }

  void updateSelectedCategory(int index) {
    selectedCategory = index;
    update();
  }
}
