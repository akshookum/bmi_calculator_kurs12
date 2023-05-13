import 'package:bmi_calculator_kurs12/constans/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<Color> maleColor = AppColors.inactiveColor.obs;
  Rx<Color> femaleColor = AppColors.inactiveColor.obs;

  Rx<double> heightValue = 70.0.obs;
  Rx<int> weight = 60.obs;
  Rx<int> age = 30.obs;

  void male() {
    maleColor.value = AppColors.activeColor;
    femaleColor.value = AppColors.inactiveColor;
  }

  void female() {
    femaleColor.value = AppColors.activeColor;
    maleColor.value = AppColors.inactiveColor;
  }

  void minusWeight() {
    weight.value--;
  }

  void plusWeigh() {
    weight.value++;
  }

  void minusAge() {
    age.value--;
  }

  void plusAge() {
    age.value++;
  }
}
