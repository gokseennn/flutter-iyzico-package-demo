class Address {
  String address;
  String zipCode;
  String contactName;
  String city;
  String country;

  Address({
    required this.address,
    required this.zipCode,
    required this.contactName,
    required this.city,
    required this.country,
  });
  Map<String, dynamic> toJson() => {
        'address': address,
        'zipCode': zipCode,
        'contactName': contactName,
        'city': city,
        'country': country,
      };
}
