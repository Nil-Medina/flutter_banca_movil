class ResponseCod {
  int id = 0;
  String email = "";
  String password = "";
  String token = "";

  ResponseCod({
    required this.id,
    required this.email,
    required this.password,
    required this.token,
  });

  factory ResponseCod.fromJson(Map<String, dynamic> json) {
    return ResponseCod(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
    );
  }
}
