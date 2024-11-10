import 'package:flutter/material.dart';

class CurrencyConverterone extends StatefulWidget {
  const CurrencyConverterone({super.key});

  @override
  State<CurrencyConverterone> createState() => _CurrencyConverteroneState();
}

class _CurrencyConverteroneState extends State<CurrencyConverterone> {
  TextEditingController usdtController = TextEditingController();
  TextEditingController pkrController = TextEditingController();
  double result = 0.0;
  double conversionRate = 277.5; // Example conversion rate (USDT to PKR)

  void convertCurrency() {
    double usdtAmount = double.tryParse(usdtController.text) ?? 0.0;
    setState(() {
      result = usdtAmount * conversionRate;
      pkrController.text = result.toStringAsFixed(2); // Showing result in PKR field
    });
  }

  void clearFields() {
    usdtController.clear();
    pkrController.clear();
    setState(() {
      result = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title:  Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            onPressed: convertCurrency,
            backgroundColor: Colors.blueGrey,
            label:  Text(
              'Convert',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            icon:  Icon(Icons.currency_exchange, color: Colors.white),
          ),
           SizedBox(height: 10),
          FloatingActionButton(
            onPressed: clearFields,
            backgroundColor: Colors.blueGrey,
            child:  Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40,right: 40,top: 40,bottom: 30),
              child: TextFormField(
                controller: usdtController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),


                  hintText: ' USDT',
                  hintStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40,right: 40,top: 40,bottom: 30),

              child: TextFormField(
                controller: pkrController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: ' PKR',
                  hintStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                ),
                enabled: false,
              ),
            ),
             SizedBox(height: 70),
            Text(
              'Result: PKR $result',
              style:  TextStyle(color: Colors.black, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
