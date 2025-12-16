import 'package:flutter/material.dart';

import 'js_stub.dart';

class PaystackPop {
  PaystackPop();

  void newTransaction(TransactionConfig config) {
    throw UnimplementedError();
  }
}

class TransactionConfig {
  final String? key;
  final String? email;
  final int amount;
  final String? reference;

  final JSExportedDartFunction? onSuccess;
  final JSExportedDartFunction? onCancel;

  TransactionConfig({
    required this.key,
    required this.email,
    required this.amount,
    this.reference,
    this.onSuccess,
    this.onCancel,
  });
}

abstract class TransactionResponse {
  String get message;

  String get reference;

  String get status;

  String? get transaction;
}

typedef PaystackOnSuccess = void Function(TransactionResponse response);
typedef PaystackOnCancel = void Function();
