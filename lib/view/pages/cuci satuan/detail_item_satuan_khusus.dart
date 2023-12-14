import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:nakama_laundry/view/widget/container_default.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

import '../../widget/main_navigator.dart';
import '../home.dart';
import '../utils/varglobal.dart';

class DetailItemSatuanKhusus extends StatefulWidget {
  const DetailItemSatuanKhusus({super.key});

  @override
  State<DetailItemSatuanKhusus> createState() => _DetailItemSatuanKhususState();
}

class _DetailItemSatuanKhususState extends State<DetailItemSatuanKhusus> {
  int _valueJaket = 0;
  int _valueJas = 0;
  int _valueGaun = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail item satuan khusus'),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/pakaian-Jaket.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Jaket',
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
                              _valueJaket--;
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
                        child: Text(_valueJaket.toString()),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueJaket++;
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/pakaian-Jas.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Jas',
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
                              _valueJas--;
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
                        child: Text(_valueJas.toString()),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueJas++;
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/pakaian-Gaun.png'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Gaun',
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
                              _valueGaun--;
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
                        child: Text(_valueGaun.toString()),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _valueGaun++;
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
            if (_valueJaket != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Jaket',
                'qty': _valueJaket,
                'harga': (_valueJaket * 18000)
              });
            }
            if (_valueJas != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Jas',
                'qty': _valueJas,
                'harga': (_valueJas * 20000)
              });
            }
            if (_valueGaun != 0) {
              VarGlobal.list_keranjang.add({
                'barang': 'Gaun',
                'qty': _valueGaun,
                'harga': (_valueGaun * 22000)
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
