class Buyer {
  String id;
  String name;
  String surname;
  String identityNumber;
  String email;
  String gsmNumber;
  String registrationDate;
  String lastLoginDate;
  String registrationAddress;
  String city;
  String country;
  String zipCode;
  String ip;

  Buyer({
    required this.id,
    required this.name,
    required this.surname,
    required this.identityNumber,
    required this.email,
    required this.gsmNumber,
    required this.registrationDate,
    required this.lastLoginDate,
    required this.registrationAddress,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.ip,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'surname': surname,
        'identityNumber': identityNumber,
        'email': email,
        'gsmNumber': gsmNumber,
        'registrationDate': registrationDate,
        'lastLoginDate': lastLoginDate,
        'registrationAddress': registrationAddress,
        'city': city,
        'country': country,
        'zipCode': zipCode,
        'ip': ip,
      };
}
