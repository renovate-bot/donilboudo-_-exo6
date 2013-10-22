import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import '../lib/repertoire.dart';

testContacts(Contacts Contacts) {
  group("Testing Contacts", () {
    setUp(() {
      var contactCount = 0;
      expect(Contacts.length, equals(contactCount));

      var design = new Contact();
      expect(design, isNotNull);
      //design.code = '1';
      design.nom = 'Desjardins';
      design.prenom = 'Marie';
      design.mail = 'marie@gmail.com';
      design.tel = '418-666-2458';
      Contacts.add(design);
      expect(Contacts.length, equals(++contactCount));

      var prototype = new Contact();
      expect(prototype, isNotNull);
      //design.code = '2';
      prototype.nom = 'Lemieux';
      prototype.prenom = 'Ernest';
      prototype.mail = 'lemieux@gmail.com';
      prototype.tel = '418-777-2458';
      Contacts.add(prototype);
      expect(Contacts.length, equals(++contactCount));
      });
    tearDown(() {
      Contacts.clear();
      expect(Contacts.isEmpty, isTrue);
    });
    test('Add Contact', () {
      var contact = new Contact();
      expect(contact, isNotNull);
      //contact.code = '3';
      contact.nom = 'Parent';
      contact.prenom = 'David';
      contact.mail = 'dave@gmail.com';
      contact.tel = '518-777-2458';
      var added = Contacts.add(contact);
      expect(added, isTrue);
      Contacts.display('Add Contact');
    });
    test('Add Contact Without Data', () {
      var contactCount = Contacts.length;
      var contact = new Contact();
      expect(contact, isNotNull);
      var added = Contacts.add(contact);
      expect(added, isTrue);
      Contacts.display('Add Contact Without Data');
    });
    
   
    test('Order Contacts by Name', () {
      Contacts.orderByFunction((m,n) => m.compareTo(n));
      Contacts.display('Order Contacts by Name');
    });
    test('New Contact', () {
      var contactCount = Contacts.length;
      var marketing = new Contact();
      expect(marketing, isNotNull);
      marketing.nom = 'Parent';
      marketing.prenom = 'David';
      marketing.mail = 'dave@gmail.com';
      marketing.tel = '518-777-2458';
      var added = Contacts.add(marketing);
      expect(added, isTrue);
      expect(Contacts.length, equals(++contactCount));
      Contacts.display('New Contact');
    });
    test('Copy Contacts', () {
      var copiedContacts = Contacts.copy();
      expect(copiedContacts.isEmpty, isFalse);
      expect(copiedContacts.length, equals(Contacts.length));
      expect(copiedContacts, isNot(same(Contacts)));
      expect(copiedContacts, isNot(equals(Contacts)));
      copiedContacts.forEach((cp) =>
          expect(cp, isNot(same(Contacts.find(cp.nom)))));
      copiedContacts.display('Copied Contacts');
      //Contacts.display('Contacts');
    });
    test('True for Every Contact', () {
      //expect(Contacts.every((p) => p.code != null), isTrue);
      expect(Contacts.every((p) => p.nom != null), isTrue);
    });
    test('From Contacts to JSON', () {
      var json = Contacts.toJson();
      expect(json, isNotNull);
      print(json);
    });
    test('From JSON to Contact Model', () {
      List<Map<String, Object>> json = Contacts.toJson();
      Contacts.clear();
      expect(Contacts.isEmpty, isTrue);
      Contacts.fromJson(json);
      expect(Contacts.isEmpty, isFalse);
      Contacts.display('From JSON to Contacts');
    });
  });
}

initDisplayModel() {
  ContactModel contactModel = new ContactModel();
  contactModel.init();
  contactModel.display();
}

testModel() {
  ContactModel contactModel = new ContactModel();
  Contacts contacts = contactModel.contacts;
  testContacts(contacts);
}

main() {
  //initDisplayModel();
  testModel();
}
