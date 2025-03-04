class UserModel {
  final String id;
  final String name;
  final String email;
  final String contact;
  final String location;
  final String categoryId;
  final double cashBalance;
  final double goldBalance;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.contact,
    required this.location,
    required this.categoryId,
    required this.cashBalance,
    required this.goldBalance,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      contact: json['contact'].toString(),
      location: json['location'],
      categoryId: json['categoryId'],
      cashBalance: json['cashBalance'].toDouble(),
      goldBalance: json['goldBalance'].toDouble(),
    );
  }
}