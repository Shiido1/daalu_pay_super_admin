class CreateAdminEntityModel {
  String? firstName;
  String? lastName;
  String? gender;
  String? dateOfBirth;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  String? password;
  String? confirmPassword;
  String? role;

  CreateAdminEntityModel({
    this.firstName,
    this.lastName,
    this.gender,
    this.dateOfBirth,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.password,
    this.confirmPassword,
    this.role,
  });

  factory CreateAdminEntityModel.fromJson(Map<String, dynamic> json) {
    return CreateAdminEntityModel(
      firstName: json['first_name']?.toString(),
      lastName: json['last_name']?.toString(),
      gender: json['gender']?.toString(),
      dateOfBirth: json['date_of_birth']?.toString(),
      email: json['email']?.toString(),
      phone: json['phone']?.toString(),
      address: json['address']?.toString(),
      city: json['city']?.toString(),
      state: json['state']?.toString(),
      zipCode: json['zip_code']?.toString(),
      country: json['country']?.toString(),
      password: json['password']?.toString(),
      confirmPassword: json['confirm_password']?.toString(),
      role: json['role']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (firstName != null) 'first_name': firstName,
        if (lastName != null) 'last_name': lastName,
        if (gender != null) 'gender': gender,
        if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (address != null) 'address': address,
        if (city != null) 'city': city,
        if (state != null) 'state': state,
        if (zipCode != null) 'zip_code': zipCode,
        if (country != null) 'country': country,
        if (password != null) 'password': password,
        if (confirmPassword != null) 'confirm_password': confirmPassword,
        if (role != null) 'role': role,
      };
}
