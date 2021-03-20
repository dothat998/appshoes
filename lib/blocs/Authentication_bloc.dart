import 'package:appdatn/events/authenticaton_events.dart';
import 'package:appdatn/services/user_repository.dart';
import 'package:appdatn/states/authentication_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{

  final UserRepository _userRepository;
  //contrustor
  AuthenticationBloc({@required UserRepository userRepository}):
  assert(userRepository !=null),
  //kiem tra neu user khac null moi cho khoi tao
  _userRepository = userRepository,
  //initial state
  super(AuthenticationStateInitial());
  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent authenticationEvent) async*{
    //kiem tra dau vaof
    if(authenticationEvent is AuthenticationEventStarted){
      final isSignIn = await _userRepository.isSignIn();
      //neu da dang nhap thi se lay ra User
      if(isSignIn){
       final firebaseUser = await _userRepository.getUser();
        //tra ve trang thai moi (State cu - State moi)
        yield AuthenticationStateSuccess(firebaseUser: firebaseUser);
      }
      else{
        yield AuthenticationStateFailure();
      }
    }
    else if(authenticationEvent is AuthenticationEventLoggedIn){
      yield AuthenticationStateSuccess(firebaseUser: await _userRepository.getUser());
    }
    else if( authenticationEvent is AuthenticationEventLoggedOut){
      _userRepository.signOut();
      yield AuthenticationStateFailure();
    }
  }
}