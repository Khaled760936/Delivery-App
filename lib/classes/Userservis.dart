class UserService {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String location;
  final String profilePicture;

  UserService({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.location,
    required this.profilePicture,
  });

  factory UserService.fromJson(Map<String, dynamic> json) {
    return UserService(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      location: json['location'],
      profilePicture: json['profile_picture'],
    );
  }
}
