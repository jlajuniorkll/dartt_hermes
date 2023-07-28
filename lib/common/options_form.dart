import 'package:dartt_hermes/common/alerts.dart';
import 'package:dartt_hermes/models/cliente.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionsForm extends StatelessWidget {
  const OptionsForm({super.key, required this.userReceived});

  final ClienteModel userReceived;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Cliente: ${userReceived.nome}",
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.close),
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 8, right: 16, bottom: 8),
              child: ElevatedButton.icon(
                  onPressed: () async {
                    await Get.dialog(AlertFetch(
                        title: 'Alterar saldo: ${userReceived.nome}',
                        body: 'Aqui vai os campos'));
                  },
                  icon: const Icon(Icons.attach_money),
                  label: const Text("Alterar saldo")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 8, right: 16, bottom: 16),
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.list),
                  label: const Text("Gerar contrato")),
            ),
          ],
        ),
      ),
    ));
  }
}
