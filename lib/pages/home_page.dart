import 'package:bmi_calculator_kurs12/constans/colors/app_colors.dart';
import 'package:bmi_calculator_kurs12/pages/result_page.dart';
import 'package:bmi_calculator_kurs12/widgets/custom_container_widget.dart';
import 'package:bmi_calculator_kurs12/widgets/weightAge_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleColor = AppColors.inactiveColor;
  Color femaleColor = AppColors.inactiveColor;

  double heightValue = 70;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.mainColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                      CustomContainer(
                        icon: Icons.male,
                        text: 'Male',
                        tus: maleColor,
                        onTap: () {
                          setState(() {
                            maleColor = AppColors.activeColor;
                            femaleColor = AppColors.inactiveColor;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      CustomContainer(
                        onTap: () {
                          setState(() {
                            femaleColor = AppColors.activeColor;
                            maleColor = AppColors.inactiveColor;
                          });
                        },
                        icon: Icons.female,
                        text: 'FEMALE',
                        tus: femaleColor,
                      ),
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
                              Text(
                                heightValue.toStringAsFixed(0),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                          Slider(
                              activeColor: Colors.red,
                              inactiveColor: Colors.grey,
                              thumbColor: Colors.blue,
                              max: 220,
                              min: 30,
                              value: heightValue,
                              onChanged: (adamdynBakany) {
                                heightValue = adamdynBakany;
                                setState(() {});
                              })
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeightAge(
                          tag1: '3',
                          tag2: '4',
                          title: 'Weight',
                          number: weight.toString(),
                          onPressedMines: (() {
                            setState(() {
                              setState(() {
                                weight--;
                              });
                            });
                          }),
                          onPressedPlus: (() {
                            setState(() {
                              weight++;
                            });
                          })),
                      SizedBox(width: 10),
                      WeightAge(
                          tag1: '1',
                          tag2: '2',
                          title: 'Age',
                          number: age.toString(),
                          onPressedMines: (() {
                            setState(() {
                              setState(() {
                                age--;
                              });
                            });
                          }),
                          onPressedPlus: (() {
                            setState(() {
                              age++;
                            });
                          })),
                    ],
                  ),
                ],
              ),
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
                            height: heightValue,
                            kg: weight,
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
