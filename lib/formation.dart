import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:formation/payement/payement.dart';
import 'package:get/get.dart';

class Formation extends StatefulWidget {
  @override
  _FormationState createState() => _FormationState();
}

class _FormationState extends State<Formation> {
  int selectedValue = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'NOS FORMATIONS',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow, Colors.orange],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                  
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConcoursDirectsPage(),
                          ),
                        );
                      },
                      child: Text(
                        '      Concours directs      ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConcoursProfessionnelsPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Concours professionnels',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExamenProfessionnelPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Examens professionnels',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                "lib/images/facebook.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/whatsapp.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/telegramme.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/internet.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/youtube.png",
                height: 100,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class Subject {
  final String name;
  final double price;
  bool isSelected;

  Subject({required this.name, required this.price, this.isSelected = false});

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      name: map['name'],
      price: map['price'],
      isSelected: map['isSelected'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'isSelected': isSelected,
    };
  }
}

class FirestoreService {
  final CollectionReference _subjectsCollection =
      FirebaseFirestore.instance.collection('subjects3');

  Future<List<Subject>> getSubjects() async {
    QuerySnapshot querySnapshot = await _subjectsCollection.get();
    return querySnapshot.docs.map((doc) {
      return Subject(
        name: doc['name'] as String,
        price: (doc['price'] ?? 0).toDouble(),
      );
    }).toList();
  }
}

class ConcoursDirectsPage extends StatefulWidget {
  @override
  _ConcoursDirectsPageState createState() => _ConcoursDirectsPageState();
}

class _ConcoursDirectsPageState extends State<ConcoursDirectsPage> {
  late List<Subject> subjects = [];

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

  void _loadSubjects() async {
    subjects = await FirestoreService().getSubjects();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Concours Directs',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 76, 175, 80),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow, Colors.orange],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: CheckboxListTile(
                      title: Text(subject.name),
                      subtitle: Text(
                        'Prix: ${subject.price.toString()}F',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      value: subject.isSelected ,
                      onChanged: (bool? value) {
                        setState(() {
                          subject.isSelected = value ?? false;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
           ElevatedButton(
  onPressed: () {
    List<Subject> selectedSubjects = subjects.where((subject) => subject.isSelected).toList();
    if (selectedSubjects.isNotEmpty) {
      double totalPrice = selectedSubjects.map((subject) => subject.price).reduce((a, b) => a + b);
      int roundedPrice = totalPrice.round();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PayementScreen(
            sujet: selectedSubjects.map((subject) => subject.name).join(', '), 
            price: roundedPrice,
            userphone: "",
            callback: () async {},
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Veuillez sélectionner au moins un sujet.'),
        ),
      );
    }
  },
  child: Text(
    'Payer',
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      Color.fromARGB(255, 76, 175, 80),
    ),
    minimumSize: MaterialStateProperty.all(Size(230, 40)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  ),
),

            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                "lib/images/facebook.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/whatsapp.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/telegramme.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/internet.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/youtube.png",
                height: 100,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}


class ConcoursProfessionnelsPage extends StatefulWidget {
  @override
  _ConcoursProfessionnelsPageState createState() =>
      _ConcoursProfessionnelsPageState();
}

class _ConcoursProfessionnelsPageState
    extends State<ConcoursProfessionnelsPage> {
  List<Map<String, dynamic>> subjects = [];

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

  void _loadSubjects() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('subjects').get();
    setState(() {
      subjects = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  String? selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Concours Professionnels',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 76, 175, 80),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow, Colors.orange],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(
                        '${subject['name']} \n (Prix: ${subject['price']}F)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        setState(() {
                          selectedSubject = subject['name'];
                        });
                      },
                      selected: selectedSubject == subject['name'],
                      selectedTileColor: Colors.green,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedSubject != null) {
                  final selectedSubjectData = subjects.firstWhere(
                      (subject) => subject['name'] == selectedSubject);
                  double totalPrice = selectedSubjectData['price'];
                  int roundedPrice = totalPrice
                      .round(); // Arrondir le prix à l'entier le plus proche
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PayementScreen(
                        sujet: selectedSubject
                            .toString(), // Concaténer les matières sélectionnées en une seule chaîne
                        price: roundedPrice, // Passer le prix total arrondi ici
                        userphone: "",
                        callback: () async {},
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Veuillez sélectionner une matière.'),
                    ),
                  );
                }
              },
              child: Text(
                'Payer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 76, 175, 80),
                ),
                minimumSize: MaterialStateProperty.all(Size(230, 40)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                "lib/images/facebook.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/whatsapp.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/telegramme.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/internet.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/youtube.png",
                height: 100,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectRadio(String subject) {
    return RadioListTile<String>(
      title: Text(subject),
      value: subject,
      groupValue: selectedSubject,
      onChanged: (String? value) {
        setState(() {
          selectedSubject = value;
        });
      },
    );
  }
}

class ExamenProfessionnelPage extends StatefulWidget {
  @override
  _ExamenProfessionnelPageState createState() =>
      _ExamenProfessionnelPageState();
}

class _ExamenProfessionnelPageState extends State<ExamenProfessionnelPage> {
   List<Map<String, dynamic>> subjects = [];

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

  void _loadSubjects() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('subjects2').get();
    setState(() {
      subjects = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  String? selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Concours Professionnels',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 76, 175, 80),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow, Colors.orange],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(
                        '${subject['name']} \n (Prix: ${subject['price']}F)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        setState(() {
                          selectedSubject = subject['name'];
                        });
                      },
                      selected: selectedSubject == subject['name'],
                      selectedTileColor: Colors.green,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedSubject != null) {
                  final selectedSubjectData = subjects.firstWhere(
                      (subject) => subject['name'] == selectedSubject);
                  double totalPrice = selectedSubjectData['price'];
                  int roundedPrice = totalPrice.round();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PayementScreen(
                        sujet: selectedSubject.toString(),
                        price: roundedPrice,
                        userphone: "",
                        callback: () async {},
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Veuillez sélectionner une matière.'),
                    ),
                  );
                }
              },
              child: Text(
                'Payer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 76, 175, 80),
                ),
                minimumSize: MaterialStateProperty.all(Size(230, 40)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                "lib/images/facebook.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/whatsapp.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/telegramme.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/internet.png",
                height: 100,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/youtube.png",
                height: 100,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectRadio(String subject) {
    return RadioListTile<String>(
      title: Text(subject),
      value: subject,
      groupValue: selectedSubject,
      onChanged: (String? value) {
        setState(() {
          selectedSubject = value;
        });
      },
    );
  }
}