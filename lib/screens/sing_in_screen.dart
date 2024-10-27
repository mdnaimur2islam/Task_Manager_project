import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/Utils/app_colors.dart';
import 'package:taskmanager/data/Utils/snack_bar_message.dart';
import 'package:taskmanager/data/Utils/uris.dart';
import 'package:taskmanager/data/models/network_response.dart';
import 'package:taskmanager/data/services/network_caller.dart';
import 'package:taskmanager/data/ui/controllers/auth_controller.dart';
import 'package:taskmanager/screens/forgot_password_email_screen.dart';
import 'package:taskmanager/screens/main_bottom_navbar.dart';
import 'package:taskmanager/screens/sing_up_Screen.dart';
import 'package:taskmanager/widget/center_circular_indicator.dart';
import 'package:taskmanager/widget/screen_background.dart';


class sing_in_screen extends StatefulWidget {
  const sing_in_screen({super.key});

  @override
  State<sing_in_screen> createState() => _sing_in_screenState();
}

class _sing_in_screenState extends State<sing_in_screen> {
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  final TextEditingController _emailTEController=TextEditingController();
  final TextEditingController _passwordTEController=TextEditingController();
  bool _inProgress=false;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(

      body: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
            children: [
              const SizedBox(
                height: 82,
              ),
              Text(
                'Get Started With',
                style:
                    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              _buildSingInForm(),
              const SizedBox(height: 24),

              const SizedBox(height: 8),
              Center(
                child: Column(
                  children: [
                    TextButton(
                        onPressed: _OnTapForgotPasswordButton,
                        child: const Text('Forget Password?',style: TextStyle(
                          color: Colors.grey,
                        ),)
                    ),
                    const SizedBox(height: 8),
                    _buildSingUpSection(),
                  ],
                ),
              )
            ],
                    ),
                  ),
          )
      ),
    );
  }

  Widget _buildSingInForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller:_emailTEController ,
            keyboardType: TextInputType.emailAddress,
              decoration:const InputDecoration(
                  hintText: 'Email'
              ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _passwordTEController,
            obscureText: true,
              decoration:const InputDecoration(
                  hintText: 'password'
              ),  validator: (String? value){
            if(value?.isEmpty ?? true){
              return 'Enter a valid password';
            }
            if(value!.length<=6){
              return 'Enter a password more than 6 characters';
            }
            return null;
          },
          ),
          const SizedBox(height: 8),
          Visibility(
            visible: !_inProgress,
            replacement: const center_circular_indicator(),
            child: ElevatedButton(

                onPressed: _OnTapNextButton,
                child: const Icon(Icons.arrow_forward_rounded)
            ),
          ),
        ],
      ),
    );

  }
  Widget _buildSingUpSection() {
    return RichText(text:  TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w100,
                        fontSize: 14,
                      letterSpacing: 0.5
                    ),
                    text: "Don't have any account? ",
                    children: [
                      TextSpan(
                        text: 'Sing Up',
                        style: TextStyle(
                          color: AppColors.ThemeColor,
                        ),
                        recognizer: TapGestureRecognizer()..onTap= _onTapSingUp
                      )
                    ]
                  )
    );
  }

  void _OnTapNextButton(){
    if(!_formKey.currentState!.validate()){
      return;
    }
    _singIn();
  }
  Future<void> _singIn() async{
    _inProgress=true;
    setState(() {});
    Map<String,dynamic>requestBody={

        "email": _emailTEController.text.trim(),
        "password":_passwordTEController.text

    };
    final network_response response=await network_caller.postRequest(url: uris.login,body: requestBody);
    _inProgress=false;
    setState(() {});
    if(response.isSuccess){
      await authcontrollers.saveAccessToken(response.responseData['token']);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const main_bottom_navbar(),
      ),
            (value)=>false,
      );
    }
    else
      {
        snack_bar_message(context, response.errorMessage,true);
      }
  }

  void _OnTapForgotPasswordButton(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const Forgot_password_emailScreen(),
    ),
    );
  }
  void _onTapSingUp(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=> const Sing_Up_Screen(),
    )
    );
  }
}
