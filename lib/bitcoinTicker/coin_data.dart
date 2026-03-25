import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [ 'BTC', 'ETH', 'LTC',];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '54953b62-27bb-4dd7-b1e9-33744072dd03';

class CoinData {
  Future<Map<String, String>> getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      final url = Uri.parse('$coinAPIURL/$crypto/$selectedCurrency');

      final response = await http.get(
        url,
        headers: {
          'X-CoinAPI-Key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];

        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw Exception('Problem with the get request');
      }
    }

    return cryptoPrices;
  }
}