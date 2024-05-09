import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:formation/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isObscured = true;
  String _errorMessage = '';

  void _createAccount() {
    setState(() {
      _errorMessage =
          ''; // Réinitialiser le message d'erreur à chaque tentative
    });

    // Vérifier que tous les champs sont remplis
    if (_whatsappController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Tous les champs doivent être remplis.';
      });
      return;
    }

    // Vérifier si les mots de passe correspondent
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorMessage = 'Les mots de passe ne correspondent pas.';
      });
      return;
    }

    // Si tout est bon, procéder avec la création du compte
    FirebaseFirestore.instance.collection('utilisateurs').add({
      'whatsapp': _whatsappController.text,
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'password': _passwordController.text,
      'confirmPassword': _confirmPasswordController.text,
      // Ajoutez d'autres champs ici si nécessaire
    }).then((value) async {


  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('Id', value.id);

      print('Compte créé avec succès');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
      // Vous pouvez naviguer l'utilisateur vers une autre page ici si vous le souhaitez
    }).catchError((error) {
      print('Erreur lors de la création du compte: $error');
      setState(() {
        _errorMessage =
            'Erreur lors de la création du compte. Veuillez réessayer.';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            Container(), // To remove the space reserved for the previous icon
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(

            decoration: BoxDecoration(
              color: Colors.green, // Change the color to match your design
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  // Add this IconButton for the back icon
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Text(
                  '  Créer votre compte',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.green,
      ),



      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.12,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: _whatsappController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(8),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Numéro WhatsApp',
                      filled: true,
                      fillColor:  Color.fromARGB(255, 238, 238, 238),
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.12,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      filled: true,
                      fillColor:  Color.fromARGB(255, 238, 238, 238),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.12,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Prénom',
                      filled: true,
                      fillColor:  Color.fromARGB(255, 238, 238, 238),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.12,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _isObscured,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      filled: true,
                      fillColor:   Color.fromARGB(255, 238, 238, 238),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                        icon: Icon(_isObscured
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.12,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: _isObscured,
                    decoration: InputDecoration(
                      labelText: 'Confirmer le mot de passe',
                      filled: true,
                      fillColor:  Color.fromARGB(255, 238, 238, 238),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                        icon: Icon(_isObscured
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 14,fontWeight:FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.12,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: ElevatedButton(
                    onPressed: _createAccount,
                    child: Text(
                      'Créer votre compte',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 7, 35),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 225, 255, 2),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(50, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
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
