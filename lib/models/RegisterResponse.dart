class RegisterResponse {
  final String message;


  RegisterResponse(this.message);

  Map toJson() => {
        'message': message,
      };
}
