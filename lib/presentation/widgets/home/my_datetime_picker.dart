import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venue_booking/core/core.dart';

class MyDateTimePicker extends StatelessWidget {
  const MyDateTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _pickDate(context),
      child: Padding(
        padding: kIsWeb ? const EdgeInsets.symmetric(horizontal: 240.0, vertical: 22.0) : const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Text("Pick Date", style: textTheme.headline3),
            // date picker
            GetBuilder<HomeController>(builder: (HomeController controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                child: Row(
                  children: [
                    // start date
                    _buildStartDate(controller.startDate, textTheme),
                    // arrow indicator
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Icon(Icons.arrow_forward),
                    ),
                    // end date
                    _buildEndDate(controller.endDate, textTheme),
                    // spacing
                    const Spacer(),
                    // date icon
                    _buildDatePicker(),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // Builder Functions
  Widget _buildStartDate(DateTime startDate, TextTheme textTheme) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // start date
          Text(startDate.dateOfBirthUIFormat),
          // time
          // const Text("10.00 AM"),
        ],
      );

  Widget _buildEndDate(DateTime endDate, TextTheme textTheme) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // start date
          Text(endDate.dateOfBirthUIFormat),
          // time
          // const Text("10.00 AM"),
        ],
      );

  Widget _buildDatePicker() => Container(
        padding: const EdgeInsets.all(8.0),
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
        child: Image.asset(
          ImageAssets.calender,
          height: 28.0,
          width: 28.0,
        ),
      );

  // MeMber Functions
  Future<void> _pickDate(BuildContext context) async {
    showCustomDateRangePicker(
      context,
      dismissible: true,
      minimumDate: DateTime.now(),
      maximumDate: DateTime.now().add(const Duration(days: 90)),
      endDate: DateTime.now().add(const Duration(days: 1)),
      startDate: DateTime.now(),
      onApplyClick: (start, end) {
        locator.get<HomeController>()
          ..startDate = start
          ..endDate = end
          ..update();
      },
      onCancelClick: () {
        locator.get<HomeController>()
          ..startDate = DateTime.now()
          ..endDate = DateTime.now()
          ..update();
      },
    );
  }
}
