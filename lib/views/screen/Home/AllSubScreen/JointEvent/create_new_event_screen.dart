import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:netwalking_global/controllers/join_event_controller.dart';
import 'package:netwalking_global/utils/app_colors.dart';
import 'package:netwalking_global/views/base/custom_appbar.dart';
import 'package:netwalking_global/views/base/custom_button.dart';
import 'package:netwalking_global/views/base/custom_dropdown_checkbox.dart';
import 'package:netwalking_global/views/base/custom_text_field.dart';

class CreateNewEventScreen extends StatefulWidget {
  const CreateNewEventScreen({super.key});

  @override
  State<CreateNewEventScreen> createState() => _CreateNewEventScreenState();
}

class _CreateNewEventScreenState extends State<CreateNewEventScreen> {
  final eventTitleController = TextEditingController();
  final eventDescription = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final locationController = TextEditingController();
  final paceController = TextEditingController();
  final participantsController = TextEditingController();
  final priceController = TextEditingController();

  String? selectedEventType;
  String? selectedPace;
  String? selectedLanguage;

  final _joinEventController = Get.put(JoinEventController());

  List<String> type = [
    "Professional Networking Event",
    "Social Event",
    "Community Walk",
    "Clean-Up Walk",
    "Dog-Friendly Walk",
    "Women’s Walk",
    "Nature Exploration Walk",
    "Wellness Classes",
  ];

  List<String> location = [
    "Current Location",
    "Within 2 KM",
    "Within 5 KM",
    "Within 10 KM",
  ];
  List<String> pace = ['Slow', 'Moderate', 'Fast'];
  List<String> language = ["English", "Bangle", "Hindi", "Spanish"];

  void timePick() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final now = DateTime.now();
      final dt = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      String formattedTime = DateFormat('HH:mm:ss').format(dt); // 24-hour format
      timeController.text = formattedTime;
    }
  }


  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateController.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Create New Event"),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            "Event",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
          SizedBox(height: 16),
          CustomDropdownCheckbox(
            title: "Type",
            options: type,
            bgColor: Colors.white,
            showCheckbox: false,
            leadingIcon: Image.asset(
              'assets/image/type.png',
              height: 24,
              width: 24,
            ),
            onChanged: (val) {
              if (val.isNotEmpty) {
                selectedEventType = val.first;
              }
            },
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upload Photo or Banner",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                ),
                SizedBox(height: 12),

                Obx(() {
                  final file = _joinEventController.bannerImage.value;
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _joinEventController.pickBannerImage(
                            fromCamera: false,
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: file != null
                              ? Image.file(file, fit: BoxFit.cover)
                              : null,
                        ),
                      ),
                      if (file == null)
                        Positioned(
                          child: SvgPicture.asset('assets/icons/upload.svg'),
                        ),
                    ],
                  );
                }),
              ],
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/right.svg'),
                    SizedBox(width: 12),
                    Text(
                      "Event Title",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                CustomTextField(
                  controller: eventTitleController,
                  hintText: "Write here",
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/right.svg'),
                    SizedBox(width: 12),
                    Text(
                      "Event Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                CustomTextField(
                  controller: eventDescription,
                  maxLines: 5,
                  hintText: "Write here",
                ),
              ],
            ),
          ),
          SizedBox(height: 12),

          CustomTextField(
            controller: dateController,
            filColor: Colors.white,
            hintText: 'Date',
            readOnly: true,
            onTap: () {
              pickDate();
            },
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/icons/calender_fill.svg'),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset('assets/icons/calender.svg'),
            ),
          ),

          SizedBox(height: 12),
          CustomTextField(
            controller: timeController,
            filColor: Colors.white,
            hintText: 'Event Time',
            readOnly: true,
            onTap: () {
              timePick();
            },
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset('assets/icons/clock.svg'),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SvgPicture.asset('assets/icons/calender.svg'),
            ),
          ),

          SizedBox(height: 12),
          CustomTextField(
            controller: locationController,
            filColor: Colors.white,
            hintText: 'Location',
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset('assets/icons/location_fill.svg'),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset('assets/icons/location.svg'),
            ),
          ),

          SizedBox(height: 12),
          CustomDropdownCheckbox(
            title: "Pace Selection",
            showCheckbox: false,
            options: pace,
            bgColor: Colors.white,
            leadingIcon: SvgPicture.asset('assets/icons/pace.svg'),
            onChanged: (val) {
              if (val.isNotEmpty) {
                selectedPace = val.first;
              }
            },
          ),
          SizedBox(height: 12),
          CustomTextField(
            controller: participantsController,
            hintText: 'Participants',
            filColor: Colors.white,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/icons/group_type.svg'),
            ),
          ),
          SizedBox(height: 12),
          CustomDropdownCheckbox(
            title: "Language",
            options: language,
            bgColor: Colors.white,
            showCheckbox: false,
            leadingIcon: SvgPicture.asset(
              'assets/icons/language.svg',
              height: 24,
              width: 24,
            ),
            onChanged: (val) {
              if (val.isNotEmpty) {
                selectedLanguage = val.first;
              }
            },
          ),
          SizedBox(height: 12),
          CustomTextField(
            controller: priceController,
            hintText: 'Cost',
            filColor: Colors.white,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/icons/cost.svg'),
            ),
          ),

          SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFF0957AA), width: 0.5),
                  ),
                  child: Center(
                    child: Text(
                      "Clear",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF084F9B),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Obx(
                      () => CustomButton(
                    loading: _joinEventController.isJoinEventLoading.value,
                    onTap: () {
                      // Validation
                      if (selectedEventType == null || selectedEventType!.isEmpty) {
                        Get.snackbar('Error', 'Please select event type',
                            backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }
                      if (eventTitleController.text.isEmpty) {
                        Get.snackbar('Error', 'Please enter event title',
                            backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }
                      if (eventDescription.text.isEmpty) {
                        Get.snackbar('Error', 'Please enter event description',
                            backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }
                      if (dateController.text.isEmpty) {
                        Get.snackbar('Error', 'Please select date',
                            backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }
                      if (timeController.text.isEmpty) {
                        Get.snackbar('Error', 'Please select event time',
                            backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }
                      if (locationController.text.isEmpty) {
                        Get.snackbar('Error', 'Please enter location',
                            backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }
                      if (selectedPace == null || selectedPace!.isEmpty) {
                        Get.snackbar('Error', 'Please select pace',
                            backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }
                      if (participantsController.text.isEmpty) {
                        Get.snackbar('Error', 'Please enter participants',
                            backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }
                      if (selectedLanguage == null || selectedLanguage!.isEmpty) {
                        Get.snackbar('Error', 'Please select language',
                            backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }
                      if (priceController.text.isEmpty) {
                        Get.snackbar('Error', 'Please enter cost',
                            backgroundColor: Colors.red, colorText: Colors.white);
                        return;
                      }

                      // All validations passed, submit event
                      _joinEventController.joinEvent(
                        bannerImage: _joinEventController.bannerImage.value?.path ?? '',
                        eventType: [selectedEventType!],
                        eventTitle: eventTitleController.text,
                        eventDescription: eventDescription.text,
                        date: dateController.text,
                        eventTime: timeController.text,
                        location: locationController.text,
                        pace: [selectedPace!],
                        participants: participantsController.text,
                        language: [selectedLanguage!],
                        price: int.parse(priceController.text),
                      );
                    },
                    text: "Save Now",
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
