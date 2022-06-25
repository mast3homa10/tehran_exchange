import 'package:flutter/material.dart';

class FinalStepsPage extends StatefulWidget {
  const FinalStepsPage({Key? key}) : super(key: key);

  @override
  State<FinalStepsPage> createState() => _FinalStepsPageState();
}

class _FinalStepsPageState extends State<FinalStepsPage> {
  int currentstep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: currentstep,
          onStepContinue: () => setState(() {
            currentstep++;
          }),
          onStepTapped: (value) => setState(() {
            currentstep = value;
          }),
          onStepCancel: () => setState(() {
            currentstep--;
          }),
          steps: [
            Step(
                isActive: currentstep == 0,
                title: const Text('test1'),
                content: const Text('test1')),
            Step(
                isActive: currentstep == 1,
                title: const Text('te1'),
                content: const Text('te1')),
            Step(
                isActive: currentstep == 2,
                title: const Text('t'),
                content: const Text('t')),
          ],
        ),
      ),
    );
  }
}
