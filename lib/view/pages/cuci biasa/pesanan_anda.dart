import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/cuci%20biasa/pilih_metode_pembayaran.dart';
import 'package:nakama_laundry/view/widget/container_default.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

import '../utils/varglobal.dart';

class PesananAnda extends StatefulWidget {
  final String layanan;
  final int harga;
  PesananAnda({required this.layanan, required this.harga});

  @override
  State<PesananAnda> createState() => _PesananAndaState();
}

class _PesananAndaState extends State<PesananAnda> {
  TextEditingController tanggal = TextEditingController();
  TextEditingController waktu = TextEditingController();
  TextEditingController alamat = TextEditingController();
  int kilogram = 1;
  bool clickSimpan = false;

  @override
  void initState() {
    VarGlobal.harga = widget.harga;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('LAYANAN : ${widget.layanan}');
    print('HARGA : ${VarGlobal.harga}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan anda'),
      ),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        ContainerDefault(
            height: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.layanan,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Total Harga : Rp ${VarGlobal.harga}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Kg',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          kilogram--;
                          VarGlobal.harga = VarGlobal.harga - widget.harga;
                        });
                      },
                      child: const Icon(
                        Icons.remove,
                        size: 25,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 50,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: Text(kilogram.toString()),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          kilogram++;
                          VarGlobal.harga = VarGlobal.harga + widget.harga;
                        });
                      },
                      child: const Icon(
                        Icons.add,
                        size: 25,
                      ),
                    )
                  ],
                )
              ],
            )),
        const SizedBox(
          height: 20,
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
        const SizedBox(
          height: 20,
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          alignment: Alignment.centerLeft,
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          height: 120,
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
      ]),
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
        layanan: widget.layanan,
        harga: VarGlobal.harga.toString(),
        kilogram: kilogram.toString(),
        barang: [],
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
