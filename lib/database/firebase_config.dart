import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firebase{
  static final  FirebaseFirestore _firebaseInstance = FirebaseFirestore.instance;
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static FirebaseFirestore get instance => _firebaseInstance;

  static FirebaseAuth get auth => _firebaseAuth;
}