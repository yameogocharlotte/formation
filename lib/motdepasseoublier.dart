import 'package:flutter/material.dart';

class Reinitialise extends StatefulWidget {
  @override
  _ReinitialiseState createState() => _ReinitialiseState();
}

class _ReinitialiseState extends State<Reinitialise> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /* decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow, Colors.orange],
          ),
        ), */
        color: Color.fromARGB(255, 227, 224, 224),
        child: Column(children: [
          Container(
              color: Colors.green,
              height: 100,
              child: Column(
                children: [
                  Spacer(),
                  Image.asset(
                    "lib/images/logo.png",
                    width: 50,
                    height: 50,
                  ),
                  Row(children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        "Mot de passe oublié",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                ],
              )),
          SizedBox(
            height: 40,
          ),
          Image.asset(
            "lib/images/lock.png",
            width: 80,
            height: 80,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "Probleme de connexion ?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Entrez votre email et nous vous enverrons un lien vour reinitialiser votre mot de passe",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Email', // Label du champ
                prefixIcon: Icon(Icons.email), // Icône à gauche du champ
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Réinitialisé le mot de passe',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color.fromARGB(255, 239, 117, 3),
              ),
              minimumSize: MaterialStateProperty.all(Size(300, 50)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30), // Ajoutez votre rayon de bordure ici
                ),
              ),
            ),
          ),
        ]),
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
 
/* import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Reinitialise extends StatefulWidget {
  @override
  _ReinitialiseState createState() => _ReinitialiseState();
}

class _ReinitialiseState extends State<Reinitialise> {
  final TextEditingController _emailController = TextEditingController();
  String _message = '';

  Future<void> _resetPassword() async {
    final String email = _emailController.text;

    try {
      // Remplacez 'your_reset_password_api_endpoint' par l'URL de votre endpoint d'API pour réinitialiser le mot de passe
      final Uri uri = Uri.parse('your_reset_password_api_endpoint');
      
      final http.Response response = await http.post(
        uri,
        body: json.encode({'email': email}),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          _message = responseData['message'];
        });
      } else {
        setState(() {
          _message = 'Une erreur s\'est produite: ${responseData['error']}';
        });
      }
    } catch (error) {
      setState(() {
        _message = 'Une erreur s\'est produite: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mot de passe oublié'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset(
                "lib/images/lock.png",
                width: 80,
                height: 80,
              ),
              SizedBox(height: 10),
              Text(
                "Problème de connexion ?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Entrez votre email et nous vous enverrons un lien pour réinitialiser votre mot de passe.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetPassword,
                child: Text(
                  'Réinitialiser le mot de passe',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 239, 117, 3),
                  minimumSize: Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                _message,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
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
 */