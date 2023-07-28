import 'package:dartt_hermes/models/cliente.dart';
import 'package:dartt_hermes/page_routes/app_routes.dart';
import 'package:dartt_hermes/pages/auth/repository/signin_repository.dart';
import 'package:dartt_hermes/pages/auth/result/auth_result.dart';
import 'package:dartt_hermes/services/commom_results.dart';
import 'package:dartt_hermes/services/loading_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final userRepository = UserRepository();
  var currentStep = 0.obs;
  bool isLoading = false;

  final GlobalKey<FormState> formKeyDados = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyEndereco = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyFiliacao = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyConfirm = GlobalKey<FormState>();

  final searchController = TextEditingController();
  RxString searchTitle = ''.obs;

  ClienteModel cliente = ClienteModel();
  ClienteModel? clienteLogado;
  List<ClienteModel> allUser = [];
  List<ClienteModel> allUserFiltered = [];
  final List<String> listCivil = <String>[
    'Solteiro(a)',
    'Separado(a)',
    'Casado(a)',
    'União Estável',
    'Viúvo(a)'
  ];

  String _searchUser = '';
  String get searchUser => _searchUser;

  @override
  void onInit() {
    super.onInit();
    // função do getx
    debounce(searchTitle, (_) => filterByTitle(),
        time: const Duration(milliseconds: 600));
    getAllUser();
  }

  set searchUser(String value) {
    _searchUser = value;
    update();
  }

  void setLoading(bool value) {
    isLoading = value;
    if (isLoading) {
      LoadingServices.showLoading();
    } else {
      LoadingServices.hideLoading();
    }
    update();
  }

  void setClienteLogado(ClienteModel value) {
    clienteLogado = value;
    update();
  }

  void setCivilOcurrency(String value) {
    cliente.civil = value;
    update();
  }

  Future<bool> signIn({required ClienteModel cliente}) async {
    bool loginSucesso = false;
    setLoading(true);
    AuthResult<ClienteModel> result =
        await userRepository.signIn(cliente: cliente);
    setLoading(false);
    result.when(success: (data) {
      setClienteLogado(data);
      loginSucesso = true;
    }, error: (message) {
      Get.snackbar(
        "Tente novamente",
        "Erro: $message",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        borderColor: Colors.white,
        borderRadius: 0,
        borderWidth: 2,
        barBlur: 0,
      );
    });
    return loginSucesso;
  }

  Future<void> getAllUser({bool? injection}) async {
    if (injection == false) setLoading(true);
    GenericsResult<ClienteModel> userResult = await userRepository.getAllUser();
    setLoading(false);

    userResult.when(success: (data) {
      allUser.assignAll(data);
      filterByTitle();
    }, error: (message) {
      Get.snackbar(
        "Tente novamente",
        "Erro ao buscar lista de usuários",
        backgroundColor: Colors.grey,
        snackPosition: SnackPosition.BOTTOM,
        borderColor: Colors.indigo,
        borderRadius: 0,
        borderWidth: 2,
        barBlur: 0,
      );
    });
  }

  Future<void> addCliente({bool signinForm = false}) async {
    setLoading(true);
    if (signinForm) {
      cliente.typeUser = "Cliente";
    } else {
      cliente.typeUser = "Administrador";
    }

    final resultSignup = await userRepository.signUp(cliente: cliente);
    setLoading(false);
    resultSignup.when(
      success: (data) {
        Get.snackbar(
            'Cadastrado', 'Usuário ${data.nome} cadastrado com sucesso!',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.black,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
            margin: const EdgeInsets.only(bottom: 8));
        if (signinForm) {
          Get.offNamed(PageRoutes.signin);
        }
      },
      error: (message) {
        Get.snackbar(
          "Tente novamente",
          "Erro ao cadastrar usuário - $message",
          colorText: Colors.black,
          backgroundColor: Colors.yellow,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 0,
          borderWidth: 2,
          barBlur: 0,
        );
      },
    );
    // getAllUser();
  }

  /*Future<void> deleteUser(String id) async {
    setLoading(true);
    await userRepository.deleteUser(userId: id);
    getAllUser();
    setLoading(false);
  }*/

  /*Future<void> updateUser() async {
    setLoading(true);
    if (tipoUsuarioSelecionado != null) {
      usuario.typeUser = tipoUsuarioSelecionado;
    }
    await userRepository.updateUser(user: usuario);
    getAllUser();
    setLoading(false);
  }*/

  /*List<ClienteModel> get allUserFiltered {
    final List<ClienteModel> allUserFiltereds = [];
    if (searchTitle.value.isEmpty) {
      allUserFiltereds.addAll(allUser);
    } else {
      allUserFiltereds.addAll(allUser.where((element) => element.nome!
          .toLowerCase()
          .contains(searchTitle.value.toLowerCase())));
    }
    return allUserFiltereds;
  }*/

  void filterByTitle() {
    allUserFiltered.clear();
    if (searchTitle.value.isNotEmpty) {
      /* allUserFiltered.addAll(allUser.where((e) =>
          e.nome!.toUpperCase().contains(searchTitle.value.toUpperCase())));*/
      allUserFiltered.addAll(allUser.where((cliente) =>
          cliente.nome!
              .toUpperCase()
              .contains(searchTitle.value.toUpperCase()) ||
          cliente.cpf!.contains(searchTitle.value) ||
          cliente.fone!.contains(searchTitle.value)));
    } else {
      allUserFiltered.addAll(allUser);
    }
    update();
  }

  void setIsActive(ClienteModel value) {
    cliente = value;
    cliente.active = !value.active;
    updateActive();
    update();
  }

  Future<void> updateActive() async {
    await userRepository.updateActive(cliente: cliente);
    getAllUser();
  }

  /*Future<void> resetUser(String email) async {
    await userRepository.resetUser(email: email);
  }*/
}
