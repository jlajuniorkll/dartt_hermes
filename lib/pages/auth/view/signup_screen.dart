import 'package:dartt_hermes/pages/auth/controller/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final controller = Get.find<SigninController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Cadastre-se'),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFFFF6233),
                  Color(0xFFFFD000),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Obx(() => Stepper(
                currentStep: controller.currentStep.value,
                onStepContinue: () {
                  if (controller.currentStep.value == buildStep().length) {
                    // TODO: ENVIA DADOS FIREBASE
                  } else {
                    controller.currentStep.value++;
                  }
                },
                onStepCancel: () => controller.currentStep.value == 0
                    ? null
                    : controller.currentStep.value--,
                type: StepperType.horizontal,
                steps: buildStep())),
          ),
        ));
  }

  List<Step> buildStep() {
    return <Step>[
      Step(
          title: const Text('Dados Pessoais'),
          content: Container(
            height: 100,
            color: Colors.red,
          ),
          isActive: controller.currentStep.value >= 0),
      Step(
          title: const Text('Endereco'),
          content: Container(
            height: 100,
            color: Colors.green,
          ),
          isActive: controller.currentStep.value >= 1),
      Step(
          title: const Text('Confirmação'),
          content: Container(
            height: 100,
            color: Colors.blue,
          ),
          isActive: controller.currentStep.value >= 2),
    ];
  }
}
