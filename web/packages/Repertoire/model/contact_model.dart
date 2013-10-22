part of repertoire;

class ContactModel extends ConceptModel {

  static final String contact = 'Contact';

  Map<String, ConceptEntities> newEntries() {
    var contacts = new Contacts();
    var map = new Map<String, ConceptEntities>();
    map[contact] = contacts;
    return map;
  }

  Contacts get contacts => getEntry(contact);

  init() {
    var contact = new Contact();
    contact.code = '1';
    contact.nom = 'ilboudo';
    contact.prenom = 'fabrice';
    contact.mail = 'ilboudo@yahoo.fr';
    contact.tel = '418-777-5555';
    contacts.add(contact);

    var contact1 = new Contact();
    contact1.code = '2';
    contact1.nom = 'ilboudo';
    contact1.prenom = 'ephrem';
    contact1.mail = 'ephrem@yahoo.fr';
    contact1.tel = '418-777-6555';
    contacts.add(contact1);

  }

  display() {
    print('Contact Model');
    print('=============');
    contacts.display('Contacts');
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }

}


