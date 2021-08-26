import 'package:flutter/material.dart';

class TargetCurrencyWidget extends StatefulWidget {
  const TargetCurrencyWidget({
    Key? key,
  }) : super(key: key);

  @override
  _TargetCurrencyWidgetState createState() => _TargetCurrencyWidgetState();
}

class _TargetCurrencyWidgetState extends State<TargetCurrencyWidget> {
  String currencyNameValue = 'Peso';
  String codeValue = 'Peso';
  double currencyValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text("\$62.67", style: TextStyle(color: Colors.purple)),
                  Spacer(),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(children: [
                  Text("\$ $codeValue"),
                  Spacer(),
                  DropdownButton<String>(
                    value: currencyNameValue,
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    iconSize: 24,
                    onChanged: (String? newValue) {
                      setState(() {
                        currencyNameValue = newValue!;
                        codeValue = currencyNameValue;
                      });
                    },
                    //TODO: Fetch this from symbols API
                    items: <String>['Euro', 'Peso', 'Dollar']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ]),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
