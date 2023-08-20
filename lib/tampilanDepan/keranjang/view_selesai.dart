import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/model/models_account.dart';
import 'package:customer/model/models_orderan.dart';
import 'package:customer/model/models_product.dart';
import 'package:flutter/material.dart';

class ViewSelesai extends StatefulWidget {
  static const routeName = '/selesai';

  const ViewSelesai({Key? key}) : super(key: key);

  @override
  State<ViewSelesai> createState() => _ViewSelesaiState();
}

class _ViewSelesaiState extends State<ViewSelesai> {
  Future<List<ModelOrderan>> getOrder() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference orderan = firestore.collection('orderan');
    return orderan.get().then((event) {
      return event.docs.map(
        (e) {
          final Map<String, dynamic>? data = e.data() as Map<String, dynamic>;
          if (data == null) {
            return ModelOrderan(
              product: [ModelProduct()],
              account: ModelAccount(),
            );
          }
          return ModelOrderan.fromJson(data);
        },
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: FutureBuilder<List<ModelOrderan>>(
            future: getOrder(),
            builder: (_, snapshot) {
              final data = snapshot.data;
              log(data.toString());
              if (data != null && snapshot.hasData) {
                return RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final datas = data[index];
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                datas.tanggal,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Segoe UI, Regular',
                                ),
                              ),
                              Text(
                                datas.status,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Segoe UI, Regular',
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          for (final product in datas.product)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(
                                  product.imageUrl,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Bright Gas 12 Kg',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Segoe UI, Regular',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Rp 140.000/Tabung',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Segoe UI, Regular',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Jumlah',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Segoe UI, Regular',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '1',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Segoe UI, Regular',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Total Belanja',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Segoe UI, Regular',
                                ),
                              ),
                              Text(
                                '140.000',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Segoe UI, Regular',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Diskon',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Segoe UI, Regular',
                                ),
                              ),
                              Text(
                                '0%',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Segoe UI, Regular',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Text(
                                'PPN 0%',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Segoe UI, Regular',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Total Pembayaran',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Segoe UI, Regular',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFEA609B),
                                ),
                              ),
                              Text(
                                'Rp 140.000',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Segoe UI, Regular',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFEA609B),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ButtonTheme(
                            minWidth: 150,
                            height: 30,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFEA609B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Pesan Kembali',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Calibri, Regular',
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Divider(
                            height: 1,
                            color: Color.fromARGB(255, 161, 161, 161),
                          ),
                        ],
                      );
                    },
                    itemCount: data.length,
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future<void> _refresh() async {
    getOrder();
    setState(() {});
  }
}
