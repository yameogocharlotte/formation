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
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 300,
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
                        'Concours directs',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
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
                    width: 300,
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

class ConcoursDirectsPage extends StatefulWidget {
  @override
  _ConcoursDirectsPageState createState() => _ConcoursDirectsPageState();
}

class _ConcoursDirectsPageState extends State<ConcoursDirectsPage> {
  Map<String, bool> selectedSubjects = {
    'Assistant des eaux et forets': false,
    'Assistant de douanes': false,
    'ENAREF cycle c': false,
    'Agents techniques de l environnement': false,
    'Agents techniques en agriculture': false,
    'ENAREF cycle b': false,
    'Adjoint de secretariat': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // Ajoutez cet IconButton pour l'icône de retour
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Concours Directs',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
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
              child: ListView(
                children: selectedSubjects.keys.map((String subject) {
                  return Card(
                      elevation: 5, // Élévation pour donner un effet d'ombre
                      margin: EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16), // Marge autour du Card
                      child: CheckboxListTile(
                        title: Text(subject),
                        subtitle: Text(
                          'Prix: ${getPrice(subject).toString()}F',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        value: selectedSubjects[subject] ?? false,
                        onChanged: (bool? value) {
                          setState(() {
                            selectedSubjects[subject] = value!;
                          });
                        },
                      ));
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                List<String> selected = [];
                selectedSubjects.forEach((key, value) {
                  if (value) {
                    selected.add(key);
                  }
                });
                int totalPrice = 0;

                for (String subject in selected) {
                  // Logique pour calculer le prix de chaque matière et l'ajouter au prix total
                  if (subject == 'Assistant des eaux et forets') {
                    totalPrice += 1000;
                  } else if (subject == 'Assistant de douanes') {
                    totalPrice += 1200;
                  } else if (subject == 'ENAREF cycle c') {
                    totalPrice += 150;
                  } else if (subject ==
                      'Agents techniques de l environnement') {
                    totalPrice += 2000;
                  } else if (subject == 'Agents techniques en agriculture') {
                    totalPrice += 300;
                  } else if (subject == 'ENAREF cycle b') {
                    totalPrice += 1500;
                  } else if (subject == 'Adjoint de secretariat') {
                    totalPrice += 5000;
                  }
                }
                if (totalPrice > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PayementScreen(
                        sujet: selected.join(
                            ', '), // Concaténer les matières sélectionnées en une seule chaîne
                        price: totalPrice, // Passer le prix total ici
                        userphone: "",
                        callback: () async {},
                      ),
                    ),
                  );
                }
                else {
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
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 76, 175, 80)),
                minimumSize: MaterialStateProperty.all(Size(230, 40)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15), // Ajoutez votre rayon de bordure ici
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

  int getPrice(String subject) {
    // Fonction pour obtenir le prix en fonction du sujet
    switch (subject) {
      case 'Assistant des eaux et forets':
        return 1000;
      case 'Assistant de douanes':
        return 1200;
      case 'ENAREF cycle c':
        return 150;
      case 'Agents techniques de l environnement':
        return 2000;
      case 'Agents techniques en agriculture':
        return 300;
      case 'ENAREF cycle b':
        return 1500;
      case 'Adjoint de secretariat':
        return 5000;
      default:
        return 0;
    }
  }
}

class ConcoursProfessionnelsPage extends StatefulWidget {
  @override
  _ConcoursProfessionnelsPageState createState() =>
      _ConcoursProfessionnelsPageState();
}

class _ConcoursProfessionnelsPageState
    extends State<ConcoursProfessionnelsPage> {
  Map<String, int> subjectPrices = {
    'Medecins Specialiste': 10000,
    'Pharmaciens Specialistes': 10000,
    'Chirurgiens dentistes specialistes': 10000,
    'ingenieur en agricultures': 10000,
    'Conseille en agricultures': 10000,
    'biologistes medicaux': 10000,
    'ingenieur du genie sanitaire': 10000,
    'Ingenieurs en genie biomedical': 10000,
    'Inspecteur du travail': 10000,
  };

  String? selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // Ajoutez cet IconButton pour l'icône de retour
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
              child: ListView(
                children: subjectPrices.keys.map((String subject) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(
                        '$subject \n (Prix: ${subjectPrices[subject]}F)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        setState(() {
                          selectedSubject = subject;
                        });
                      },
                      selected: selectedSubject == subject,
                      selectedTileColor: Colors.green,
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedSubject != null) {
                  int totalPrice = subjectPrices[selectedSubject]!;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PayementScreen(
                        sujet: selectedSubject.toString(), // Concaténer les matières sélectionnées en une seule chaîne
                        price: totalPrice, // Passer le prix total ici
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

  int getPrice(String subject) {
    switch (subject) {
      case 'Medecins Specialiste':
        return 10000;
      case 'Pharmaciens Specialistes':
        return 10000;
      case 'Chirurgiens dentistes specialistes':
        return 10000;
      case 'ingenieur en agricultures':
        return 10000;
      case 'Conseille en agricultures':
        return 10000;
      case 'biologistes medicaux':
        return 10000;
      case 'ingenieur du genie sanitaire':
        return 10000;
      case 'Ingenieurs en genie biomedical':
        return 10000;
      case 'Inspecteur du travail':
        return 10000;
      default:
        return 0;
    }
  }
}

class ExamenProfessionnelPage extends StatefulWidget {
  @override
  _ExamenProfessionnelPageState createState() =>
      _ExamenProfessionnelPageState();
}

class _ExamenProfessionnelPageState extends State<ExamenProfessionnelPage> {
  Map<String, int> subjectPrices = {
    'Administrateur': 5000,
    'Attache principal': 5000,
    'Redacteur principales de 1 ere classe': 5000,
    'Redacteur principales de 2 eme classe': 5000,
    'Animateur principale de 1 ere classe': 5000,
    'Animateur principale de 2 ere classe': 5000,
    'bibliothecaire principal': 5000,
    'Techniciens principale de 1 ere classe': 5000,
    'Techniciens principale de 2 ere classe': 5000,
  };

  String? selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // Ajoutez cet IconButton pour l'icône de retour
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
              child: ListView(
                children: subjectPrices.keys.map((String subject) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      title: Text(
                        '$subject \n (Prix: ${subjectPrices[subject]}F)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        setState(() {
                          selectedSubject = subject;
                        });
                      },
                      selected: selectedSubject == subject,
                      selectedTileColor: Colors.green,
                    ),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedSubject != null) {
                  int totalPrice = subjectPrices[selectedSubject]!;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PayementScreen(
                        sujet: selectedSubject
                            .toString(), // Concaténer les matières sélectionnées en une seule chaîne
                        price: totalPrice, // Passer le prix total ici
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
            )
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

  int getPrice(String subject) {
    switch (subject) {
      case 'Administrateur':
        return 5000;
      case 'Attache principal':
        return 5000;
      case 'Redacteur principales de 1 ere classe':
        return 5000;
      case 'Redacteur principales de 2 eme classe':
        return 5000;
      case 'Animateur principale de 1 ere classe':
        return 5000;
      case 'Animateur principale de 2 ere classe':
        return 5000;
      case 'bibliothecaire principal':
        return 5000;
      case 'Techniciens principale de 1 ere classe':
        return 5000;
      case 'Techniciens principale de 2 ere classe':
        return 5000;
      default:
        return 0;
    }
  }
}
