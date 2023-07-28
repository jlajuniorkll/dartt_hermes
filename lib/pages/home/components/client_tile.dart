import 'package:dartt_hermes/common/alerts.dart';
import 'package:dartt_hermes/common/options_form.dart';
import 'package:dartt_hermes/config/custom_colors.dart';
import 'package:dartt_hermes/models/cliente.dart';
import 'package:dartt_hermes/pages/auth/controller/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({Key? key, required this.userReceived}) : super(key: key);

  final ClienteModel userReceived;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SigninController>();
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              userReceived.nome!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              userReceived.email!,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              userReceived.cpf!,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Get.dialog(
                              OptionsForm(userReceived: userReceived));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 4, right: 6),
                          child: Icon(Icons.add_circle,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Switch(
                          value: userReceived.active,
                          activeColor: Colors.blue,
                          onChanged: (bool value) async {
                            final confirm = await Get.dialog<bool>(AlertFetch(
                                title: 'Tem certeza?',
                                body: userReceived.active
                                    ? 'Deseja inativar o usuário: ${userReceived.nome}?'
                                    : 'Deseja ativar o usuário: ${userReceived.nome}?'));
                            if (confirm == true) {
                              controller.setIsActive(userReceived);
                              Get.snackbar(
                                  userReceived.active ? 'Ativo:' : 'Inativo:',
                                  userReceived.active
                                      ? 'Cliente ${userReceived.nome} foi ativado com sucesso!'
                                      : 'Cliente ${userReceived.nome} foi inativado com sucesso!',
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.black,
                                  backgroundGradient: linearOrange,
                                  duration: const Duration(seconds: 4),
                                  margin: const EdgeInsets.only(bottom: 8));
                            }
                          }),
                    ],
                  )),
            ],
          ),
        ));
  }
}
