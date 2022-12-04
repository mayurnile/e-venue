class APIEndpoints {
  static const String baseUrl = "https://3389-223-226-208-204.in.ngrok.io/v1";

  // endpoints
  static const String getAllVenues = "$baseUrl/venues";
  static const String sendEnquiry = "$baseUrl/venues/book";
}

class ImageAssets {
  // base urls
  static const String baseUrl = "assets/icons";
  static const String navBarUrl = "$baseUrl/navbar";
  static const String categoriesBaseUrl = "$baseUrl/categories";

  // misc icons
  static const String filters = "$baseUrl/filters.png";
  static const String location = "$baseUrl/location.png";
  static const String microphone = "$baseUrl/microphone.png";
  static const String notification = "$baseUrl/notification.png";
  static const String search = "$baseUrl/search.png";
  static const String calender = "$baseUrl/calender.png";

  // navbar icons
  static const String nHome = "$navBarUrl/home.svg";
  static const String nSaved = "$navBarUrl/saved.svg";
  static const String nEinvite = "$navBarUrl/e-invite.svg";
  static const String nProfile = "$navBarUrl/profile.svg";

  // categories icons
  static const String cBirthday = "$categoriesBaseUrl/birthday.png";
  static const String cWedding = "$categoriesBaseUrl/wedding.png";
  static const String cCorporate = "$categoriesBaseUrl/corporate.png";
  static const String cGetTogether = "$categoriesBaseUrl/get-together.png";
}
