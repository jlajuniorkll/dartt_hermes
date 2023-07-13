import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartt_hermes/models/cliente.dart';
import 'package:dartt_hermes/pages/auth/result/auth_result.dart';
import 'package:dartt_hermes/services/util_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final utilServices = UtilsServices();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final fireRef = FirebaseFirestore.instance.collection('client');

  Future<AuthResult<ClienteModel>> signUp(
      {required ClienteModel cliente}) async {
    try {
      final resultEmail =
          await fireRef.where("email", isEqualTo: cliente.email).get();
      if (resultEmail.docs.isEmpty) {
        final UserCredential result = await auth.createUserWithEmailAndPassword(
          email: cliente.email!,
          password: cliente.senha!,
        );
        cliente.id = result.user!.uid;
        addCliente(cliente: cliente);
        return AuthResult<ClienteModel>.success(cliente);
      } else {
        return AuthResult.error('E-mail já está cadastrado!');
      }
    } on FirebaseAuthException catch (e) {
      return AuthResult.error(utilServices.getErrorString(e.code));
    }
  }

  Future<void> addCliente({required ClienteModel cliente}) async {
    // user.id = fireRef.doc().id; este recupera o id que foi salvo no firebase após persistir
    try {
      await fireRef.doc(cliente.id).set(cliente.toJson());
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future<AuthResult<ClienteModel>> signIn(
      {required ClienteModel cliente}) async {
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: cliente.email!,
        password: cliente.senha!,
      );
      final User? currentUser = result.user ?? auth.currentUser;
      if (currentUser != null) {
        final DocumentSnapshot docUser =
            await fireRef.doc(currentUser.uid).get();
        final ClienteModel clienteModel = ClienteModel.fromDocument(docUser);
        return AuthResult<ClienteModel>.success(clienteModel);
      } else {
        return AuthResult<ClienteModel>.error('Erro ao buscar usuário logado!');
      }
      // await _loadCurrentUser(firebaseUser: result.user);
    } on FirebaseAuthException catch (e) {
      return AuthResult.error(utilServices.getErrorString(e.code));
    }
  }
}
