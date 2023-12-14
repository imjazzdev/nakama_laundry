import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/cuci%20biasa/pilih_layanan_laundry.dart';
import 'package:nakama_laundry/view/pages/cuci%20satuan/pilih_satuan_laundry.dart';
import 'package:nakama_laundry/view/pages/keranjang/keranjang.dart';
import 'package:nakama_laundry/view/pages/utils/varglobal.dart';
import 'package:nakama_laundry/view/widget/carousel_banner.dart';

import 'harga/harga.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    VarGlobal.USER_NOW = 'suriyani050423@gmail.com';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, Suri!'),
        actions: [
          InkWell(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.rightSlide,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Membutuhkan bantuan? jangan ragu untuk menghubungi kami jika Anda memiliki pertanyaan',
                        textAlign: TextAlign.center,
                      ),
                      Divider(),
                      Text(
                        '083183061080',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      )
                    ],
                  ),
                  btnOkOnPress: () {},
                ).show();
              },
              child: Image.asset('assets/call-center.png')),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Keranjang(),
                    ));
              },
              child: Image.asset('assets/keranjang.png')),
        ],
      ),
      body: ListView(padding: EdgeInsets.only(bottom: 20), children: [
        CarouselBanner(),
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'Layanan Kami',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PilihLayananLaundry(),
                    ));
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/cuci-kiloan.png',
                      height: 90,
                    ),
                    Text(
                      'Cuci Biasa',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PilihSatuanLaundry(),
                    ));
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/cuci-satuan.png',
                      height: 90,
                    ),
                    Text(
                      'Cuci Satuan',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Harga(),
                    ));
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/harga.png',
                      height: 90,
                    ),
                    Text(
                      'Harga',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
