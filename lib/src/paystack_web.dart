import 'dart:async';

import 'package:flutter_paystack/flutter_paystack.dart';

import 'js/js_stub.dart' if (dart.library.js) 'dart:js_interop';
import 'js/paystack_stub.dart' if (dart.library.js) 'js/paystack_js.dart';

class PaystackWeb {
  Future<CheckoutResponse> checkout(Charge charge, String key) async {
    final completer = Completer<CheckoutResponse>();

    final paystack = PaystackPop();

    paystack.newTransaction(
      TransactionConfig(
        key: key,
        email: charge.email!,
        amount: charge.amount,
        reference: charge.reference!,
        onCancel: (() {
          completer.complete(CheckoutResponse.defaults());
        }).toJS,
        onSuccess: ((TransactionResponse response) {
          completer.complete(
            CheckoutResponse(
              message: response.message,
              reference: response.reference,
              status: response.status == 'success',
              method: CheckoutMethod.card,
              verify: true,
              card: charge.card ?? PaymentCard.empty(),
            ),
          );
        }).toJS,
      ),
    );

    return completer.future;
  }
}
