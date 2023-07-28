import 'package:dartt_hermes/common/appname_widget.dart';
import 'package:dartt_hermes/common/custom_textfield.dart';
import 'package:dartt_hermes/config/custom_colors.dart';
import 'package:dartt_hermes/models/cliente.dart';
import 'package:dartt_hermes/page_routes/app_routes.dart';
import 'package:dartt_hermes/pages/auth/controller/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userResult = Get.find<SigninController>();
    final sizeWidth = MediaQuery.of(context).size.width * 0.8;
    final sizeWidthWeb = MediaQuery.of(context).size.width * 0.6;
    final isMobile = (sizeWidth <= 800.0);
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: linearColor,
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                width: isMobile ? sizeWidth : sizeWidthWeb,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 24),
                            child: AppNameWidget(
                              greenTitleColor: Colors.black,
                              redTitleColor: Colors.black,
                              textSize: 40,
                            ),
                          ),
                          CustomTextField(
                            controller: emailController,
                            onSaved: ((newValue) =>
                                emailController.text = newValue!),
                            icon: Icons.email,
                            label: 'Email',
                          ),
                          CustomTextField(
                            onSaved: ((newValue) =>
                                senhaController.text = newValue!),
                            icon: Icons.lock,
                            label: 'Senha',
                            isSecret: true,
                          ),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  final result = await userResult.signIn(
                                      cliente: ClienteModel(
                                          email: emailController.text
                                              .toLowerCase(),
                                          senha: senhaController.text));
                                  if (result) {
                                    Get.offNamed(PageRoutes.home);
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              child: const Text(
                                'Entrar',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          // Esqueceu a senha
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () async {
                                  /*userResult.setSendUser(await showDialog(
                                      context: context,
                                      builder: (_) => ResetForm(
                                            email: emailController.text,
                                          )));
                                  if (userResult.sendUser) {
                                    Get.snackbar('Sucesso!',
                                        "Link de recuperação enviado para o seu email!",
                                        snackPosition: SnackPosition.BOTTOM,
                                        colorText: Colors.black,
                                        backgroundGradient: linearGreen,
                                        duration: const Duration(seconds: 3),
                                        margin:
                                            const EdgeInsets.only(bottom: 8));
                                  }*/
                                },
                                child: Text(
                                  'Esqueceu a senha?',
                                  style: TextStyle(
                                    color: CustomColors.customContrastColor,
                                  ),
                                )),
                          ),
                          // Divisor
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.withAlpha(90),
                                    thickness: 2,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text('Ou'),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.withAlpha(90),
                                    thickness: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Botão novo usuário
                          SizedBox(
                            height: 50,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  side: BorderSide(
                                    width: 2,
                                    color: CustomColors.customSwatchColor,
                                  )),
                              onPressed: () {
                                Get.toNamed(PageRoutes.signup);
                              },
                              child: const Text(
                                'Primeiro Acesso',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
