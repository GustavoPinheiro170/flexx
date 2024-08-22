class UserDTO {
  final String fullName;

  final String documentNumber;

  final String documentType;

  final String password;

  UserDTO(this.fullName, this.documentNumber, this.documentType, this.password);

  Map toJson() => {
        'fullName': fullName,
        'documentNumber': documentNumber,
        'documentType': documentType,
        'password': password,
      };
}
