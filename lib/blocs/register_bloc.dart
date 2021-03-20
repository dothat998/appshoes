import 'package:appdatn/events/login_event.dart';
import 'package:appdatn/events/register_event.dart';
import 'package:appdatn/services/user_repository.dart';
import 'package:appdatn/states/login_state.dart';
import 'package:appdatn/states/register_state.dart';
import 'package:appdatn/validator/validators.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Bloc<RegsiterEvent, RegisterState>{
  UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository}):
        assert(userRepository !=null),
        _userRepository = userRepository,
        super(RegisterState.initial());

  // 2 lan bam nut send thi can phai co time tre giua 2 lan nhan nut
  @override
  Stream<Transition<RegsiterEvent,RegisterState>> transformEvents(
      Stream<RegsiterEvent> events, transitionFunction) {
    final debounceStream = events.where((events){
      return (events is RegsiterEventPasswordChanged || events is RegsiterEventEmailChanged);
    }).debounceTime(Duration(milliseconds: 300));
    final nonDebounStream = events.where((events){
      return (events is! RegsiterEventEmailChanged && events is! RegsiterEventPasswordChanged);
    });
    return super.transformEvents(nonDebounStream.mergeWith([debounceStream]), transitionFunction);
  }

  @override
  Stream<RegisterState> mapEventToState(RegsiterEvent  regsiterEvent) async* {
    if(regsiterEvent is RegsiterEventEmailChanged){
      yield state.cloneAndUpdate(
        isValidEmail: Validators.isValidEmail(regsiterEvent.email)
      );
    }
    else if(regsiterEvent is RegsiterEventPasswordChanged){
      yield state.cloneAndUpdate(isVaidPassword: Validators.isValidPassword(regsiterEvent.password));
    }
    else if( regsiterEvent is RegsiterEventPressed){
      yield RegisterState.loading();
      try{
        await _userRepository.createUserWithEmailAndPassword(
          regsiterEvent.email,
          regsiterEvent.password,
        );
        yield RegisterState.success();
      }
      catch(_){
        yield RegisterState.failure();
      }
    }
  }
}