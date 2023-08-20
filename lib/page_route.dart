import 'package:customer/model/models_product.dart';
import 'package:customer/tampilanDepan/beli/page_beli.dart';
import 'package:customer/tampilanDepan/beli/page_checkout.dart';
import 'package:customer/tampilanDepan/kelola/page_pusatBantuan.dart';
import 'package:customer/tampilanDepan/view_kelola.dart';
import 'package:customer/tampilanDepan/view_keranjang.dart';
import 'package:customer/tampilanDepan/view_tampilanDepan.dart';
import 'package:flutter/material.dart';

class RouteGenerate {
  static Route? generateRoute(RouteSettings route) {
    switch (route.name) {
      case ViewTampilanDepan.routeName:
        return MaterialPageRoute(builder: ((context) => ViewTampilanDepan()));
      case ViewKeranjang.routeName:
        return MaterialPageRoute(builder: ((context) => ViewKeranjang()));
      case ViewKelola.routeName:
        return MaterialPageRoute(builder: ((context) => ViewKelola()));
      case PagePusatBantuan.routeName:
        return MaterialPageRoute(builder: ((context) => PagePusatBantuan()));
      case PageBeli.routeName:
        return MaterialPageRoute(
          builder: ((context) => PageBeli(
                data: route.arguments as ModelProduct,
              )),
        );
      case PageCheckout.routeName:
        return MaterialPageRoute(builder: ((context) => PageCheckout()));
      default:
        return MaterialPageRoute(builder: ((context) => ViewTampilanDepan()));
    }
  }
}
