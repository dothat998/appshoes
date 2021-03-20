import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository{
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  //contrustor
  UserRepository({FirebaseAuth firebaseAuth,GoogleSignIn googleSignIn}):
  _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
  _googleSignIn = googleSignIn ?? GoogleSignIn();

  //Dang nhap dang ky bang Google = form Google
  Future<FirebaseUser> signInWithGoogle() async{
    final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.accessToken, accessToken: googleSignInAuthentication.idToken);
    await _firebaseAuth.signInWithCredential(authCredential);
  }

  //Dang nhap
  Future<void> SignInWithEmailAndPassword(String email, String password) async{
    return await this._firebaseAuth.signInWithEmailAndPassword
      (email: email.trim(), password: password.trim());
  }

  //Dang ki
  Future<void> createUserWithEmailAndPassword(String email, String password) async{
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email:email.trim() , password: password);
  }

  //Dang Xuat
  Future<void> signOut()async{
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut()
      //Ham nay ket thuc khi ca 2 deu ket thuc
    ]);
  }

  //kiem tra dang nhap
  Future<bool> isSignIn() async{
    return await _firebaseAuth.currentUser() != null;
  }

  //kiem tra, lay ra user da dang nhap,Lay ra tren Firebase
  Future<FirebaseUser> getUser() async{
    return await _firebaseAuth.currentUser();
  }
}