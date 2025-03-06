class UserProfile {
  final String id;
  final String userName;
  final String companyName;
  final String address;
  final String email;
  final int contact;
  final int whatsapp;
  
  UserProfile({
    required this.id,
    required this.userName,
    required this.companyName,
    required this.address,
    required this.email,
    required this.contact,
    required this.whatsapp,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id']?.toString() ?? '',
      userName: json['userName']?.toString() ?? '',
      companyName: json['companyName']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      contact: int.tryParse(json['contact']?.toString() ?? '0') ?? 0,
      whatsapp: int.tryParse(json['whatsapp']?.toString() ?? '0') ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userName': userName,
      'companyName': companyName,
      'address': address,
      'email': email,
      'contact': contact,
      'whatsapp': whatsapp,
    };
  }
}

class UserProfileResponse {
  final bool success;
  final UserProfile? user;
  final String message;

  UserProfileResponse({
    required this.success,
    this.user,
    required this.message,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    // The API returns user info in 'info' field, not 'user'
    final userJson = json['info'];
    UserProfile? userProfile;
    
    if (userJson is Map<String, dynamic>) {
      userProfile = UserProfile.fromJson(userJson);
    }
    
    return UserProfileResponse(
      success: json['success'] == true,
      user: userProfile,
      message: json['message']?.toString() ?? '',
    );
  }
}