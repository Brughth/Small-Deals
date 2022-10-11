import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:small_deals/auth/data/models/user_model.dart';

class AuthRepository {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<UserModel?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    updateUser(
      id: userCredential.user!.uid,
      data: {
        'id': userCredential.user!.uid,
        'name': name,
        'email': email,
      },
    );

    return login(email: email, password: password);
  }

  updateUser({
    required String id,
    required Map<String, dynamic> data,
  }) async {
    await users.doc(id).set(
          data,
          SetOptions(merge: true),
        );
  }

  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return await getUser(userCredential.user!.uid);
  }

  Future<UserModel?> getUser(String id) async {
    var data = (await users.doc(id).get()).data() as Map<String, dynamic>;
    print(data);
    return UserModel.fromMap(data);
  }
}
