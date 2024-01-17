import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Login_bloc/Login.dart';
import 'package:myapp/Login_bloc/Login_event.dart';
import 'package:myapp/Login_bloc/Login_state.dart';
import 'package:myapp/UI/Employee_list.dart';



// UI Components
class LoginPage extends StatelessWidget 
{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
      title: const Text("Login"),
      centerTitle: true,
       actions: 
          [
          IconButton
          (
            icon: const Icon(Icons.person),
            tooltip: 'Login',
            onPressed: () 
            {
           //   ("Login");
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login by clicking on the Login button below ')),
            );
           },
           ),
          ],
      ),
      body: BlocProvider
      (
        create: (context) => AuthBloc(),
        child: LoginForm(),
      ),
    );
  }
}

 class LoginForm extends StatelessWidget
 {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginForm({super.key});
  @override
  Widget build(BuildContext context) 
  {
    return BlocListener<AuthBloc, AuthState>
    (
      listener: (context, state) 
      {
        if (state is AuthSuccess) 
        {
          // Navigate to the employee dashboard after successful login
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EmployeeDashboard()));
        } 
        else if (state is AuthError) 
        {
          // Display an error message
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>
      (
        builder: (context, state) 
        {
          return Padding
        (
           padding: const EdgeInsets.all(16.0),
           child: GestureDetector
        (
             onTap: () 
        {
          // Remove focus when user taps on the screen
          FocusScope.of(context).unfocus();
        },
             child: SingleChildScrollView
             (
                     scrollDirection: Axis.vertical,
                     dragStartBehavior: DragStartBehavior.start,
                     child: Form
                     (
                       key: _formKey,
                       child: Column
                     (
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                Center
                (  
                  child: Image.asset
                  (    
                  height:250,
                  "assetss/users/login.png",
                  ),
                ),
             
                TextFormField
                (
                  controller: emailController,
                  decoration: const InputDecoration
                  (
                  icon: Icon(Icons.person, color: Colors.blueAccent),
                  hintText: 'Enter your full name',
                  labelText: 'Name',
                  isDense: true,
                  ),
                  validator: (value) 
                  {
                    if (value!.isEmpty) 
                  {
                      return 'Please enter some text';
                  }
                    return null;
                  },
                  ),
                 
                TextFormField
                (
                  controller: passwordController,
                  decoration: const InputDecoration
                  (
                    icon: Icon(Icons.password, color: Colors.blueAccent),
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    isDense: true
                  ),
                  obscureText: true,
                
                ),
                
                Container
                (
                  padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                 child: ElevatedButton
                 (
                    style: ElevatedButton.styleFrom
                    (
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder
                    (
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    ),
                     onPressed: () 
                     {
                      // Dispatch the login event with the entered email and password
                      context.read<AuthBloc>().add
                      (
                        LoginButtonPressed
                      (
                      email: emailController.text,
                      password: passwordController.text,
                       )
                       );
                    },
                    child: const Text('Login'),
                  ),
                ),
                 
                
                // RichText 
                        Padding
                        (
                       padding: const EdgeInsets.only(top:15.0),
                       child: Center
                       (
                       child: RichText
                       (  
                             text: TextSpan
                             (  
                             text: 'Don\'t have an account?',  
                             style: const TextStyle(color: Colors.black, fontSize: 20),  
                             children: <TextSpan>
                            [  
                              TextSpan
                              (
                              text: ' Sign up',  
                              style: const TextStyle
                              (color: Colors.blueAccent, fontSize: 20),  
                              recognizer: TapGestureRecognizer()  
                              ..onTap = () 
                              {
                              ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Sign up is not yet supported.')));
                             }
                          )  
                        ]  
                      ),  
                     ),
                  ),
                ),
              ],
             ),
           ),
          ),
        ),
       );  
      },
     ),
    );
  }  
}
            
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
              