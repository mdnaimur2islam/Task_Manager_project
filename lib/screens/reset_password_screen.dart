import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/Utils/app_colors.dart';
import 'package:taskmanager/screens/forgot_password_otp_screen.dart';
import 'package:taskmanager/screens/sing_in_screen.dart';
import 'package:taskmanager/widget/screen_background.dart';

class reset_password_screen extends StatefulWidget {
  const reset_password_screen({super.key});

  @override
  State<reset_password_screen> createState() => _reset_password_screenState();
}

class _reset_password_screenState extends State<reset_password_screen> {
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
                    'Set Password',
                    style:
                    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Minimum number of password should be 8 character ',
                    style:
                    textTheme.titleSmall?.copyWith(),
                  ),
                  const SizedBox(height: 24),
                  _buildResetPasswordForm(),
                  const SizedBox(height: 24),

                  const SizedBox(height: 8),
                  Center(
                    child: Column(
                      children: [

                        const SizedBox(height: 42),
                        _buildHaveAccountSection(),
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


  Widget _buildResetPasswordForm() {
    return Column(
      children: [
        TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration:const InputDecoration(
                hintText: 'password'
            )
        ),
        const SizedBox(height: 16),
        TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration:const InputDecoration(
                hintText: 'password'
            )
        ),

        const SizedBox(height: 16),
        ElevatedButton(

            onPressed: _OnTapNextButton,
            child: const Text('Confirm')
        ),
      ],
    );

  }
  Widget _buildHaveAccountSection() {
    return RichText(text:  TextSpan(
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w100,
            fontSize: 14,
            letterSpacing: 0.5
        ),
        text: "Have account? ",
        children: [
          TextSpan(
              text: 'Sing In',
              style: TextStyle(
                color: AppColors.ThemeColor,
              ),
              recognizer: TapGestureRecognizer()..onTap= _onTapSingIn
          )
        ]
    )
    );
  }
  void _OnTapNextButton(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const sing_in_screen()),
          (_)=>false,);
  }

  void _onTapSingIn(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const sing_in_screen()),
          (_)=>false,);
  }
}
