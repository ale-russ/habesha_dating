import 'dart:convert';

// class Contact {
//   final String name;
//   final String status;
//   final String imageUrl;
//   final String initial;

//   Contact({required this.name, required this.status, required this.imageUrl})
//       : initial = name[0].toUpperCase();
// }

List<Contacts> contactsFromJson(String str) =>
    List<Contacts>.from(json.decode(str).map((x) => Contacts.fromJson(x)));

String contactsToJson(List<Contacts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contacts {
  String name;
  String imageUrl;
  String status;
  String initial;
  Contacts({
    required this.name,
    required this.imageUrl,
    required this.status,
  }) : initial = name[0].toUpperCase();

  factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        name: json["name"],
        imageUrl: json["imageUrl"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "status": status,
      };
}
