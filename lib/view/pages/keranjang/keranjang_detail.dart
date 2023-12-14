import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/utils/varglobal.dart';
import 'package:nakama_laundry/view/widget/container_default.dart';

import '../../widget/oke_botom_nav.dart';
import '../cuci biasa/pilih_metode_pembayaran.dart';

class KeranjangDetail extends StatefulWidget {
  @override
  State<KeranjangDetail> createState() => _KeranjangDetailState();
}

class _KeranjangDetailState extends State<KeranjangDetail> {
  // final String layanan, harga, kilogram, tanggal, alamat, waktu;
  TextEditingController tanggal = TextEditingController();
  TextEditingController waktu = TextEditingController();
  TextEditingController alamat = TextEditingController();
  bool clickSimpan = false;

  @override
  Widget build(BuildContext context) {
    print('TOTAL HARGA : ${VarGlobal.total_harga}');
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
                  'Pesanan Satuan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: VarGlobal.list_keranjang.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child:
                              Text(VarGlobal.list_keranjang[index]['barang'])),
                      Expanded(
                          flex: 1,
                          child: Text(VarGlobal.list_keranjang[index]['qty']
                              .toString())),
                      Expanded(
                          flex: 1,
                          child: Text(
                              'Rp ${VarGlobal.list_keranjang[index]['harga'].toString()}')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(thickness: 2),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text('Total Harga : Rp ${VarGlobal.total_harga}')),
              ],
            ),
            decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(10)),
          ),
          InkWell(
            onTap: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.question,
                animType: AnimType.rightSlide,
                title: 'Tanggal & Waktu',
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tanggal',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      SizedBox(
                          height: 40,
                          child: TextField(
                            controller: tanggal,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Waktu',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      SizedBox(
                          height: 40,
                          child: TextField(
                            controller: waktu,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          )),
                    ],
                  ),
                ),
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  setState(() {});
                },
              ).show();
            },
            child: ContainerDefault(
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tanggal.text != ''
                      ? '${tanggal.text} - ${waktu.text}'
                      : 'Tanggal dan waktu pengambilan'),
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: alamat.text != ''
                ? Text('${alamat.text}')
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Masukan alamat anda'),
                      SizedBox(
                          width: 120,
                          child: ElevatedButton(
                              onPressed: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.question,
                                  animType: AnimType.rightSlide,
                                  title: 'Masukan alamat',
                                  body: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Alamat',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        ),
                                        SizedBox(
                                            height: 130,
                                            child: TextField(
                                              maxLines: 5,
                                              controller: alamat,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder()),
                                            )),
                                      ],
                                    ),
                                  ),
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {
                                    setState(() {});
                                  },
                                ).show();
                              },
                              child: const Text('Edit alamat')))
                    ],
                  ),
            decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      )),
      bottomNavigationBar: clickSimpan == false
          ? InkWell(
              onTap: () {
                if (tanggal.text.isEmpty ||
                    waktu.text.isEmpty ||
                    alamat.text.isEmpty) {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.warning,
                    title: 'Mohon lengkapi data',
                    btnOkOnPress: () {},
                  ).show();
                } else {
                  addOrder();
                  setState(() {
                    clickSimpan = true;
                  });
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.success,
                    title: 'Order Disimpan',
                    btnOkOnPress: () {},
                  ).show();
                }
              },
              child: OkeBottomNav(txt: 'Simpan'))
          : InkWell(
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

  Future addOrder() async {
    final doc =
        FirebaseFirestore.instance.collection('order').doc('${tanggal.text}');
    final order = Order(
        layanan: 'Pakaian Satuan',
        harga: VarGlobal.total_harga.toString(),
        kilogram: '',
        barang: VarGlobal.list_keranjang,
        tanggal: tanggal.text,
        waktu: waktu.text,
        alamat: alamat.text,
        user: VarGlobal.USER_NOW);
    final json = order.toJson();
    await doc.set(json);
  }
}

class Order {
  final String layanan, harga, kilogram, tanggal, waktu, alamat, user;
  final List barang;

  Order(
      {required this.layanan,
      required this.harga,
      required this.kilogram,
      required this.barang,
      required this.tanggal,
      required this.waktu,
      required this.alamat,
      required this.user});

  Map<String, dynamic> toJson() => {
        'layanan': layanan,
        'harga': harga,
        'kilogram': kilogram,
        'barang': barang,
        'tanggal': tanggal,
        'waktu': waktu,
        'user': user,
        'alamat': alamat
      };
}
