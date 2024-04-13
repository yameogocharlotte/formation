import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:formation/admin/addconcoursdirect.dart';
import 'package:formation/admin/concourdirect.dart';
import 'package:formation/admin/proffesionnel.dart';


class FormationAD extends StatefulWidget {
  @override
  _FormationADState createState() => _FormationADState();
}

class _FormationADState extends State<FormationAD> {
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
                children: <Widget>[
                  Container(
                   
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddOrDeleteSubjectPage3(),
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
                            builder: (context) => AddOrDeleteSubjectPage(),
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
                            builder: (context) => AddOrDeleteSubjectPage2(),
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