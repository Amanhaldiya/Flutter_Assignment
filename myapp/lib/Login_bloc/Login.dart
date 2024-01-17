

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Login_bloc/Login_event.dart';
import 'package:myapp/Login_bloc/Login_state.dart';






class AuthBloc extends Bloc<AuthEvent, AuthState>
 {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async*
   {
    if (event is LoginButtonPressed) {
      // Validate email and password using the provided validator
      if (validateEmail(event.email) != null || validatePassword(event.password) != null)
       {
        yield AuthError("Invalid email or password");
      } 
      else 
      {
        // Simulate a successful login for demonstration purposes
        await Future.delayed(const Duration(seconds: 2));
       
        yield AuthSuccess(); // or AuthError if login fails
      }
    }
  }
  
  String? validateEmail(String value)
   {
    if (value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? validatePassword(String value) 
  {
    if (value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
