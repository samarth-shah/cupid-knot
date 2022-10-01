// ignore: file_names
class ContactList {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String owner;
  final String docId;

  ContactList({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.owner,
    required this.docId,
  });

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'phoneNumber': phoneNumber,
        'owner': owner,
        'docId': docId,
      };

  static ContactList fromJson(Map<String, dynamic> json) => ContactList(
        fullName: json['fullName'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        owner: json['owner'],
        docId: json['docId'],
      );
}
