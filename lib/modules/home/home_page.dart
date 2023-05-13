import 'dart:developer';

import 'package:bmi_calculator_kurs12/constans/colors/app_colors.dart';
import 'package:bmi_calculator_kurs12/modules/home/home_controller.dart';
import 'package:bmi_calculator_kurs12/modules/home/result/result_page.dart';
import 'package:bmi_calculator_kurs12/components/buttons/custom_container_widget.dart';
import 'package:bmi_calculator_kurs12/components/buttons/weightAge_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.mainColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  'Bmi Calculator',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(() => CustomContainer(
                        icon: Icons.male,
                        text: 'Male',
                        tus: _homeController.maleColor.value,
                        onTap: _homeController.male)),
                    SizedBox(width: 10),
                    Obx(() => CustomContainer(
                          onTap: _homeController.female,
                          icon: Icons.female,
                          text: 'FEMALE',
                          tus: _homeController.femaleColor.value,
                        )),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  decoration: BoxDecoration(
                    color: AppColors.secondarColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Height'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Obx(() => Text(
                                  _homeController.heightValue.value
                                      .toStringAsFixed(0),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            Text(
                              'cm',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Obx(() => Slider(
                            activeColor: Colors.red,
                            inactiveColor: Colors.grey,
                            thumbColor: Colors.blue,
                            max: 220,
                            min: 30,
                            value: _homeController.heightValue.value,
                            onChanged: (adamdynBakany) {
                              _homeController.heightValue.value = adamdynBakany;
                              // log('');
                            }))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeightAge(
                            tag1: '3',
                            tag2: '4',
                            title: 'Weight',
                            number: _homeController.weight.value.toString(),
                            onPressedMines: _homeController.minusWeight,
                            onPressedPlus: _homeController.plusWeigh),
                        SizedBox(width: 10),
                        WeightAge(
                            tag1: '1',
                            tag2: '2',
                            title: 'Age',
                            number: _homeController.age.value.toString(),
                            onPressedMines: _homeController.minusAge,
                            onPressedPlus: _homeController.plusAge),
                      ],
                    )),
              ]),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 37,
            ),
            child: InkWell(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ResultPage(
                            height: _homeController.heightValue.value,
                            kg: _homeController.weight.value,
                          )),
                    ));
              }),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 82, 82, 1),
                    borderRadius: BorderRadius.circular(12)),
                height: MediaQuery.of(context).size.height * 0.09,
                child: Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
