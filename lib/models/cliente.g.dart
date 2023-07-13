// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClienteModel _$ClienteModelFromJson(Map<String, dynamic> json) => ClienteModel(
      id: json['id'] as String?,
      nome: json['nome'] as String?,
      rg: json['rg'] as String?,
      cpf: json['cpf'] as String?,
      nasc: json['nasc'] as String?,
      civil: json['civil'] as String?,
      pai: json['pai'] as String?,
      mae: json['mae'] as String?,
      endereco: json['endereco'] as String?,
      cep: json['cep'] as String?,
      bairro: json['bairro'] as String?,
      cidade: json['cidade'] as String?,
      uf: json['uf'] as String?,
      fone: json['fone'] as String?,
      email: json['email'] as String?,
      obs: json['obs'] as String?,
      saldo: (json['saldo'] as num?)?.toDouble(),
      numero: json['numero'] as String?,
    )
      ..senha = json['senha'] as String?
      ..senhaConfirm = json['senhaConfirm'] as String?
      ..typeUser = json['typeUser'] as String?;

Map<String, dynamic> _$ClienteModelToJson(ClienteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'rg': instance.rg,
      'cpf': instance.cpf,
      'nasc': instance.nasc,
      'civil': instance.civil,
      'pai': instance.pai,
      'mae': instance.mae,
      'endereco': instance.endereco,
      'numero': instance.numero,
      'cep': instance.cep,
      'bairro': instance.bairro,
      'cidade': instance.cidade,
      'uf': instance.uf,
      'fone': instance.fone,
      'email': instance.email,
      'senha': instance.senha,
      'senhaConfirm': instance.senhaConfirm,
      'obs': instance.obs,
      'saldo': instance.saldo,
      'typeUser': instance.typeUser,
    };
