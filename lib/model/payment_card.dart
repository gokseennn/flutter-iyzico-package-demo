class PaymentCard {
  String cardHolderName;
  String cardNumber;
  String expireYear;
  String expireMonth;
  String cvc;
  int registerCard;

  PaymentCard({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expireYear,
    required this.expireMonth,
    required this.cvc,
    required this.registerCard,
  });
  Map<String, dynamic> toJson() => {
        'cardHolderName': cardHolderName,
        'cardNumber': cardNumber,
        'expireYear': expireYear,
        'expireMonth': expireMonth,
        'cvc': cvc,
        'registerCard': registerCard,
      };
}
