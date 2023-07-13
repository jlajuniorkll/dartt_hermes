import 'package:dartt_hermes/common/custom_textfield.dart';
import 'package:dartt_hermes/pages/auth/controller/signin_controller.dart';
import 'package:dartt_hermes/services/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FiliacaoScreen extends StatelessWidget {
  const FiliacaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GetBuilder<SigninController>(builder: (controller) {
        return Form(
            key: controller.formKeyFiliacao,
            child: Column(
              children: [
                CustomTextField(
                  onSaved: ((newValue) => controller.cliente.civil = newValue!),
                  icon: Icons.person,
                  label: 'Estado Civil',
                  validator: nameValidator,
                ),
                CustomTextField(
                  onSaved: ((newValue) => controller.cliente.pai = newValue!),
                  icon: Icons.document_scanner,
                  label: 'Pai',
                  validator: nameValidator,
                ),
                CustomTextField(
                  onSaved: ((newValue) => controller.cliente.mae = newValue!),
                  icon: Icons.document_scanner,
                  label: 'Mãe',
                  validator: nameValidator,
                ),
              ],
            ));
      }),
    );
  }
}
