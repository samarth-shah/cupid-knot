// ignore: file_names
class UserData {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String token;
  final String gender;
  final String docId;

  UserData({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.token,
    required this.gender,
    required this.docId,
  });

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'phoneNumber': phoneNumber,
        'token': token,
        'gender': gender,
        'docId': docId,
      };

  static UserData fromJson(Map<String, dynamic> json) => UserData(
        fullName: json['fullName'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        token: json['token'],
        gender: json['gender'],
        docId: json['docId'],
      );
}
