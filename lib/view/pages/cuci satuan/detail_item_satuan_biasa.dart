import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/home.dart';
import 'package:nakama_laundry/view/pages/utils/varglobal.dart';

import 'package:nakama_laundry/view/widget/container_default.dart';
import 'package:nakama_laundry/view/widget/main_navigator.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

class DetailItemSatuanBiasa extends StatefulWidget {
  const DetailItemSatuanBiasa({super.key});

  @override
  State<DetailItemSatuanBiasa> createState() => _DetailItemSatuanBiasaState();
}

class _DetailItemSatuanBiasaState extends State<DetailItemSatuanBiasa> {
  int _valueKaos = 0;
  int _valueCelana = 0;
  int _valueRok = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail item satuan biasa'),
        actions: [
          Image.asset(
            'assets/keranjang.png',
          )
        ],
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
                  Row(
                    children: [
                      Image.asset('assets/pakaian-Kaos.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Kaos',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueKaos--;
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Text(_valueKaos.toString()),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueKaos++;
                              print(_valueKaos);
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ContainerDefault(
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/pakaian-Celana.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Celana',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueCelana--;
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Text(_valueCelana.toString()),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueCelana++;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ContainerDefault(
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/pakaian-Rok.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Rok',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueRok--;
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 30,
                        color: Colors.white,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Text(_valueRok.toString()),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueRok++;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
          onTap: () {
            if (_valueKaos != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Kaos',
                'qty': _valueKaos,
                'harga': (_valueKaos * 8000)
              });
            }
            if (_valueCelana != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Celana',
                'qty': _valueCelana,
                'harga': (_valueCelana * 8000)
              });
            }
            if (_valueRok != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Rok',
                'qty': _valueRok,
                'harga': (_valueRok * 8000)
              });
            }
            AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              title: 'Berhasil memasukan ke keranjang',
              btnOkOnPress: () {
                Navigator.pop(context);
              },
            ).show();
            print(VarGlobal.list_keranjang);
          },
          child: OkeBottomNav(
            txt: 'Masuk Keranjang',
          )),
    );
  }
}
