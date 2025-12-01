import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  String _nombreMoto = '';
  double _fuelTankLiters = 0.0;
  double _consumptionL100 = 0.0;
  double _kmFet = 0.0;

  int get counter => _counter;
  String get nombreMoto => _nombreMoto;
  double get FuelTankLiters => _fuelTankLiters;
  double get ConsumptionL100 => _consumptionL100;
  double get KmFet => _kmFet;

  
  

  void increment() {
    _counter++;
    notifyListeners();
  }

  void setNombreMoto(String nombre) {
    _nombreMoto = nombre;
    notifyListeners();
  }

  void setFuelTankLiters(double liters) {
    _fuelTankLiters = liters;
    notifyListeners();
  }

  void setConsumptionL100(double consumption) {
    _consumptionL100 = consumption;
    notifyListeners();
  }

  void setKmFet(double km) {
    _kmFet = km;
    notifyListeners();
  }
}