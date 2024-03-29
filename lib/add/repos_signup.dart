import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formation/add/signup.model.dart';


  Future addRegistrationModel(RegistrationModel user)async{
    final docRegistrationModel = FirebaseFirestore.instance.collection("utilisateurs").doc();
    user.id= docRegistrationModel.id; 
    await docRegistrationModel.set(user.toJson());
    
  }
   