import 'package:appdatn/blocs/Authentication_bloc.dart';
import 'package:appdatn/blocs/register_bloc.dart';
import 'package:appdatn/button/register_Button.dart';
import 'package:appdatn/events/authenticaton_events.dart';
import 'package:appdatn/events/register_event.dart';
import 'package:appdatn/services/user_repository.dart';
import 'package:appdatn/states/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPape extends StatefulWidget {
  final UserRepository _userRepository;
  RegisterPape({Key key, @required UserRepository userRepository}):
        assert(UserRepository !=null),
        _userRepository = userRepository,
        super(key: key);
  @override
  _RegisterPapeState createState() => _RegisterPapeState();
}

class _RegisterPapeState extends State<RegisterPape> {
  UserRepository get _userRepository => widget._userRepository;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RegisterBloc _registerBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  //dieu kien toi thieu 2 gia tri Text =  notEnty
  bool get isPopuLated => _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
  //kierm tra button, de hien thi mau xanh len
  bool isRegisterButtonEnable(RegisterState registerState){
    registerState.isValidEmailAndPassword & isPopuLated && !registerState.isSubmiting;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text ("Đăng Kí"),),
      body: Center(
        child: BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(userRepository: _userRepository),
              child: BlocBuilder<RegisterBloc, RegisterState>(
                builder:(context, registerSate){
                if(registerSate.isFailure){
                print("Register Failure");
                 }else if(registerSate.isSubmiting){
                  print("Register in");
                  }else if(registerSate.isSucccess){
                  BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationEventLoggedIn());
               }
              //hien thhi cho nguoi dung login
                return Padding(
                padding: EdgeInsets.all(20.0),
                  child: Form(
                    child: ListView(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText: "Enter your email"
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autovalidate: true,
                        autocorrect: false,
                        validator: (_){
                          return registerSate.isValidEmail ? null : "Định dạng email không chính xác";
                        },
                      ),

                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText: "Enter your password"
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        autocorrect: false,
                        autovalidate: true,
                        validator: (_){
                          return registerSate.isValidEmail ? null : "Định dạng pass không chính xác";
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: RegisterButton(
                          onPressed:(){
                             if(isRegisterButtonEnable(registerSate)){
                               _registerBloc.add(
                               RegsiterEventPressed(
                                   email: _emailController.text,
                                   password: _passwordController.text),
                               );
                             }
                          }// thuc thi ham
                         )
                      )
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    )
    );
  }

}
