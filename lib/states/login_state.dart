import 'package:meta/meta.dart';

// lop khong the thay doi
@immutable
class LoginState{
  final bool isValidEmail;
  final bool isVaidPassword;
  final bool isSubmiting;
  final bool isSucccess;
  final bool isFailure;
  bool get isValidEmailAndPassword => isValidEmail ?? isVaidPassword;

  LoginState({
    @required this.isValidEmail,
    @required this.isVaidPassword,
    @required this.isSubmiting,
    @required this.isSucccess,
    @required this.isFailure,
  });

  //kiem tra cac trang thai
  factory LoginState.initial(){
    return LoginState(
        isValidEmail: true,
        isVaidPassword: true,
        isSubmiting: false,
        isSucccess: false,
        isFailure: false);
  }
  factory LoginState.loading(){
    return LoginState(
        isValidEmail: true,
        isVaidPassword: true,
        isSubmiting: true,
        isSucccess: false,
        isFailure: false);
  }
  factory LoginState.failure(){
    return LoginState(
        isValidEmail: true,
        isVaidPassword: true,
        isSubmiting: true,
        isSucccess: false,
        isFailure: true);
  }
  factory LoginState.success(){
    return LoginState(
        isValidEmail: true,
        isVaidPassword: true,
        isSubmiting: false,
        isSucccess: true,
        isFailure: false);
  }
//nhan ban 1 trang thai bat ki sang vung nho khac
  LoginState cloneWith({
    bool isValidEmail,
    bool isVaidPassword,
    bool isSubmiting,
    bool isSucccess,
    bool isFailure
  }){
    return LoginState(
        isValidEmail: isValidEmail ?? this.isValidEmail,
        isVaidPassword: isVaidPassword ?? this.isVaidPassword,
        isSubmiting: isSubmiting ?? this.isSubmiting,
        isSucccess: isSucccess ?? this.isSucccess,
        isFailure: isFailure ?? this.isFailure
    );
  }

  LoginState cloneAndUpdate({
    bool isValidEmail,
    bool isVaidPassword,
}){
  return cloneWith(
    isValidEmail: isValidEmail,
    isVaidPassword: isVaidPassword,
      isSubmiting: false,
      isSucccess: true,
      isFailure: false
  );
}

}