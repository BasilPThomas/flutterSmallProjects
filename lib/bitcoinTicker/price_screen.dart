import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'cryptoCard.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  DropdownButton<String> androidDropDownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var newITem = DropdownMenuItem(
        child: Text(
          currency,
          style: TextStyle(color: Colors.black),
        ),
        value: currency,
      );
      dropdownItems.add(newITem);
    }
    return DropdownButton(
      dropdownColor: Colors.white,
      iconEnabledColor: Colors.black,
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
        });
        print(value);
      },
    );
  }

  CupertinoPicker iOSDropPicker() {
    List<Text> pickerItems = [];

    for (String crypto in currenciesList) {
      pickerItems.add(Text(
        crypto,
        style: TextStyle(color: Colors.black),
      ));
    }
    return CupertinoPicker(
      itemExtent: 30,
      onSelectedItemChanged: (int value) {
        print(value);
      },
      children: pickerItems,
    );
  }

  void getCryptoList() {
    for (String crypto in cryptoList) {
      print(crypto);
    }
  }

  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Column makeCards() {
    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(
          crypto,
          selectedCurrency,
          isWaiting ? '?' : coinValues[crypto].toString(),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🤑 Coin Ticker',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          makeCards(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.yellow,
            child: Platform.isIOS ? iOSDropPicker() : androidDropDownButton(),
          ),
        ],
      ),
    );
  }
}
