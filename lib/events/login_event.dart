import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}
//xay ra khi go tung ki tu trong email, kiem tra tinh hop le va` tro toi class nay`
class LoginEventEmailChanged extends LoginEvent{
  final String email;
  const LoginEventEmailChanged({this.email});
  @override
  // TODO: implement props
  List<Object> get props => [email];
  @override
  String toString() {
    // TODO: implement toString
    return 'Email changed : $email';
  }
}

class LoginEventPasswordChanged extends LoginEvent{
  final String password;
  const LoginEventPasswordChanged({this.password});
  @override
  // TODO: implement props
  List<Object> get props => [password];
  @override
  String toString() {
    // TODO: implement toString
    return 'Password changed : $password';
  }
}
//Google
class LoginEventWithGooglechanged extends LoginEvent{
}
class LoginEventWithEmailAndPasswordPressed extends LoginEvent{
  final email;
  final password;
  const LoginEventWithEmailAndPasswordPressed({
    @required this.email,
    @required this.password
});
  @override
  // TODO: implement props
  List<Object> get props => [email, password];
  @override
  String toString() {
    // TODO: implement toString
    return 'LoginEventEmailAndPasswordPressed, email = $email, password = $password';
  }
}