import 'dart:html';
import '../lib/repertoire.dart';


InputElement nom, prenom, mail, tel;
ButtonElement ajouter, supprimer, modifier, reset, update;
ContactModel cm = new ContactModel();
Contacts contacts = cm.contacts;
int i=2;
String ligne;

display(){
  String list='';

  for (var contact in contacts){ 
    var lcontact = '''
    <tr>
    <td class="contact_liste"> ${contact.nom} </td>
    <td class="contact_liste"> ${contact.prenom}</td>
    <td class="contact_liste"> ${contact.mail}</td>
    <td class="contact_liste"> ${contact.tel}</td>
    <td>
    <button type="button" id="modifier${contact.code}" class="btns">Modifier</button>
    <button type="button" id="supp${contact.code}" class="btns">Supprimer</button>
    </td>
    </tr>
    ''';
    list = '$list ${lcontact}';
  }
  
  document.query('#listeContacts').setInnerHtml(list);
}


void main() {
//initialisation et affichage des elements enregistrés
  cm.init();
  display(); 
  
  bind_elements();
  attach_event_handlers();
}

bind_elements() {
  nom = query("#nom");
  prenom = query("#prenom");
  mail = query("#mail");
  tel = query("#tel");
  ajouter = query("#ajouter");
  update = query("#update");
  reset = query("#reset");
  modifier = query("#modifier");
  
  //pour la suppression
  for (var contact in contacts){
     supprimer = query('#supp${contact.code}');
      supprimer.onClick.listen((e){
      var contact =contacts.find(supprimer.id);
      contacts.remove(contact);
      display(); 
      bind_elements();
    });
}
  

   //pour la modification
  for (var contact in contacts){
    ButtonElement modifier = query('#modifier${contact.code}');
    modifier.onClick.listen((e){
    ligne = modifier.id;
    nom.value = contact.nom;
    prenom.value = contact.prenom;
    mail.value = contact.mail;
    tel.value = contact.tel;    
    });
  }
  
  
    update.onClick.listen((e){
      if (nom.value!='' && mail.value!='' && tel.value!='' ){ 
        contacts.find(ligne.substring(6,7)).nom=nom.value;
        contacts.find(ligne.substring(6,7)).prenom=prenom.value;
        contacts.find(ligne.substring(6,7)).mail=mail.value;
        contacts.find(ligne.substring(6,7)).tel=tel.value;
        display();
        bind_elements();
        attach_event_handlers();
      }
      else {
        window.alert('Veuillez entrer les bonnes infos');
      }  
    });
}

attach_event_handlers() {
  ajouter.onClick.listen(ajouterContact);
  reset.onClick.listen(effacerForm);
  //update.onClick.listen(modification);
    
}

ajouterContact (Event event){
  if(nom.value.isNotEmpty && tel.value.isNotEmpty){
  i++;
  Contact contact = new Contact();
  contact.code = i.toString();
  contact.nom = nom.value.toString();
  contact.prenom = prenom.value.toString();
  contact.mail = mail.value.toString();
  contact.tel = tel.value.toString();
  contacts.add(contact);
  effacerForm(event);
  display(); 
  bind_elements();
  attach_event_handlers();
}
  else{
    window.alert("Veuillez saisir les bonnes infos");
  }
  }
effacerForm(Event event){
  nom.value = '';
  prenom.value = '';
  mail.value = '';
  tel.value = '';
}

modification(Event event){
  if (nom.value!='' && mail.value!='' && tel.value!='' ){ 
    
    contacts.find(ligne).nom=nom.value.toString();
    contacts.find(ligne).prenom=prenom.value.toString();
    contacts.find(ligne).mail=mail.value.toString();
    contacts.find(ligne).tel=tel.value.toString();
    display();
    bind_elements();
    attach_event_handlers();
  }
    else {
      window.alert('Veuillez entrer les bonnes infos');
    }  
  }


