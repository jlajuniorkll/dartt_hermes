import 'package:dartt_hermes/page_routes/app_routes.dart';
import 'package:dartt_hermes/pages/auth/components/confirm_screen.dart';
import 'package:dartt_hermes/pages/auth/components/dados_screen.dart';
import 'package:dartt_hermes/pages/auth/components/endereco_screen.dart';
import 'package:dartt_hermes/pages/auth/components/filiacao_screen.dart';
import 'package:dartt_hermes/pages/auth/controller/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final controller = Get.find<SigninController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastre-se'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Obx(() => Stepper(
              currentStep: controller.currentStep.value,
              onStepContinue: () {
                validaForms();
              },
              onStepCancel: () => controller.currentStep.value <= 0
                  ? null
                  : controller.currentStep.value--,
              onStepTapped: (index) {
                validaForms(index: index);
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (controller.currentStep.value != 0)
                          Expanded(
                              child: SizedBox(
                            height: 32,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 32),
                              child: ElevatedButton(
                                onPressed: details.onStepCancel,
                                child: const Text("Voltar"),
                              ),
                            ),
                          )),
                        Expanded(
                            child: SizedBox(
                          height: 32,
                          child: ElevatedButton(
                            onPressed: details.onStepContinue,
                            child: Text(controller.currentStep.value ==
                                    buildStep().length - 1
                                ? "Finalizar"
                                : "Próximo"),
                          ),
                        ))
                      ]),
                );
              },
              type: StepperType.vertical,
              steps: buildStep())),
        ));
  }

  void validaForms({int? index}) {
    switch (controller.currentStep.value) {
      case 0:
        if (controller.formKeyDados.currentState!.validate()) {
          controller.formKeyDados.currentState!.save();
          nextPage(index);
        }
        break;
      case 1:
        if (controller.formKeyEndereco.currentState!.validate()) {
          controller.formKeyEndereco.currentState!.save();
          controller.currentStep.value++;
        }
        break;
      case 2:
        if (controller.formKeyFiliacao.currentState!.validate()) {
          controller.formKeyFiliacao.currentState!.save();
          nextPage(index);
        }
        break;
      case 3:
        if (controller.formKeyConfirm.currentState!.validate()) {
          controller.formKeyConfirm.currentState!.save();
          controller.addCliente(signinForm: true);
          Get.offNamed(PageRoutes.home);
        }
        break;
    }
  }

  void nextPage(int? index) {
    if (index != null) {
      controller.currentStep.value = index;
    } else {
      controller.currentStep.value++;
    }
  }

  List<Step> buildStep() {
    return <Step>[
      Step(
          title: const Text('Dados Pessoais'),
          content: const DadosScreen(),
          isActive: controller.currentStep.value >= 0,
          state: controller.currentStep.value > 0
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: const Text('Endereco'),
          content: const EnderecoScreen(),
          isActive: controller.currentStep.value >= 1,
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: const Text('Filiação'),
          content: const FiliacaoScreen(),
          isActive: controller.currentStep.value >= 2,
          state: controller.currentStep.value > 2
              ? StepState.complete
              : StepState.indexed),
      Step(
          title: const Text('Confirmação'),
          content: const ConfirmScreen(),
          isActive: controller.currentStep.value >= 3),
    ];
  }
}
