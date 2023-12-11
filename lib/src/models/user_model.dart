class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;
  String? message;
  String? api_token;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.password,
    this.confirmPassword,
    this.message,
    this.api_token,
  });

  //Map json to object
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    api_token = json['api_token'];
  }

  //Map object to json or convert object to json
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  @override
  String toString() {
    return 'UserModel{id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, password: $password, confirmPassword: $confirmPassword, message: $message, api_token: $api_token}';
  }
}
