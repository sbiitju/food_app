import 'package:flutter/material.dart';

class PaymentModel {
  final String id;
  final String name;
  List<String>? methodList = <String>[];
  PaymentType paymentType;
  var isSelected = false;
  final Icon icon;

  PaymentModel(this.id, this.name, this.methodList, this.paymentType,
      this.isSelected, this.icon);
}

enum PaymentType { cash, online, mobile }
