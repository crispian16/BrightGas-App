import 'package:customer/main.dart';
import 'package:customer/tampilanDepan/beli/page_checkout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewCheckoutButton extends StatelessWidget {
  const ViewCheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Column(
        children: [
          Spacer(),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    PageCheckout.routeName,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEA609B),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                    ),
                  ),
                  minimumSize: const Size(195, 45),
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    fontFamily: 'Segoe UI, Regular',
                    fontSize: 18,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              const SizedBox(width: 55),
              Consumer<CounterItem>(
                builder: (context, value, child) {
                  final data = value.listProduct.isEmpty
                      ? 0
                      : value.listProduct
                          .map((e) => e.price)
                          .reduce((a, b) => a + b);
                  return Text(
                    'Rp$data',
                    style: const TextStyle(
                      fontFamily: 'Segoe UI, Semibold',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
