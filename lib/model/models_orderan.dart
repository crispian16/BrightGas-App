import 'package:customer/model/models_account.dart';
import 'package:customer/model/models_product.dart';

class ModelOrderan {
  final String id;
  final String imageUrl;
  final String status;
  final String tanggal;
  final String waktu;
  final String catatan;
  final String catatanCourier;
  final String metodeBayar;
  final Iterable<ModelProduct> product;
  final ModelAccount account;

  const ModelOrderan({
    this.id = '',
    this.imageUrl = '',
    this.status = '',
    this.tanggal = '',
    this.waktu = '',
    this.catatan = '',
    this.catatanCourier = '',
    this.metodeBayar = '',
    required this.product,
    required this.account,
  });

  factory ModelOrderan.fromJson(Map<String, dynamic> json) {
    return ModelOrderan(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      status: json['status'] as String,
      tanggal: json['tanggal'] as String,
      waktu: json['waktu'] as String,
      catatan: json['catatan'] as String,
      catatanCourier: json['catatan_courier'] as String,
      metodeBayar: json['metode_bayar'] as String,
      product: List.of(json['product']).map((e) {
        return ModelProduct.fromJson(e);
      }),
      account: ModelAccount.fromJson(json['customer']),
    );
  }
}
