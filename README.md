# iyzico_payment

![Iyzico Logo](https://www.iyzico.com/assets/images/content/logo.svg)

iyzico_payment, Dart ve Flutter projelerinde Iyzico ödeme entegrasyonunu kolaylaştıran bir pakettir.

## Özellikler

- Iyzico API ile kolay entegrasyon
- Güvenli ödeme işlemleri
- Sandbox ve canlı ortam desteği

## Kurulum

pubspec.yaml dosyanıza aşağıdaki bağımlılığı ekleyin:

```yaml
dependencies:
  iyzico_payment: ^1.0.0

## Kullanım
```import 'package:iyzico_payment/iyzico_payment.dart';

void main() async {
  final iyzicoPayment = IyzicoPayment(
    apiKey: 'YOUR_API_KEY',
    secretKey: 'YOUR_SECRET_KEY',
  );

  final paymentRequest = PaymentRequest(
    // Ödeme detaylarını burada belirtin
  );

  try {
    final response = await iyzicoPayment.createPayment(paymentRequest);
    print('Ödeme başarılı: ${response.body}');
  } catch (e) {
    print('Ödeme hatası: $e');
  }
}

##IyzicoPayment
```IyzicoPayment({
  required String apiKey,
  required String secretKey,
  String baseUrl = "https://sandbox-api.iyzipay.com"
})
