// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/main.dart';
import 'package:customer/model/models_account.dart';
import 'package:customer/model/models_product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class PageCheckout extends StatefulWidget {
  static const routeName = '/Pagecheckout';

  const PageCheckout({Key? key}) : super(key: key);

  @override
  State<PageCheckout> createState() => _PageCheckoutState();
}

class _PageCheckoutState extends State<PageCheckout> {
  Future uploadData(
      ModelAccount providerAccount, CounterItem providerProduct) async {
    final location = await Location.instance.getLocation();
    final List<ModelProduct> product =
        Provider.of<CounterItem>(context, listen: false).listProduct;
    FirebaseFirestore.instance.collection('orderan').add({
      'catatan_courier': '',
      'product': FieldValue.arrayUnion(product
          .map((e) => {
                'id': e.id,
                'name': e.name,
                'price': e.price,
                'satuan': e.satuan,
                'imageUrl': e.imageUrl,
                'discount': e.discount,
                'deskripsi': e.deskripsi,
                'kategori': e.kategori,
              })
          .toList()),
      'imageUrl': '',
      'metode_bayar': '',
      'customer': {
        'id': providerAccount.id,
        'name': providerAccount.name,
        'phoneNumber': providerAccount.phoneNumber,
        'imageUrl': providerAccount.imageUrl,
        'Address': providerAccount.address,
        'city': providerAccount.city,
        'location': {
          'lat': location.latitude,
          'lng': location.longitude,
        }
      },
      'catatan': 'adfagfaga',
      'status': 'Belum Dibayar',
      'tanggal': DateFormat('dd-MM-yyyy').format(DateTime.now()),
      'waktu': DateFormat('HH:mm').format(DateTime.now()),
    });
  }

  @override
  Widget build(BuildContext context) {
    var metodePembayaran;
    DateTime tanggalPengantaran = DateTime.now();
    TimeOfDay waktuPengantaran = TimeOfDay.now();
    final listProduct = Provider.of<CounterItem>(context).listProduct;
    TextEditingController catatanController = TextEditingController();
    final harga = listProduct.map((e) => e.price).reduce((a, b) => a + b);
    final diskon = listProduct.map((e) => e.discount).reduce((a, b) => a + b);
    const ppn = 0;
    final providerAccount = Provider.of<ModelAccount>(context);
    final providerProduct = Provider.of<CounterItem>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 1,
        iconTheme: const IconThemeData(color: Color(0xFF000000)),
        centerTitle: true,
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontFamily: 'Segoe UI, Semibold',
            fontSize: 20,
            color: Color(0xFF000000),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Alamat Pengantaran Anda',
                    style: TextStyle(
                      fontFamily: 'Segoe UI, Semibold',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Jl. Raya Cikarang No.1, Cikarang Utara, Cikarang Barat, Kota Cikarang, Bekasi, Jawa Barat 17550',
                          style: TextStyle(
                            fontFamily: 'Segoe UI, Regular',
                            fontSize: 14,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.create_outlined,
                          color: Color(0xFF707070),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Jadwal Pengantaran',
                    style: TextStyle(
                      fontFamily: 'Segoe UI, Semibold',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 160,
                        height: 30,
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xFF707070),
                            width: 1,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: tanggalPengantaran,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2025),
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  tanggalPengantaran = value;
                                });
                              }
                            });
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: Color(0xFF707070),
                                size: 14,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                DateFormat('dd MMMM yyyy')
                                    .format(tanggalPengantaran)
                                    .toString(),
                                style: const TextStyle(
                                  fontFamily: 'Segoe UI, Regular',
                                  fontSize: 14,
                                  color: Color(0xFF707070),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 160,
                        height: 30,
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xFF707070),
                            width: 1,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: waktuPengantaran,
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  waktuPengantaran = value;
                                });
                              }
                            });
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.access_time,
                                color: Color(0xFF707070),
                                size: 14,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                waktuPengantaran.format(context),
                                style: const TextStyle(
                                  fontFamily: 'Segoe UI, Regular',
                                  fontSize: 14,
                                  color: Color(0xFF707070),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Tambahkan Catatan',
                    style: TextStyle(
                      fontFamily: 'Segoe UI, Semibold',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontFamily: 'Segoe UI, Regular',
                              fontSize: 14,
                              color: Color(0xFF707070),
                            ),
                            border: InputBorder.none,
                          ),
                          controller: catatanController,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.create_outlined,
                          color: Color(0xFF707070),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color(0xFF707070),
                    height: 1,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Rincian Pembayaran',
                    style: TextStyle(
                      fontFamily: 'Segoe UI, Semibold',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Total Belanja',
                          style: TextStyle(
                            fontFamily: 'Segoe UI, Regular',
                            fontSize: 14,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      Text(
                        'Rp. $harga',
                        style: const TextStyle(
                          fontFamily: 'Segoe UI, Regular',
                          fontSize: 14,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Diskon',
                          style: TextStyle(
                            fontFamily: 'Segoe UI, Regular',
                            fontSize: 14,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      Text(
                        '$diskon %',
                        style: const TextStyle(
                          fontFamily: 'Segoe UI, Regular',
                          fontSize: 14,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'PPN',
                          style: TextStyle(
                            fontFamily: 'Segoe UI, Regular',
                            fontSize: 14,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      Text(
                        '- $ppn',
                        style: TextStyle(
                          fontFamily: 'Segoe UI, Regular',
                          fontSize: 14,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Total Pembayaran',
                          style: TextStyle(
                            fontFamily: 'Segoe UI, Regular',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFEA609B),
                          ),
                        ),
                      ),
                      Text(
                        'Rp. ${harga - (harga * diskon / 100)}',
                        style: const TextStyle(
                          fontFamily: 'Segoe UI, Regular',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFEA609B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Color(0xFF707070),
                    height: 1,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Pilih Metode Pembayaran',
                    style: TextStyle(
                      fontFamily: 'Segoe UI, Semibold',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'TRANSFER (bayar sekarang)',
                          style: TextStyle(
                            fontFamily: 'Segoe UI, Regular',
                            fontSize: 14,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      Radio(
                        value: 1,
                        groupValue: metodePembayaran,
                        onChanged: (value) {
                          setState(() {
                            metodePembayaran = value;
                          });
                        },
                        activeColor: const Color(0xFFEA609B),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'COD (bayar saat barang tiba)',
                          style: TextStyle(
                            fontFamily: 'Segoe UI, Regular',
                            fontSize: 14,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      Radio(
                        value: 2,
                        groupValue: metodePembayaran,
                        onChanged: (value) {
                          setState(() {
                            metodePembayaran = value;
                          });
                        },
                        activeColor: const Color(0xFFEA609B),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 195,
              child: ElevatedButton(
                onPressed: () {
                  uploadData(providerAccount, providerProduct);

                  // Navigator.of(context).pushNamed(
                  //   MainMenu.routeName,
                  // );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFEA609B),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                    ),
                  ),
                  minimumSize: const Size(195, 45),
                ),
                child: const Text(
                  'Proses',
                  style: TextStyle(
                    fontFamily: 'Segoe UI, Regular',
                    fontSize: 18,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
