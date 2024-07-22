import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

import '../models/contacts_model.dart';

class ContactsServices {
  // Demo contacts fetching
  Future<List<Contacts>> fetchContacts() async {
    try {
      final String response =
          await rootBundle.loadString("assets/contacts.json");
      // final data = json.decode(response);
      final data = contactsFromJson(response);
      log("response: $data");

      return List<Contacts>.from(data).toList();
    } on Exception catch (err) {
      log("Error: $err");
      return [];
    }
  }
}
