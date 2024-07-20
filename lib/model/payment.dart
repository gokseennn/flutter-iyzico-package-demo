import 'package:iyzico_payment/model/address.dart';
import 'package:iyzico_payment/model/basket_item.dart';
import 'package:iyzico_payment/model/buyer.dart';
import 'package:iyzico_payment/model/payment_card.dart';

class PaymentRequest {
  String locale;
  String conversationId;
  String price;
  String paidPrice;
  int installment;
  String paymentChannel;
  String basketId;
  String paymentGroup;
  PaymentCard paymentCard;
  Buyer buyer;
  Address shippingAddress;
  Address billingAddress;
  List<BasketItem> basketItems;
  String currency;

  PaymentRequest({
    required this.locale,
    required this.conversationId,
    required this.price,
    required this.paidPrice,
    required this.installment,
    required this.paymentChannel,
    required this.basketId,
    required this.paymentGroup,
    required this.paymentCard,
    required this.buyer,
    required this.shippingAddress,
    required this.billingAddress,
    required this.basketItems,
    required this.currency,
  });
  Map<String, dynamic> toJson() => {
        'locale': locale,
        'conversationId': conversationId,
        'price': price,
        'paidPrice': paidPrice,
        'installment': installment,
        'paymentChannel': paymentChannel,
        'basketId': basketId,
        'paymentGroup': paymentGroup,
        'paymentCard': paymentCard.toJson(),
        'buyer': buyer.toJson(),
        'shippingAddress': shippingAddress.toJson(),
        'billingAddress': billingAddress.toJson(),
        'basketItems': basketItems.map((e) => e.toJson()).toList(),
        'currency': currency,
      };
}
