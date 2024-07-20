library iyzico_payment;

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:http/http.dart';
import 'package:iyzico_payment/model/payment.dart';

class IyzicoPayment {
  final String apiKey;
  final String secretKey;
  String baseUrl;
  late String authorization;
  late String xIyziRnd;

  IyzicoPayment(
      {required this.apiKey,
      required this.secretKey,
      this.baseUrl = "https://sandbox-api.iyzipay.com"});

  Future<Response> createPayment(PaymentRequest paymentRequest) async {
    final url = Uri.parse("$baseUrl/payment/auth");
    var request = paymentRequest.toJson();
    xIyziRnd = generateRandomString(8);
    authorization = generateAuthorizationString(request, xIyziRnd);

    try {
      // POST
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(request),
      );

      // Response checking
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed $response');
      }
    } catch (e) {
      throw Exception('Failed $e');
    }
  }

  String generateAuthorizationString(
      Map<String, dynamic> obj, String xIyziRnd) {
    String requestString = generateRequestString(obj);
    String hashInput = apiKey + xIyziRnd + secretKey + requestString;
    var bytes = utf8.encode(hashInput);
    var digest = sha1.convert(bytes);
    String hashInBase64 = base64.encode(digest.bytes);
    return "IYZWS $apiKey:$hashInBase64";
  }

  String generateRequestString(dynamic obj) {
    bool isArray = obj is List;
    String requestString = '[';

    if (isArray) {
      for (var i = 0; i < (obj).length; i++) {
        var val = obj[i];
        if (val is Map || val is List) {
          requestString += generateRequestString(val);
        } else {
          requestString += val.toString();
        }
        requestString += i < obj.length - 1 ? ', ' : '';
      }
    } else if (obj is Map) {
      obj.forEach((key, val) {
        requestString += '$key=';
        if (val is Map || val is List) {
          requestString += generateRequestString(val);
        } else {
          requestString += val.toString();
        }
        requestString += ',';
      });
      if (requestString.endsWith(',')) {
        requestString = requestString.substring(0, requestString.length - 1);
      }
    }

    requestString += ']';
    return requestString;
  }

  //Generate "x-iyzi-rnd"
  String generateRandomString(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  get headers => {
        'Content-Type': 'application/json',
        'Authorization': authorization,
        'x-iyzi-rnd': xIyziRnd,
      };
}
