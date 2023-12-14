import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/harga/harga_kiloan.dart';
import 'package:nakama_laundry/view/pages/harga/harga_satuan.dart';

import 'package:nakama_laundry/view/widget/container_default.dart';

import '../cuci biasa/bayar_nanti.dart';
import '../cuci biasa/bayar_sekarang.dart';

class Harga extends StatelessWidget {
  const Harga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar harga laundry'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ContainerDefault(
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daftar harga cuci kiloan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HargaKiloan(),
                            ));
                      },
                      child: Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
            ),
            ContainerDefault(
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daftar harga cuci satuan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HargaSatuan(),
                            ));
                      },
                      child: Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
