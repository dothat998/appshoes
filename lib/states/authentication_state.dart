import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState extends Equatable{
  const AuthenticationState();
  @override
  // TODO: xac dinh 2 trang thasi khac nhau thi con can cu
  //Fail,Success,State
  List<Object> get props => [];
}

//trang thai ban dau
class AuthenticationStateInitial extends AuthenticationState{}

//Dang nhap thanh cong
class AuthenticationStateSuccess extends AuthenticationState{
  final FirebaseUser firebaseUser;
  //dang nhap thanh cong ==> lay ve dc du lieu cua user
  const AuthenticationStateSuccess({this.firebaseUser});
  @override
  // TODO: implement props
  List<Object> get props => [firebaseUser];
  @override
  String toString() => 'AuthenticationSuccess, email: ${firebaseUser.email}';
}
//trang thai dang nhap fail or chua dang nhap
class AuthenticationStateFailure extends AuthenticationState{}