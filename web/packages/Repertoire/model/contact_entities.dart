part of repertoire;

class Contact extends ConceptEntity<Contact> {

  String _nom, _prenom, _mail, _tel;

  String get nom => _nom;
  set nom(value) {
    if (value != null && !value.isEmpty) _nom = value;
  }

  String get prenom => _prenom;
  set prenom(value) {
    if (value != null && !value.isEmpty) _prenom = value;
  }

  String get mail => _mail;
  set mail(value) {
    if (value != null && !value.isEmpty) _mail = value;
  }
  
  String get tel => _tel;
  set tel(value) {
    //if (value != null && !value.isEmpty) _tel = value;
    if (value == null || value.isEmpty) return;
    // test the format:
    RegExp exp = new RegExp(r"[0-9]{3}-[0-9]{3}-[0-9]{4}");
    if (exp.hasMatch(value)) _tel = value;
  }

  Contact newEntity() => new Contact();

  Contact copy() {
    var contact = super.copy();
    contact.nom = nom;
    contact.prenom = prenom;
    contact.mail = mail;
    contact.tel = tel;
    return contact;
  }

  String toString() {
    return '  {\n '
           '    ${super.toString()}, \n '
           '    name: ${nom}, \n '
           '    prenom: ${prenom}\n'
           '    mail: ${mail}\n'
           '    tel: ${tel}\n'
           '  }';
  }

  Map<String, Object> toJson() {
    Map<String, Object> contactList= super.toJson();
    
    contactList["nom"] = nom;
    contactList["prenom"] = prenom;
    contactList["mail"] = mail;
    contactList["tel"] = tel;
    return contactList;
  }

  fromJson(Map<String, Object> contactList) {
    super.fromJson(contactList);
    this.nom = contactList["nom"];
    this.prenom = contactList["prenom"];
    this.mail = contactList["mail"];
    this.tel = contactList["tell"];
  }

  /*bool get onProgramming =>
      description.contains('Programming') ? true : false;
*/
  int compareTo(Contact other) {
    return nom.compareTo(other.nom);
  }

}

class Contacts extends ConceptEntities<Contact> {

  Contacts newEntities() => new Contacts();
  Contact newEntity() => new Contact();

}
