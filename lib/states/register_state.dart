import 'package:meta/meta.dart';

// lop khong the thay doi
@immutable
class RegisterState{
  final bool isValidEmail;
  final bool isVaidPassword;
  final bool isSubmiting;
  final bool isSucccess;
  final bool isFailure;
  bool get isValidEmailAndPassword => isValidEmail ?? isVaidPassword;

  RegisterState({
    @required this.isValidEmail,
    @required this.isVaidPassword,
    @required this.isSubmiting,
    @required this.isSucccess,
    @required this.isFailure,
  });

  factory RegisterState.initial(){
    return RegisterState(
        isValidEmail: true,
        isVaidPassword: true,
        isSubmiting: false,
        isSucccess: false,
        isFailure: false);
  }
  factory RegisterState.loading(){
    return RegisterState(
        isValidEmail: true,
        isVaidPassword: true,
        isSubmiting: true,
        isSucccess: false,
        isFailure: false);
  }
  factory RegisterState.failure(){
    return RegisterState(
        isValidEmail: true,
        isVaidPassword: true,
        isSubmiting: true,
        isSucccess: false,
        isFailure: true);
  }
  factory RegisterState.success(){
    return RegisterState(
        isValidEmail: true,
        isVaidPassword: true,
        isSubmiting: false,
        isSucccess: true,
        isFailure: false);
  }

  RegisterState cloneWith({
    bool isValidEmail,
    bool isVaidPassword,
    bool isSubmiting,
    bool isSucccess,
    bool isFailure
  }){
    return RegisterState(
        isValidEmail: isValidEmail ?? this.isValidEmail,
        isVaidPassword: isVaidPassword ?? this.isVaidPassword,
        isSubmiting: isSubmiting ?? this.isSubmiting,
        isSucccess: isSucccess ?? this.isSucccess,
        isFailure: isFailure ?? this.isFailure
    );
  }

  RegisterState cloneAndUpdate({
    bool isValidEmail,
    bool isVaidPassword,
  }){
    return cloneWith(
        isValidEmail: isValidEmail,
        isVaidPassword: isVaidPassword
    );
  }

}