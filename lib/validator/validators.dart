class Validators {
  static isValidEmail(String email){
    final regularExpression = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regularExpression.hasMatch(email);
    //kiem tra dinh dang email
  }
  static isValidPassword(String password){
    return password.length>=5;
  }
}