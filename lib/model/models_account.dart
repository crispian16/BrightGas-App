class ModelAccount {
  final String id;
  final String name;
  final String phoneNumber;
  final String imageUrl;
  final String address;
  final String city;

  ModelAccount({
    this.id = '',
    this.name = '',
    this.phoneNumber = '',
    this.imageUrl = '',
    this.address = '',
    this.city = '',
  });

  factory ModelAccount.fromJson(Map<String, dynamic> json) {
    return ModelAccount(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      imageUrl: json['imageUrl'] as String,
      address: json['Address'] as String,
      city: json['city'] as String,
    );
  }
}
