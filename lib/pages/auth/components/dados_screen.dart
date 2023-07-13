import 'package:dartt_hermes/common/custom_textfield.dart';
import 'package:dartt_hermes/pages/auth/controller/signin_controller.dart';
import 'package:dartt_hermes/services/util_services.dart';
import 'package:dartt_hermes/services/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DadosScreen extends StatelessWidget {
  const DadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final utilServices = UtilsServices();
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GetBuilder<SigninController>(builder: (controller) {
        return Form(
            key: controller.formKeyDados,
            child: Column(
              children: [
                CustomTextField(
                  onSaved: ((newValue) => controller.cliente.nome = newValue!),
                  icon: Icons.person,
                  label: 'Nome',
                  validator: nameValidator,
                ),
                CustomTextField(
                  onSaved: ((newValue) => controller.cliente.rg = newValue!),
                  icon: Icons.document_scanner,
                  label: 'RG',
                  validator: rgValidator,
                  inputFormatters: [utilServices.rgFormatter],
                ),
                CustomTextField(
                  onSaved: ((newValue) => controller.cliente.cpf = newValue!),
                  icon: Icons.document_scanner,
                  label: 'CPF',
                  validator: cpfValidator,
                  inputFormatters: [utilServices.cpfFormatter],
                ),
                CustomTextField(
                  onSaved: ((newValue) => controller.cliente.nasc = newValue!),
                  icon: Icons.date_range,
                  label: 'Data Nascimento',
                  validator: dataValidator,
                  inputFormatters: [utilServices.dataFormatter],
                ),
              ],
            ));
      }),
    );
  }
}
