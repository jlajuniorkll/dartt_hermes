// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimento.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovimentosModel _$MovimentosModelFromJson(Map<String, dynamic> json) =>
    MovimentosModel(
      id: json['id'] as String?,
      valor: (json['valor'] as num?)?.toDouble(),
      dataMovimento: json['dataMovimento'] as String?,
      usuarioMovimento: json['usuarioMovimento'] == null
          ? null
          : ClienteModel.fromJson(
              json['usuarioMovimento'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovimentosModelToJson(MovimentosModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'valor': instance.valor,
      'dataMovimento': instance.dataMovimento,
      'usuarioMovimento': instance.usuarioMovimento,
    };
