class UserDTO {
  final String email;
  final String password;
  final String document;
  final String role =   "USER";
  final String creci;
  final String name;
  final String phone;


  UserDTO(this.email, this.password, this.document, this.creci, this.name, role, this.phone);

  Map toJson() => {
        'email': email,
        'password': password,
        'document': document,
        'role': role,
        'creci': creci,
        'name': name,
        'phone': phone,
      };
}
