import 'package:dartt_hermes/common/custom_textfield.dart';
import 'package:dartt_hermes/pages/auth/controller/signin_controller.dart';
import 'package:dartt_hermes/services/util_services.dart';
import 'package:dartt_hermes/services/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final utilServices = UtilsServices();
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GetBuilder<SigninController>(
          builder: (controller) {
            return Form(
              key: controller.formKeyConfirm,
              child: Column(
                children: [
                  CustomTextField(
                    onSaved: ((newValue) =>
                        controller.cliente.fone = newValue!),
                    icon: Icons.phone,
                    label: 'Fone/Whats',
                    validator: phoneValidator,
                    inputFormatters: [utilServices.foneFormatter],
                  ),
                  CustomTextField(
                    onSaved: ((newValue) =>
                        controller.cliente.email = newValue!),
                    icon: Icons.email,
                    label: 'Email',
                    validator: emailValidator,
                  ),
                  CustomTextField(
                    onSaved: ((newValue) =>
                        controller.cliente.senha = newValue!),
                    icon: Icons.lock,
                    isSecret: true,
                    label: 'Senha',
                    validator: senhaValidator,
                  ),
                  CustomTextField(
                    icon: Icons.password,
                    isSecret: true,
                    label: 'Repita a senha',
                    onSaved: ((newValue) =>
                        controller.cliente.senhaConfirm = newValue),
                    validator: senhaValidator,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
