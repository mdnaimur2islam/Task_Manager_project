import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/Utils/app_colors.dart';
import 'package:taskmanager/screens/forgot_password_email_screen.dart';
import 'package:taskmanager/screens/sing_up_Screen.dart';
import 'package:taskmanager/widget/screen_background.dart';

class sing_in_screen extends StatefulWidget {
  const sing_in_screen({super.key});

  @override
  State<sing_in_screen> createState() => _sing_in_screenState();
}

class _sing_in_screenState extends State<sing_in_screen> {
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
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
            decoration:const InputDecoration(
                hintText: 'Email'
            )
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: true,
            decoration:const InputDecoration(
                hintText: 'password'
            )
        ),
        const SizedBox(height: 8),
        ElevatedButton(

            onPressed: _OnTapNextButton,
            child: const Icon(Icons.arrow_forward_rounded)
        ),
      ],
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
    //TODO:
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
