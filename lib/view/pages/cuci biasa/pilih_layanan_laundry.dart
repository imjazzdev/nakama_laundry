import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/cuci%20biasa/pesanan_anda.dart';
import 'package:nakama_laundry/view/widget/container_default.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

class PilihLayananLaundry extends StatefulWidget {
  const PilihLayananLaundry({super.key});

  @override
  State<PilihLayananLaundry> createState() => _PilihLayananLaundryState();
}

class _PilihLayananLaundryState extends State<PilihLayananLaundry> {
  int? _value = 1;
  List data = [
    {'layanan': '', 'harga': 0},
    {'layanan': 'Biasa - cuci setrika (3 hari)', 'harga': 7000},
    {'layanan': 'Express - cuci setrika (1 hari)', 'harga': 12000},
    {'layanan': 'Kilat - cuci setrika (6 jam)', 'harga': 20000},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pilih layanan laundry'),
        ),
        body: Column(
          children: [
            ContainerDefault(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Biasa - cuci setrika (3 hari)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  )
                ],
              ),
            ),
            ContainerDefault(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Express - cuci setrika (1 hari)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  )
                ],
              ),
            ),
            ContainerDefault(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kilat - cuci setrika (6 jam)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Radio(
                    value: 3,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PesananAnda(
                        layanan: data[_value!]['layanan'],
                        harga: data[_value!]['harga']),
                  ));
            },
            child: OkeBottomNav()));
  }
}
