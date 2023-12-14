import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/widget/container_default.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

import 'cuci biasa/pilih_metode_pembayaran.dart';

class PesananDetail extends StatelessWidget {
  final String layanan, harga, kilogram, tanggal, alamat, waktu;
  final List barang;

  const PesananDetail(
      {super.key,
      required this.layanan,
      required this.harga,
      required this.kilogram,
      required this.tanggal,
      required this.waktu,
      required this.barang,
      required this.alamat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan anda'),
      ),
      body: SizedBox(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  layanan,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: barang.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(flex: 2, child: Text(barang[index]['barang'])),
                      Expanded(
                          flex: 1,
                          child: Text(barang[index]['qty'].toString())),
                      Expanded(
                          flex: 1,
                          child: Text(barang[index]['harga'].toString())),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                Text('Total Harga : Rp ${harga}'),
                Text('${kilogram} kg'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                Text('${tanggal} - ${waktu}'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                Text(
                  '${alamat}',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      )),
      bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PilihMetodePembayaran(),
                ));
          },
          child: OkeBottomNav(txt: 'Bayar')),
    );
  }
}
