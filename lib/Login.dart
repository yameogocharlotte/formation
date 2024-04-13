import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:formation/admin/addconcoursdirect.dart';
import 'package:formation/admin/formationAd.dart';
import 'signUp.dart';
import 'motdepasseoublier.dart';
import 'formation.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading:
            Container(), // Pour retirer l'espace réservé à l'icône précédente
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50), // Hauteur de la colonne
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/images/logo.png",
                width: 100,
                height: 70,
              ),
              // Espace entre le logo et le titre
              Text(
                "Se former pour bien enseigné!",
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow, Colors.orange],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    color: const Color.fromARGB(255, 225, 255, 2),
                    child: const Center(
                      child: Text(
                        'Nous sommes un cabinet spécialisé dans le domaine de l\'éducation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 70,
                        width: 80,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Concours direct',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 80,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Concours professionnel',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 80,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Examens professionnel',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 80,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Documents pédagogiques',
                            textAlign: TextAlign
                                .center, // Aligner le texte au centre du conteneur
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                    children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          'lib/images/image1.jpg',
                        ),
                      ),
                    ),
                    
                    Container(
                      width: 100,
                      height: 100,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('lib/images/image2.jpg'),
                      ),
                    ),
                   
                    Container(
                      width: 100,
                      height: 100,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('lib/images/image3.jpg'),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "CONNEXION",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 10),
                            Container(
                              width: 150, // Largeur réduite du TextField
                              height: 40, // Hauteur réduite du TextField
                              padding: EdgeInsets.all(1.0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 216, 216, 216),
                                border: Border.all(
                                  color: Color.fromARGB(255, 183, 182, 182),
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: TextField(
                                controller: _firstNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Nom',
                                  
                                  prefixIcon: Icon(Icons.person),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 150, // Largeur réduite du TextField
                              height: 40, // Hauteur réduite du TextField
                              padding: EdgeInsets.all(1.0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 216, 216, 216),
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: TextField(
                                controller: _lastNameController,
                                decoration: InputDecoration(
                                  hintText: 'Prénom',
                                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                                  prefixIcon: Icon(Icons.person),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 150, // Largeur réduite du TextField
                              height: 40, // Hauteur réduite du TextField
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 216, 216, 216),
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Mot de passe',
                                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                                  prefixIcon: Icon(Icons.lock),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .end, // Alignement des éléments sur la ligne
                              children: [
                                /* Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          true, // Vous devez gérer l'état de la case à cocher
                                      onChanged: (bool? value) {
                                        
                                        // Méthode appelée lors du changement d'état de la case à cocher
                                      },
                                    ),
                                    Text(
                                      "voir le mot de passe",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.blue),
                                    ),
                                  ],
                                ), */
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Reinitialise()));
                                    // Fonction appelée lors du clic sur le bouton
                                  },
                                  child: Text(
                                    'Mot de passe oublié',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1),
                            ElevatedButton(
                              onPressed: () {
                                // Appel à la méthode pour la connexion
                                _signIn(context);
                              },
                              child: const Text(
                                'Se connecter',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 239, 117, 3)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(20, 40)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // Ajoutez votre rayon de bordure ici
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                "CREER UN COMPTE GRATUIT",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Vous n'avez pas de compte?",
                                  style: TextStyle(fontSize: 10),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                    );
                                    // Fonction appelée lors du clic sur le bouton
                                  },
                                  child: Text(
                                    'crée un compte',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.blue),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  // Ajoutez d'autres éléments ici
                ],
              ),
            ],
          ),
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
              ), // Ajoutez vos images pour les réseaux sociaux
              onPressed: () {
                // Action à effectuer lorsque l'utilisateur appuie sur l'icône Facebook
              },
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/whatsapp.png",
                height: 100,
              ), // Ajoutez vos images pour les réseaux sociaux
              onPressed: () {
                // Action à effectuer lorsque l'utilisateur appuie sur l'icône WhatsApp
              },
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/telegramme.png",
                height: 100,
              ), // Ajoutez vos images pour les réseaux sociaux
              onPressed: () {
                // Action à effectuer lorsque l'utilisateur appuie sur l'icône Instagram
              },
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/internet.png",
                height: 100,
              ), // Ajoutez vos images pour les réseaux sociaux
              onPressed: () {
                // Action à effectuer lorsque l'utilisateur appuie sur l'icône YouTube
              },
            ),
            IconButton(
              icon: Image.asset(
                "lib/images/youtube.png",
                height: 100,
              ), // Ajoutez vos images pour les réseaux sociaux
              onPressed: () {
                // Action à effectuer lorsque l'utilisateur appuie sur l'icône YouTube
              },
            ),
          ],
        ),
      ),
    );
  }

  void _signIn(BuildContext context) async {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String password = _passwordController.text;

    bool success = await AuthService().signIn(firstName, lastName, password);

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Formation()),
      );
    } 
    else if( firstName=="lebian" && lastName=="serge" && password == "admin"){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FormationAD()),
      );

     }
    else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Erreur de connexion"),
            content:
                Text("Le nom d'utilisateur ou le mot de passe est incorrect."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> signIn(
      String firstName, String lastName, String password) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('utilisateurs')
          .where('firstName', isEqualTo: firstName)
          .where('lastName', isEqualTo: lastName)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> userData =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        if (userData != null && userData['password'] == password) {
          return true;
        }
      }
      return false;
    } catch (e) {
      print('Erreur lors de la connexion: $e');
      return false;
    }
  }
}
