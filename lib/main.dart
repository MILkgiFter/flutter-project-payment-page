import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Braintree Payment Demo',
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    super.initState();
    initBraintreePayment();
  }

  Future<void> initBraintreePayment() async {
    await FlutterBraintree.initialize('sandbox_8hw2fynb_5r8rv5ztbjkbvc2j');
  }

  Future<void> handleBraintreePayment() async {
    var request = BraintreeDropInRequest(
      tokenizationKey: 'sandbox_8hw2fynb_5r8rv5ztbjkbvc2j',
      collectDeviceData: true,
      googlePaymentRequest: BraintreeGooglePaymentRequest(
        totalPrice: '10.00',
        currencyCode: 'USD',
        billingAddressRequired: false,
      ),
      paypalRequest: BraintreePayPalRequest(
        amount: '10.00',
        currencyCode: 'USD',
      ),
    );
    BraintreeDropInResult result = await FlutterBraintree.dropInResult(request);
    if (result != null) {
      print(result.paymentMethodNonce.nonce);
      // Отправьте nonce на сервер для обработки платежа
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оплата'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () async {
            await handleBraintreePayment();
          },
          child: Text('Оплатить'),
        ),
      ),
    );
  }
}
