import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/keranjang/keranjang_detail.dart';
import 'package:nakama_laundry/view/pages/utils/varglobal.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

import '../../widget/container_default.dart';

class Keranjang extends StatelessWidget {
  const Keranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: VarGlobal.list_keranjang.isEmpty
          ? Center(
              child: Text('Belum ada data pesanan'),
            )
          : ListView.builder(
              itemCount: VarGlobal.list_keranjang.length,
              itemBuilder: (context, index) => ContainerDefault(
                height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        VarGlobal.list_keranjang[index]['qty'] == ''
                            ? SizedBox()
                            : Image.asset(
                                'assets/pakaian-${VarGlobal.list_keranjang[index]['barang']}.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          VarGlobal.list_keranjang[index]['barang'],
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    VarGlobal.list_keranjang[index]['qty'] == ''
                        ? ElevatedButton(onPressed: () {}, child: Text('Batal'))
                        : Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.blue),
                                child: IconButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   _valueBantal--;
                                    // });
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
                                child: Text(
                                  VarGlobal.list_keranjang[index]['qty']
                                      .toString(),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.blue),
                                child: IconButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   _valueBantal++;
                                    // });
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
            ),
      bottomNavigationBar: InkWell(
          onTap: () {
            hitungTotalHarga();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KeranjangDetail(),
                ));
          },
          child: OkeBottomNav()),
    );
  }

  void hitungTotalHarga() async {
    for (var i = 0; i < VarGlobal.list_keranjang.length; i++) {
      VarGlobal.total_harga = VarGlobal.total_harga +
          int.parse(VarGlobal.list_keranjang[i]['harga'].toString());
      // print(int.parse(VarGlobal.list_keranjang[i]['harga'].toString()));
    }
  }
}
