import 'package:appdatn/blocs/register_bloc.dart';
import 'package:appdatn/screen/register.dart';
import 'package:appdatn/services/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButtonUser extends StatelessWidget {
  UserRepository _userRepository;
  RegisterButtonUser({Key key, @required UserRepository userRepository}):
        assert(userRepository !=null),
        _userRepository = userRepository,
        super(key : key);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 45,
      child: FlatButton(
        color: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return BlocProvider<RegisterBloc>(
                  create: (context) => RegisterBloc(userRepository: _userRepository),
                child: RegisterPape(userRepository: _userRepository,) ,
              );
            })
          );
        },
        child: Text("Register Button User to your account", style: TextStyle(color: Colors.white, fontSize: 16.0),),
      ),
    );
  }
}
