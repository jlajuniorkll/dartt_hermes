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
                DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.call),
                        isDense: true,
                        labelText: 'Estado Civil',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18)),
                      ),
                      borderRadius: BorderRadius.circular(18),
                      value: controller.cliente.civil,
                      onChanged: (String? newValue) {
                        controller.setCivilOcurrency(newValue!);
                      },
                      onSaved: (newValue) {
                        controller.setCivilOcurrency(newValue!);
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Escolha uma opção';
                        }
                        return null;
                      },
                      items: controller.listCivil
                          .map<DropdownMenuItem<String>>((String e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
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
