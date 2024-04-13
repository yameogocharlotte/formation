import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Subject {
  final String name;
  final double price;

  Subject({required this.name, required this.price});

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      name: map['name'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
    };
  }
}

class FirestoreService {
  final CollectionReference _subjectsCollection =
      FirebaseFirestore.instance.collection('subjects2');

  Future<List<Subject>> getSubjects() async {
    QuerySnapshot querySnapshot = await _subjectsCollection.get();
    return querySnapshot.docs.map((doc) {
      return Subject(
        name: doc['name'] as String,
        price: (doc['price'] ?? 0).toDouble(),
      );
    }).toList();
  }

  Future<void> addSubject(Subject subject) async {
    await _subjectsCollection.add(subject.toMap());
  }

  Future<void> deleteSubject(String name) async {
    QuerySnapshot querySnapshot = await _subjectsCollection.where('name', isEqualTo: name).get();
    querySnapshot.docs.forEach((doc) {
      doc.reference.delete();
    });
  }
}

class AddOrDeleteSubjectPage2 extends StatefulWidget {
  const AddOrDeleteSubjectPage2({Key? key}) : super(key: key);

  @override
  _AddOrDeleteSubjectPage2State createState() => _AddOrDeleteSubjectPage2State();
}

class _AddOrDeleteSubjectPage2State extends State<AddOrDeleteSubjectPage2> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  bool isLoading = false;
  late List<Subject> subjects;

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

  void _loadSubjects() async {
    setState(() {
      isLoading = true;
    });
    subjects = await FirestoreService().getSubjects();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion des Matières'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAddSubjectForm(),
            SizedBox(height: 20),
            _buildSubjectList(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddSubjectForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ajouter un Nouveau Sujet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Nom du Sujet',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _priceController,
            decoration: InputDecoration(
              labelText: 'Prix',
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _addSubject,
            child: Text('Ajouter'),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectList() {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            shrinkWrap: true,
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(subjects[index].name),
                subtitle: Text('Prix: ${subjects[index].price}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _showDeleteConfirmationDialog(context, subjects[index].name);
                  },
                ),
              );
            },
          );
  }

  void _addSubject() async {
    String name = _nameController.text.trim();
    double price = double.parse(_priceController.text.trim());
    Subject newSubject = Subject(name: name, price: price);

    // Ajouter le nouveau sujet dans Firestore
    await FirestoreService().addSubject(newSubject);

    // Mettre à jour la liste des matières
    _loadSubjects();

    // Effacer les champs de saisie après l'ajout du sujet
    _nameController.clear();
    _priceController.clear();
  }

  void _showDeleteConfirmationDialog(BuildContext context, String subjectName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Supprimer le sujet'),
          content: Text('Voulez-vous vraiment supprimer ce sujet ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () async {
                // Supprimer le sujet de Firestore
                await FirestoreService().deleteSubject(subjectName);
                // Mettre à jour la liste des matières après suppression
                _loadSubjects();
                Navigator.of(context).pop();
              },
              child: Text('Supprimer'),
            ),
          ],
        );
      },
    );
  }
}
