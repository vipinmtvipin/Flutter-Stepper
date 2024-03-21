import 'package:flutter/material.dart';

import 'custome_stepper/flutter_vip_stepper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Stepper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(
        "Step 1",
      ),
    ),
    StepperData(
        title: StepperText("Step 2"),
        iconWidget: const Icon(
          Icons.invert_colors,
          color: Colors.white,
          size: 15,
        ),
        progressPercentage: 30,
        showProgressIndicator: true),
    StepperData(
        title: StepperText(
      "Step 3",
    )),
  ];

  List<StepperData> stepperDataSub = [
    StepperData(
      title: StepperText(
        "Step 1",
      ),
      subtitle: StepperText(
        "Step 1 details",
      ),
    ),
    StepperData(
      title: StepperText("Step 2"),
      subtitle: StepperText(
        "Step 2 details",
      ),
    ),
    StepperData(
      title: StepperText(
        "Step 3",
      ),
      subtitle: StepperText(
        "Step 3 details",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FlutterVipStepper(
                stepperList: stepperData,
                stepperDirection: Axis.horizontal,
                inverted: true,
                activeIndex: 1,
                activeColor: Colors.lightBlueAccent,
                inActiveColor: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FlutterVipStepper(
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                inverted: false,
                activeIndex: 1,
                verticalGap: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FlutterVipStepper(
                stepperList: stepperDataSub,
                stepperDirection: Axis.horizontal,
                inverted: false,
                activeIndex: 0,
                isFilledInActiveDot: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FlutterVipStepper(
                stepperList: stepperDataSub,
                stepperDirection: Axis.vertical,
                inverted: true,
                activeIndex: 1,
                verticalGap: 30,
                iconHeight: 15,
                iconWidth: 15,
                stepDotWithNoContent: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
