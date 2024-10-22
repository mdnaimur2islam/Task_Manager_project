import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/Utils/app_colors.dart';
import 'package:taskmanager/widget/screen_background.dart';

class Sing_Up_Screen extends StatefulWidget {
  const Sing_Up_Screen({super.key});

  @override
  State<Sing_Up_Screen> createState() => _Sing_Up_ScreenState();
}

class _Sing_Up_ScreenState extends State<Sing_Up_Screen> {
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
                    'Join With Us',
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

                        const SizedBox(height: 8),
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
            decoration:const InputDecoration(
                hintText: 'First name'
            )
        ),
        const SizedBox(height: 8),
        TextFormField(
            decoration:const InputDecoration(
                hintText: 'Last name'
            )
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.phone,
            decoration:const InputDecoration(
                hintText: 'Phone no'
            )
        ),
        const SizedBox(height: 8),
        TextFormField(
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
    //TODO:
  }

  void _onTapSingIn(){
    Navigator.pop(context);
  }
}
