import 'package:flutter/material.dart';

class BayarNanti extends StatelessWidget {
  const BayarNanti({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/success.png',
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Silahkan bayar pada saat mengambil pakaian atau pakaian diantar',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
