import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager/Utils/app_colors.dart';
import 'package:taskmanager/screens/reset_password_screen.dart';
import 'package:taskmanager/screens/sing_in_screen.dart';
import 'package:taskmanager/widget/screen_background.dart';

class Forgot_password_OTP_Screen extends StatefulWidget {
  const Forgot_password_OTP_Screen({super.key});

  @override
  State<Forgot_password_OTP_Screen> createState() => _Forgot_password_OTP_ScreenState();
}

class _Forgot_password_OTP_ScreenState extends State<Forgot_password_OTP_Screen> {
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
                    'Pin Verification',
                    style:
                    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A 6 digit verification OTP code has been sent to your email address',
                    style:
                    textTheme.titleSmall?.copyWith(),
                  ),
                  const SizedBox(height: 24),
                  _buildRecoveryEmailForm(),
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


  Widget _buildRecoveryEmailForm() {
    return Column(
      children: [
        PinCodeTextField(
          length: 6,
          obscureText: false,
          keyboardType: TextInputType.number,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            selectedFillColor: Colors.white
          ),
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          appContext:context,
        ),

         const SizedBox(height: 16),
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
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const reset_password_screen(),
    ),
    );
  }

  void _onTapSingIn(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const sing_in_screen()),
          (_)=>false,);
  }
}
