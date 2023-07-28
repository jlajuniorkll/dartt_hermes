import 'package:dartt_hermes/config/custom_colors.dart';
import 'package:dartt_hermes/pages/auth/controller/signin_controller.dart';
import 'package:dartt_hermes/pages/home/components/client_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<SigninController>();

    List<Widget> listCliente = [
      Padding(
        padding: const EdgeInsets.all(32.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Poupança: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                      userController.clienteLogado!.saldo != null
                          ? "R\$ ${userController.clienteLogado!.saldo}"
                          : "R\$ 0,00",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ]),
                const SizedBox(
                  height: 8,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Fidelidade: ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(
                      userController.clienteLogado!.saldo != null
                          ? "GD\$ ${userController.clienteLogado!.saldo}"
                          : "GD\$ 0,00",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ]),
              ],
            ),
          ),
        ),
      ),
      const Align(
          alignment: Alignment.center,
          child: Text("Você ainda não possui contratos para assinar!"))
    ];

    List<Widget> listAdm = [
      Padding(
          padding:
              const EdgeInsets.only(left: 32.0, right: 32, top: 24, bottom: 0),
          child: GetBuilder<SigninController>(builder: (controller) {
            return TextFormField(
              controller: controller.searchController,
              onChanged: (value) {
                controller.searchTitle.value = value;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Localizar cliente...',
                hintStyle:
                    TextStyle(color: Colors.grey.shade400, fontSize: 14.0),
                suffixIcon: controller.searchTitle.value.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          controller.searchController.clear();
                          controller.searchTitle.value = '';
                          FocusScope.of(context).unfocus();
                        },
                        icon: Icon(
                          Icons.close,
                          color: CustomColors.customContrastColor,
                          size: 21,
                        ),
                      )
                    : null,
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrastColor,
                  size: 21,
                ),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                      color: CustomColors.customContrastColor, width: 0.0),
                ),
              ),
            );
          })),
      GetBuilder<SigninController>(
        builder: (controller) {
          return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              itemCount: controller.allUserFiltered.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  child: UserListTile(
                      userReceived: controller.allUserFiltered[index]),
                );
              });
        },
      ),
    ];

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: linearColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Olá, ${userController.clienteLogado!.nome}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(60))),
                child: Column(
                  children:
                      userController.clienteLogado!.typeUser == "Administrador"
                          ? listAdm
                          : listCliente,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
