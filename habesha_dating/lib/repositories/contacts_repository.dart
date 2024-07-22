import '../models/contacts_model.dart';
import '/services/contacts_services.dart';

class ContactsRepository {
  final ContactsServices _contactServices = ContactsServices();

  Future<List<Contacts>> getContacts() async {
    return await _contactServices.fetchContacts();
  }
}
