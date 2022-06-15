import 'package:ecommerce2/logic/controllers/setting_controller.dart';
import 'package:ecommerce2/logic/controllers/theme_controller.dart';
import 'package:ecommerce2/utils/theme.dart';
import 'package:ecommerce2/view/widget/font_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class  DarkModeWidget extends StatelessWidget {
    DarkModeWidget({Key? key}) : super(key: key);

    final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconWidget(),
            Switch(
                activeTrackColor:Get.isDarkMode ? pinkClr: mainColor,
                activeColor: Get.isDarkMode ? pinkClr: mainColor,
                value: controller.switchValue.value,
                onChanged: (value){
                  ThemeController().changesTheme();
                  controller.switchValue.value = value;
                }
            ),
          ],
        )
    );
  }

  Widget buildIconWidget(){
    return  Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20,),
           TextUtils(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              text: 'Dark Mode',
              color:Get.isDarkMode ? Colors.white : Colors.black,
              underLine: TextDecoration.none),
        ],
      ),
    );
  }
}
