import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegsiterEvent extends Equatable{
  const RegsiterEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class RegsiterEventEmailChanged extends RegsiterEvent{
  final String email;
  const RegsiterEventEmailChanged({this.email});
  @override
  // TODO: implement props
  List<Object> get props => [email];
  @override
  String toString() {
    // TODO: implement toString
    return 'RegsiterEventEmailChanged Email changed : $email';
  }
}

class RegsiterEventPasswordChanged extends RegsiterEvent{
  final String password;
  const RegsiterEventPasswordChanged({this.password});
  @override
  // TODO: implement props
  List<Object> get props => [password];
  @override
  String toString() {
    // TODO: implement toString
    return 'RegsiterEvent Password changed : $password';
  }
}

class RegsiterEventWithGooglechanged extends RegsiterEvent{
}
class RegsiterEventPressed extends RegsiterEvent{
  final email;
  final password;
  const RegsiterEventPressed({
    @required this.email,
    @required this.password
  });
  @override
  // TODO: implement props
  List<Object> get props => [email, password];
  @override
  String toString() {
    // TODO: implement toString
    return 'RegsiterEvent EmailAndPasswordPressed, email = $email, password = $password';
  }
}