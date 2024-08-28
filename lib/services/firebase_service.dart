import "package:cloud_firestore/cloud_firestore.dart";

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async{
  List people =[];
  CollectionReference collectionReferencePeople = db.collection('people');
  QuerySnapshot queryPeople = await collectionReferencePeople.get();
  queryPeople.docs.forEach((documento){
    final Map<String,dynamic> data = documento.data()as Map<String,dynamic>;
    final person = {
      "name": data ['name'],
      "uid":documento.id,
    };



    people.add(person);

  });
  return people;
}

//Guardar name en base de datos
  Future<void> addPeople(String name) async{
    await db.collection("people").add({"name":name});
  }

  Future<void> updatePeople(String uid, String newName) async{
    await db.collection("people").doc(uid).set({"name": newName});
  }

//Borrar datos base de datos
  Future<void> deletePeople(String uid) async{
    await db.collection("people").doc(uid).delete();

  }