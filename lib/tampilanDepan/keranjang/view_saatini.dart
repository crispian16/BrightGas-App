import 'package:customer/main.dart';
import 'package:customer/model/models_product.dart';
import 'package:customer/tampilanDepan/beli/view_checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewSaatini extends StatelessWidget {
  static const routeName = './saatini';

  const ViewSaatini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterItem>(context);
    var seen = Set<ModelProduct>();
    List<ModelProduct> uniqList = provider.listProduct
        .where(((ModelProduct) => seen.add(ModelProduct)))
        .toList();
    if (provider.listProduct.length != 0) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, i) {
                  final data = uniqList[i];
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      data.imageUrl,
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.name,
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI, Semibold',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  Consumer<CounterItem>(
                                    builder: (context, value, child) => Text(
                                      'Rp ${data.price * value.counteritem}',
                                      style: TextStyle(
                                        fontFamily: 'Segoe UI, regular',
                                        fontSize: 14,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data.satuan,
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI, regular',
                                      fontSize: 14,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  provider.remove(data);
                                },
                                icon: const Icon(
                                  Icons.remove_circle_sharp,
                                  color: Color(0xFF8E8E8E),
                                  size: 25,
                                ),
                              ),
                              Consumer<CounterItem>(
                                builder: (context, value, child) => Text(
                                  value.listProduct
                                      .where((element) => element.id == data.id)
                                      .toList()
                                      .length
                                      .toString(),
                                  style: const TextStyle(
                                    fontFamily: 'Segoe UI, Regular',
                                    fontSize: 20,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  provider.add(data);
                                },
                                icon: const Icon(
                                  Icons.add_circle_sharp,
                                  color: Color(0xFFEA609B),
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
                itemCount: uniqList.length,
              ),
            ),
            ViewCheckoutButton(),
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/empty_product_list.png'),
            const SizedBox(height: 10),
            const Text(
              'Keranjang belanja Anda kosong, \nbelanja dulu yuk!',
              style: TextStyle(
                fontFamily: 'Calibri, Regular',
                fontSize: 18,
                color: Color(0xFF000000),
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }
  }
}
