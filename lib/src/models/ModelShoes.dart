
import 'package:flutter/cupertino.dart';

class ModelShoes extends ChangeNotifier {
  double _height = 500;

  double get height => this._height;

  set height(double valor) {
    this._height = valor;
  }
}
