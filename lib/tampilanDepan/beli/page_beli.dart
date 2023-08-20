import 'package:badges/badges.dart' as badges;
import 'package:customer/main.dart';
import 'package:customer/model/models_product.dart';
import 'package:customer/tampilanDepan/beli/view_checkout_button.dart';
import 'package:customer/tampilanDepan/view_keranjang.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageBeli extends StatefulWidget {
  static const routeName = '/beli';
  const PageBeli({Key? key, required this.data}) : super(key: key);

  final ModelProduct data;

  @override
  State<PageBeli> createState() {
    return _PageBeliState();
  }
}

class _PageBeliState extends State<PageBeli> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterItem>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 1,
        iconTheme: const IconThemeData(color: Color(0xFF000000)),
        centerTitle: true,
        title: const Text(
          'Rincian Produk',
          style: TextStyle(
            fontFamily: 'Segoe UI, Semibold',
            fontSize: 20,
            color: Color(0xFF000000),
          ),
        ),
        actions: <Widget>[
          badges.Badge(
            position: badges.BadgePosition(top: 0, end: 0),
            badgeContent: Text(provider.listProduct.length.toString()),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xFF000000),
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ViewKeranjang.routeName,
                );
              },
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.data.imageUrl,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 76,
                          height: 76,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAECEF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            'assets/images/logo2.png',
                          ),
                        ),
                        const SizedBox(width: 18),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data.name,
                              style: const TextStyle(
                                fontFamily: 'Segoe UI, Semibold',
                                fontSize: 18,
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Rp. ${widget.data.price}',
                              style: const TextStyle(
                                fontFamily: 'Segoe UI, Semibold',
                                fontSize: 16,
                                color: Color(0xFF000000),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              widget.data.satuan,
                              style: const TextStyle(
                                fontFamily: 'Segoe UI, Semibold',
                                fontSize: 16,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Kategori',
                      style: TextStyle(
                        fontFamily: 'Segoe UI, Semibold',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.data.satuan,
                      style: const TextStyle(
                        fontFamily: 'Segoe UI, Regular',
                        fontSize: 14,
                        color: Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontFamily: 'Segoe UI, Semibold',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.data.deskripsi,
                      style: const TextStyle(
                        fontFamily: 'Segoe UI, Regular',
                        fontSize: 14,
                        color: Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            provider.remove(widget.data);
                          },
                          icon: const Icon(
                            Icons.remove_circle_sharp,
                            color: Color(0xFF8E8E8E),
                            size: 30,
                          ),
                        ),
                        Consumer<CounterItem>(
                          builder: (context, value, child) => Text(
                            value.listProduct
                                .where(
                                    (element) => element.id == widget.data.id)
                                .length
                                .toString(),
                            style: const TextStyle(
                              fontFamily: 'Segoe UI, Regular',
                              fontSize: 22,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            provider.add(widget.data);
                          },
                          icon: const Icon(
                            Icons.add_circle_sharp,
                            color: Color(0xFFEA609B),
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ViewCheckoutButton(),
        ],
      ),
    );
  }
}
