<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iyzico_payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            margin: 20px;
        }
        h1, h2, h3 {
            color: #007bff;
        }
        code {
            background-color: #f8f9fa;
            border-radius: 3px;
            padding: 2px 4px;
            font-size: 0.9em;
        }
        pre {
            background-color: #f8f9fa;
            border: 1px solid #e1e1e1;
            border-radius: 3px;
            padding: 10px;
            overflow: auto;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>iyzico_payment</h1>
    <p><code>iyzico_payment</code>, Flutter uygulamalarınızda Non-3DS ödeme işlemlerini gerçekleştirmek için kullanılan bir Dart kütüphanesidir. Bu kütüphane, iyzico API'si ile entegrasyon sağlayarak ödeme işlemlerini kolaylaştırır.</p>

    <h2>Özellikler</h2>
    <ul>
        <li>Non-3DS ödeme işlemleri</li>
        <li>Kolay entegrasyon</li>
        <li>Güvenli ödeme işlemleri</li>
    </ul>

    <h2>Kurulum</h2>
    <p><code>iyzico_payment</code> kütüphanesini projenize eklemek için aşağıdaki adımları izleyin:</p>
    <ol>
        <li><p><code>pubspec.yaml</code> dosyanıza ekleyin:</p>
            <pre><code>dependencies:
  iyzico_payment:
    git:
      url: https://github.com/your-repo-link.git
</code></pre>
        </li>
        <li><p>Gerekli paketleri yüklemek için terminalde aşağıdaki komutu çalıştırın:</p>
            <pre><code>flutter pub get
</code></pre>
        </li>
    </ol>

    <h2>Kullanım</h2>
    <p><code>iyzico_payment</code> kütüphanesini kullanarak ödeme işlemi gerçekleştirmek için aşağıdaki adımları izleyin:</p>

    <h3>Adım 1: Gerekli İthalatlar</h3>
    <p>Öncelikle, gerekli paketleri ve sınıfları projenize dahil edin:</p>
    <pre><code>import 'package:iyzico_payment/iyzico_payment.dart';
import 'package:iyzico_payment/model/payment.dart';
</code></pre>

    <h3>Adım 2: Ödeme İsteği Oluşturma</h3>
    <p>Bir ödeme isteği oluşturmak için <code>PaymentRequest</code> sınıfını kullanın:</p>
    <pre><code>PaymentRequest paymentRequest = PaymentRequest(
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
</code></pre>

    <h3>Adım 3: Ödeme İşlemi Gerçekleştirme</h3>
    <p>Ödeme işlemini gerçekleştirmek için <code>IyzicoPayment</code> sınıfını kullanın:</p>
    <pre><code>IyzicoPayment iyzicoPayment = IyzicoPayment(
  apiKey: "your_api_key",
  secretKey: "your_secret_key",
);

try {
  var response = await iyzicoPayment.createPayment(paymentRequest);
  print("Ödeme başarılı: ${response.body}");
} catch (e) {
  print("Ödeme başarısız: $e");
}
</code></pre>

    <h2>Desteklenen Platformlar</h2>
    <p>Bu kütüphane yalnızca Non-3DS ödeme işlemleri için kullanılabilir.</p>

    <h2>Katkıda Bulunma</h2>
    <p>Katkıda bulunmak isterseniz, lütfen bir pull request gönderin veya bir sorun bildirin.</p>

    <h2>Lisans</h2>
    <p>Bu proje MIT lisansı ile lisanslanmıştır. Daha fazla bilgi için <a href="LICENSE">LICENSE</a> dosyasına bakın.</p>
</body>
</html>
