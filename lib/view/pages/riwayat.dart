import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/cuci%20biasa/pesanan_anda.dart';
import 'package:nakama_laundry/view/pages/pesanan_detail.dart';
import 'package:nakama_laundry/view/widget/container_default.dart';

class Riwayat extends StatelessWidget {
  const Riwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat pesanan'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('order').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
                padding: EdgeInsets.only(top: 20),
                children: snapshot.data!.docs
                    .map((e) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PesananDetail(
                                    layanan: e['layanan'],
                                    harga: e['harga'],
                                    kilogram: e['kilogram'],
                                    tanggal: e['tanggal'],
                                    waktu: e['waktu'],
                                    alamat: e['alamat'],
                                    barang: e['barang'],
                                  ),
                                ));
                          },
                          child: ContainerDefault(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e['layanan'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(e['tanggal'],
                                      style: TextStyle(
                                        fontSize: 15,
                                      ))
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    AwesomeDialog(
                                      context: context,
                                      animType: AnimType.scale,
                                      dialogType: DialogType.warning,
                                      title: 'Yakin ingin menghapus pesanan?',
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {
                                        FirebaseFirestore.instance
                                            .collection('order')
                                            .doc(e['tanggal'])
                                            .delete();
                                      },
                                    ).show();
                                  },
                                  icon: Icon(
                                    Icons.delete_forever,
                                    size: 35,
                                    color: Colors.red,
                                  ))
                            ],
                          )),
                        ))
                    .toList());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
