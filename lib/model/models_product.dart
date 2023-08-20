class ModelProduct {
  final String id;
  final String name;
  final int price;
  final int discount;
  final String imageUrl;
  final String satuan;
  final String kategori;
  final String deskripsi;

  const ModelProduct({
    this.id = '',
    this.name = '',
    this.price = 0,
    this.discount = 0,
    this.imageUrl = '',
    this.satuan = '',
    this.kategori = '',
    this.deskripsi = '',
  });

  factory ModelProduct.fromJson(Map<String, dynamic> json) {
    return ModelProduct(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      discount: json['discount'] as int,
      imageUrl: json['imageUrl'] as String,
      satuan: json['satuan'] as String,
      kategori: json['kategori'] as String,
      deskripsi: json['deskripsi'] as String,
    );
  }
}
