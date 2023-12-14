import 'package:flutter/material.dart';

class BayarSekarang extends StatelessWidget {
  const BayarSekarang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran melalui Qris'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/barcode.png',
              height: 250,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'silahkan scanbarcode diatas untuk melakukan pembayaran',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text('kirim bukti pembayaran ke nomor ini'),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('083183061080'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 25, 236, 96)),
            )
          ],
        ),
      ),
    );
  }
}
