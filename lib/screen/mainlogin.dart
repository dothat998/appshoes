
import 'package:appdatn/blocs/Authentication_bloc.dart';
import 'package:appdatn/blocs/login_bloc.dart';
import 'package:appdatn/events/authenticaton_events.dart';
import 'package:appdatn/home.dart';
import 'package:appdatn/screen/login.dart';
import 'package:appdatn/screen/SplashPage.dart';
import 'package:appdatn/services/user_repository.dart';
import 'package:appdatn/states/authentication_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainLogin extends StatelessWidget {

  final UserRepository _userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Login with shop shoe",
      home: BlocProvider(
        // tra ve doi tuong bloc
        create: (context) => AuthenticationBloc(userRepository: _userRepository)
          ..add(AuthenticationEventStarted()),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState > (
          builder: (context, authenticationState){
            if(authenticationState is AuthenticationStateSuccess){
              return  HomePage();
            }else if(authenticationState is AuthenticationStateFailure){
              return BlocProvider(
                create: (context) => LoginBloc(userRepository: _userRepository),
                child:LoginPage(userRepository: _userRepository,),
                //LoginPage,
              );
            }
            return SplashPage();
          },
      ),
    ),);
  }
}
