class RegistrationModel {
  String? id;
  String? whatsapp;

  String? firstName;
  String? lastName;

  
  String? password;
  String? confirmPassword;

  RegistrationModel({
    this.id,
    required this.whatsapp,
    required this.firstName,
    required this.lastName,
    
    required this.confirmPassword,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      " role":whatsapp,
      "firsName": firstName,
      "lastName": lastName,
      
      "code": password,
      "filiere": confirmPassword
    };
  }

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
        id: json["id"],
        firstName: json['firstName'],
        lastName: json['lastName'],
        whatsapp: json['whatsapp'],
        password: json['password'],
        confirmPassword: json['confirmPassword']);
  }
}
