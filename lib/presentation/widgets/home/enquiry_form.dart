import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venue_booking/core/core.dart';
import 'package:venue_booking/presentation/widgets/widgets.dart';

class EnquiryForm extends StatelessWidget {
  final Venue venue;

  const EnquiryForm({
    required this.venue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(22.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22.0),
          topRight: Radius.circular(22.0),
        ),
      ),
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Text(
              "Enquiry Form",
              style: textTheme.headline3,
            ),
            const SizedBox(height: 22.0),
            // ask here
            TextInputField(
              inputType: TextInputType.name,
              inputFormatters: const [],
              hint: "Name",
              onChanged: (String? value) => locator.get<HomeController>().name = value?.trim() ?? "",
            ),
            const SizedBox(height: 22.0),
            TextInputField(
              inputType: TextInputType.emailAddress,
              inputFormatters: const [],
              hint: "Email",
              onChanged: (String? value) => locator.get<HomeController>().email = value?.trim() ?? "",
            ),
            const SizedBox(height: 22.0),
            TextInputField(
              inputType: TextInputType.phone,
              inputFormatters: const [],
              hint: "Phone Number",
              prefix: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  width: 48,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "+91",
                      style: textTheme.headline3,
                    ),
                  ),
                ),
              ),
              onChanged: (String? value) => locator.get<HomeController>().phone = value?.trim() ?? "",
            ),
            const SizedBox(height: 32.0),
            _sendEnquiry(size, textTheme),
          ],
        ),
      ),
    );
  }

  Widget _sendEnquiry(Size size, TextTheme textTheme) => SizedBox(
        width: size.width,
        child: ElevatedButton(
          onPressed: () async {
            await locator.get<HomeController>().sendUserEnquiry(venue.id);
            locator.get<NavigationService>().pop();
            locator.get<NavigationService>().pop();
            Get.showSnackbar(
              const GetSnackBar(
                messageText: Center(
                  child: Text(
                    "Enquiry Sent!",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                backgroundColor: AppTheme.primaryColor,
                padding: EdgeInsets.all(22.0),
                barBlur: 6.0,
                duration: Duration(seconds: 2),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
          ),
          child: Text(
            "Book",
            style: textTheme.headline4!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
}
