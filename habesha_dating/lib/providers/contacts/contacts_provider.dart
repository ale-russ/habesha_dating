import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/repositories/contacts_repository.dart';
import '/models/contacts_model.dart';

final contactsRepositoryProvider = Provider((ref) => ContactsRepository());

final contactsProvider = StateNotifierProvider<ContactsNotifier,
    AsyncValue<Map<String, List<Contacts>>>>((ref) => ContactsNotifier(ref));

class ContactsNotifier
    extends StateNotifier<AsyncValue<Map<String, List<Contacts>>>> {
  ContactsNotifier(this._ref) : super(const AsyncValue.loading()) {
    fetchContacts();
  }

  final Ref _ref;

  Map<String, List<Contacts>> groupedContacts = {};
  List<String> sortedKeys = [];

  Future<void> fetchContacts() async {
    state = const AsyncValue.loading();
    try {
      final contacts =
          await _ref.read(contactsRepositoryProvider).getContacts();
      final groupedContacts = _groupContacts(contacts);
      state = AsyncValue.data(groupedContacts);
    } on Exception catch (err, stackTrace) {
      debugPrint('Error fetching contacts: $err');
      state = AsyncValue.error(err, stackTrace);
    }
  }

  Map<String, List<Contacts>> _groupContacts(List<Contacts> contacts) {
    Map<String, List<Contacts>> groupedContacts = {};

    for (var contact in contacts) {
      if (groupedContacts[contact.initial] == null) {
        groupedContacts[contact.initial] = [];
      }
      groupedContacts[contact.initial]!.add(contact);
    }
    final sortedKeys = groupedContacts.keys.toList()..sort();

//  create a sorted map to ensure keys are in order
    final sortedGroupContacts = {
      for (var key in sortedKeys) key: groupedContacts[key]!
    };
    return sortedGroupContacts;
  }
}
