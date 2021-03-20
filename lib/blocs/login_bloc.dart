import 'package:appdatn/events/login_event.dart';
import 'package:appdatn/services/user_repository.dart';
import 'package:appdatn/states/login_state.dart';
import 'package:appdatn/validator/validators.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  UserRepository _userRepository;
  LoginBloc({@required UserRepository userRepository}):
      assert(userRepository !=null),
  _userRepository = userRepository,
  super(LoginState.initial());

  // 2 lan bam nut send thi can phai co time tre giua 2 lan nhan nut
  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(Stream<LoginEvent> loginEvents, transitionFunction) {
    final debounceStream = loginEvents.where((loginEvents){
      return (loginEvents is LoginEventPasswordChanged || loginEvents is LoginEventEmailChanged);
    }).debounceTime(Duration(milliseconds: 300));
    final nonDebounStream = loginEvents.where((loginEvents){
      return (loginEvents is! LoginEventEmailChanged && loginEvents is! LoginEventPasswordChanged);
    });
    return super.transformEvents(nonDebounStream.mergeWith([debounceStream]), transitionFunction);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent loginEvent) async* {
    // TODO: implement mapEventToStat
    final loginState = state;
    if(loginEvent is LoginEventEmailChanged){
      yield loginState.cloneAndUpdate(isValidEmail: Validators.isValidEmail(loginEvent.email));
    }
    else if(loginEvent is LoginEventPasswordChanged){
      yield loginState.cloneAndUpdate(isVaidPassword: Validators.isValidPassword(loginEvent.password));
    }
    else if(loginEvent is LoginEventWithGooglechanged){
      try{
        await _userRepository.signInWithGoogle();
        yield LoginState.success();
      }
      catch (_){
        yield LoginState.failure();
      }
    }
    else if(loginEvent is LoginEventWithEmailAndPasswordPressed){
      try{
        await _userRepository.SignInWithEmailAndPassword(loginEvent.email, loginEvent.password);
        yield LoginState.success();
      }
      catch (_){
        yield LoginState.failure();
      }
    }
  }
}