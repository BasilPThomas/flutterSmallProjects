import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency = 'USD';

  DropdownButton<String> androidDropDownButton(){
    List<DropdownMenuItem<String>> dropdownItems = [];

    for(String currency in currenciesList) {
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

    for(String crypto in currenciesList) {
      pickerItems.add(Text(crypto, style: TextStyle(color: Colors.black),));
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
    for(String crypto in cryptoList) {
      print(crypto);
    }
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
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.yellow,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
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
