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
```
## Kullanım
```import 'package:iyzico_payment/iyzico_payment.dart';

void main() async {
  final iyzicoPayment = IyzicoPayment(
    apiKey: 'YOUR_API_KEY',
    secretKey: 'YOUR_SECRET_KEY',
  );
```
```
PaymentRequest paymentRequest = PaymentRequest(
  locale: "tr",
  conversationId: "123456789",
  price: "1.0",
  paidPrice: "1.2",
  currency: "TRY",
  installment: 1,
  basketId: "B67832",
  paymentChannel: "WEB",
  paymentGroup: "PRODUCT",
  paymentCard: PaymentCard(
    cardHolderName: "John Doe",
    cardNumber: "5528790000000008",
    expireMonth: "12",
    expireYear: "2030",
    cvc: "123",
    registerCard: 0,
  ),
  buyer: Buyer(
    id: "BY789",
    name: "John",
    surname: "Doe",
    gsmNumber: "+905350000000",
    email: "john.doe@example.com",
    identityNumber: "74300864791",
    lastLoginDate: "2015-10-05 12:43:35",
    registrationDate: "2013-04-21 15:12:09",
    registrationAddress: "Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1",
    ip: "85.34.78.112",
    city: "Istanbul",
    country: "Turkey",
    zipCode: "34732",
  ),
  shippingAddress: Address(
    contactName: "Jane Doe",
    city: "Istanbul",
    country: "Turkey",
    description: "Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1",
  ),
  billingAddress: Address(
    contactName: "Jane Doe",
    city: "Istanbul",
    country: "Turkey",
    description: "Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1",
  ),
  basketItems: [
    BasketItem(
      id: "BI101",
      name: "Binocular",
      category1: "Collectibles",
      category2: "Accessories",
      itemType: "PHYSICAL",
      price: "0.3",
    ),
    BasketItem(
      id: "BI102",
      name: "Game code",
      category1: "Game",
      category2: "Online Game Items",
      itemType: "VIRTUAL",
      price: "0.5",
    ),
    BasketItem(
      id: "BI103",
      name: "Usb",
      category1: "Electronics",
      category2: "Usb / Cable",
      itemType: "PHYSICAL",
      price: "0.2",
    ),
  ],
);
```
``` try {
  var response = await iyzicoPayment.createPayment(paymentRequest);
  print("Ödeme başarılı: ${response.body}");
} catch (e) {
  print("Ödeme başarısız: $e");
}
```

