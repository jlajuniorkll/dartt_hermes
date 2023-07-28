import 'package:dartt_hermes/models/cliente.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movimento.g.dart';

@JsonSerializable()
class MovimentosModel {
  String? id;
  double? valor;
  String? dataMovimento;
  ClienteModel? usuarioMovimento;

  MovimentosModel(
      {this.id, this.valor, this.dataMovimento, this.usuarioMovimento});

  factory MovimentosModel.fromJson(Map<String, dynamic> json) =>
      _$MovimentosModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovimentosModelToJson(this);
}
