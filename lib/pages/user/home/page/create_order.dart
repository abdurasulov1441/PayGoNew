import 'package:flutter/material.dart';
import 'package:paygo/pages/user/home/widgets/botom_shet_for_peoples.dart';
import 'package:paygo/pages/user/home/widgets/my_button_send.dart';
import 'package:paygo/pages/user/home/widgets/my_custom_bottom_sheet.dart';
import 'package:paygo/pages/user/home/widgets/my_custom_button.dart';
import 'package:paygo/pages/user/home/widgets/my_custom_text_field.dart';
import 'package:paygo/services/style/app_colors.dart';
import 'package:paygo/services/style/app_style.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  final TextEditingController _peopleController = TextEditingController();

  String? selectedFromRegion;
  String? selectedToRegion;
  String? selectedTime;
  int? selectedPeople;
  bool isCustomPeople = true;

  void showRegionPicker(String title, bool isFromRegion) {
    MyCustomBottomSheet.show(
      isSearch: true,
      context,
      items: ['Region 1', 'Region 2', 'Region 3'],
      onItemSelected: (region) {
        setState(() {
          if (isFromRegion) {
            selectedFromRegion = region;
          } else {
            selectedToRegion = region;
          }
        });
      },
    );
  }

  void showTimePicker() {
    MyCustomBottomSheet.show(
      context,
      items: ['08:00', '10:00', '12:00'],
      onItemSelected: (time) {
        setState(() {
          selectedTime = time;
        });
      },
    );
  }

  void showPeoplePicker() {
    MyCustomBottomSheetForPeoples.show(
      context,
      items: List.generate(4, (index) => '${index + 1} odam'),
      onItemSelected: (peopleCount) {
        setState(() {
          selectedPeople = int.tryParse(peopleCount.split(' ')[0]);
          isCustomPeople = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ui,
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(color: AppColors.backgroundColor),
        backgroundColor: AppColors.grade1,
        title: Text(
          'Yuk joylashtirish',
          style: AppStyle.fontStyle.copyWith(
            fontSize: 20,
            color: AppColors.backgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyCustomButton(
                      labelIcon: 'location',
                      onPressed: () => showRegionPicker('Qayerdan', true),
                      text: selectedFromRegion ?? 'Qayerdan',
                      isDropdown: true,
                    ),
                    const SizedBox(height: 20),
                    MyCustomButton(
                      labelIcon: 'location',
                      onPressed: () => showRegionPicker('Qayerga', false),
                      text: selectedToRegion ?? 'Qayerga',
                      isDropdown: true,
                    ),
                    const SizedBox(height: 20),
                    MyCustomButton(
                      labelIcon: 'time',
                      onPressed: () => showTimePicker(),
                      text: selectedTime ?? 'Vaqtni tanlang',
                      isDropdown: false,
                    ),
                    const SizedBox(height: 20),
                    if (!isCustomPeople)
                      MyCustomButton(
                        labelIcon: 'peoples',
                        onPressed: showPeoplePicker,
                        text: selectedPeople != null
                            ? '$selectedPeople odam tanlandi'
                            : 'Odamlar sonini tanlang',
                        isDropdown: false,
                      )
                    else
                      MyCustomTextField(
                        controller: _peopleController,
                        hintText: 'Buyum nomini yozing',
                      ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: MyCustomButtonForSend(
              onPressed: () {},
              text: ' Buyurtma berish',
              icon: null,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _peopleController.dispose();
    super.dispose();
  }
}
