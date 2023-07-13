import 'package:dartt_hermes/common/custom_textfield.dart';
import 'package:dartt_hermes/pages/auth/controller/signin_controller.dart';
import 'package:dartt_hermes/services/util_services.dart';
import 'package:dartt_hermes/services/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnderecoScreen extends StatelessWidget {
  const EnderecoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final utilServices = UtilsServices();
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GetBuilder<SigninController>(builder: (controller) {
        return Form(
            key: controller.formKeyEndereco,
            child: Column(
              children: [
                CustomTextField(
                  onSaved: ((newValue) => controller.cliente.cep = newValue!),
                  icon: Icons.location_searching,
                  label: 'CEP',
                  validator: cepValidator,
                  inputFormatters: [utilServices.cepFormatter],
                ),
                CustomTextField(
                  onSaved: ((newValue) =>
                      controller.cliente.endereco = newValue!),
                  icon: Icons.home,
                  label: 'Endereco',
                  validator: logradouroValidator,
                ),
                CustomTextField(
                  onSaved: ((newValue) =>
                      controller.cliente.numero = newValue!),
                  icon: Icons.numbers,
                  label: 'Numero',
                  validator: logradouroValidator,
                ),
                CustomTextField(
                  onSaved: ((newValue) =>
                      controller.cliente.bairro = newValue!),
                  icon: Icons.location_pin,
                  label: 'Bairro',
                  validator: bairroValidator,
                ),
                CustomTextField(
                  onSaved: ((newValue) =>
                      controller.cliente.cidade = newValue!),
                  icon: Icons.location_city,
                  label: 'Cidade',
                  validator: cidadeValidator,
                ),
                CustomTextField(
                  onSaved: ((newValue) => controller.cliente.uf = newValue!),
                  icon: Icons.location_city_outlined,
                  label: 'UF',
                  validator: estadoValidator,
                ),
              ],
            ));
      }),
    );
  }
}
