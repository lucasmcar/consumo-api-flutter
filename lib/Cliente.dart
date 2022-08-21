import 'package:flutter/material.dart';

class Cliente {
  int? _id;
  String? _nome;
  String? _email;
  String? _celular;

  Cliente(this._id, this._nome, this._email, this._celular);

  int? get id => this._id;

  set id(int? value) => this._id = value;

    get nome => this._nome;

  set nome( value) => this._nome = value;

    get email => this._email;

  set email( value) => this._email = value;

    get celular => this._celular;

  set celular( value) => this._celular = value;
  


}
