import 'dart:js_interop';

/// Thin JS interop bindings for the global `PaystackPop` V2 popup.
@JS('PaystackPop')
extension type PaystackPop._(JSObject _) implements JSObject {
  external factory PaystackPop();
  external void newTransaction(TransactionConfig config);
}

@JS()
@anonymous
extension type TransactionConfig._(JSObject _) implements JSObject {
  external factory TransactionConfig({
    required String key,
    required String email,
    required int amount,
    String? reference,
    JSExportedDartFunction? onSuccess,
    JSExportedDartFunction? onCancel,
  });

  external String get key;
  external String get email;
  external int get amount;
  external String? get reference;
  external JSExportedDartFunction? get onSuccess;
  external JSExportedDartFunction? get onCancel;
}

@JS()
extension type TransactionResponse._(JSObject _) implements JSObject {
  external String get message;
  external String get reference;
  external String get status;
  external String? get transaction; // transaction id returned by Paystack
}

typedef PaystackOnSuccess = void Function(TransactionResponse response);
typedef PaystackOnCancel = void Function();
