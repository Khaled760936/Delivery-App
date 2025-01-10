class UserService2 {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;

  UserService2({required this.id, required this.firstName, required this.lastName, required this.phone});

  factory UserService2.fromJson(Map<String, dynamic> json) {
    return UserService2(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
    );
  }
}