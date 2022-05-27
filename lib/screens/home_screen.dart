import 'package:bmi_calculator/widgets/background_shape_left.dart';
import 'package:bmi_calculator/widgets/background_shape_right.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  double bmiResult = 0;
  String resultText = '';
  double widthGood = 0;
  double widthBad = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackground,
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: orangeMain,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const SizedBox(
                width: 260,
                child: Text(
                  'وزنت رو به کیلوگرم و قدت رو به سانتی متر وارد کن',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: orangeMain),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: TextField(
                      controller: heightController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: orangeMain),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'قد؟',
                        hintStyle: TextStyle(
                          color: orangeMain.withOpacity(0.5),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: orangeMain),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: TextField(
                      controller: weightController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: orangeMain),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'وزن؟',
                        hintStyle: TextStyle(
                          color: orangeMain.withOpacity(0.5),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: orangeMain,
                    minimumSize: const Size(330, 30)),
                onPressed: () {
                  final weight = double.parse(weightController.text);
                  final height = double.parse(heightController.text);

                  setState(() {
                    bmiResult = weight / ((height * height) / 10000);
                    if (bmiResult > 25) {
                      resultText = 'مراقب وزنت باش';
                      widthGood = 50;
                      widthBad = 300;
                    } else if (bmiResult >= 18.5 && bmiResult <= 25) {
                      resultText = 'ایول، وزنت خوبه';
                      widthGood = 300;
                      widthBad = 50;
                    } else {
                      resultText = 'وزنت کم تر از حالت استاندارد هست';
                      widthGood = 20;
                      widthBad = 20;
                    }
                  });
                },
                child: const Text(
                  '! محاسبه کن',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                bmiResult.toStringAsFixed(2),
                style: const TextStyle(fontSize: 60),
              ),
              SizedBox(
                width: 300,
                child: Text(
                  resultText,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: orangeMain),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              RightShape(width: widthBad),
              const SizedBox(height: 5),
              LeftShape(width: widthGood),
            ],
          ),
        ),
      ),
    );
  }
}
