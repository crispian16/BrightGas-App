// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/model/models_product.dart';
import 'package:customer/tampilanDepan/beli/page_beli.dart';
import 'package:flutter/material.dart';

class ViewTampilanDepan extends StatefulWidget {
  static const routeName = '/tampilanDepan';
  const ViewTampilanDepan({Key? key}) : super(key: key);

  @override
  State<ViewTampilanDepan> createState() => _ViewTampilanDepanState();
}

class _ViewTampilanDepanState extends State<ViewTampilanDepan> {
  Future<List<ModelProduct>> getProdact() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference item = firestore.collection('product');
    return item.get().then(
          (event) => event.docs.map((e) {
            final data = e.data() as Map<String, dynamic>?;
            if (data == null) {
              return ModelProduct();
            }
            return ModelProduct.fromJson(data);
          }).toList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEA609B),
        elevation: 0,
        actions: <Widget>[
          Image.asset(
            'assets/images/logo.png',
            height: 40,
          ),
          const SizedBox(width: 40),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            color: Colors.white,
            child: Image.asset(
              'assets/images/g1.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<ModelProduct>>(
              future: getProdact(),
              builder: (context, snapshot) {
                final data = snapshot.data;
                if (data == null) {
                  return Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: const CircularProgressIndicator(),
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: _refresh,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.68,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (c, i) {
                      final newdata = data[i];
                      return ItemCard(
                        data: newdata,
                      );
                    },
                    itemCount: data.length,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> _refresh() async {
    getProdact();
    setState(() {});
  }
}

class ItemCard extends StatelessWidget {
  final ModelProduct data;

  const ItemCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          height: 190,
          width: 190,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Colors.white,
            border: Border.all(
              color: Color(0xFF707070),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Image.network(
                data.imageUrl,
                width: 125,
                height: 105,
              ),
              const SizedBox(height: 5),
              Text(
                data.name,
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: 'Segoe UI, Regular',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                'Rp. ${data.price}, ${data.satuan}',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Segoe UI, Regular',
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Diskon ${data.discount}%',
                style: const TextStyle(
                  fontSize: 13,
                  fontFamily: 'Segoe UI, Regular',
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 170,
          height: 30,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Color(0xFFEA609B),
          ),
          child: ButtonTheme(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  PageBeli.routeName,
                  arguments: data,
                );
              },
              child: const Text(
                'Beli',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Calibri, Regular',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
