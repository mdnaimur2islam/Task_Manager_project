import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/Utils/app_colors.dart';
import 'package:taskmanager/data/Utils/uris.dart';
import 'package:taskmanager/data/models/UserModel.dart';
import 'package:taskmanager/data/models/network_response.dart';
import 'package:taskmanager/data/services/network_caller.dart';
import 'package:taskmanager/data/ui/controllers/auth_controller.dart';
import 'package:taskmanager/screens/forgot_password_otp_screen.dart';
import 'package:taskmanager/widget/screen_background.dart';

class Forgot_password_emailScreen extends StatefulWidget {
  const Forgot_password_emailScreen({super.key});

  @override
  State<Forgot_password_emailScreen> createState() => _Forgot_password_emailScreenState();
}

class _Forgot_password_emailScreenState extends State<Forgot_password_emailScreen> {
  final TextEditingController _emailTEController=TextEditingController();

  @override


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
                    'Your Email Address',
                    style:
                    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A 6 digit verification code will be sent to your email address',
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
        TextFormField(
          controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            decoration:const InputDecoration(
                hintText: 'Email'
            ),
          validator: (String? value) {
            if (value?.trim().isEmpty ?? true) {
              return 'Enter your email';
            }
            return null;
          },
        ),

        const SizedBox(height: 16),
        ElevatedButton(

            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgot_password_OTP_Screen(),
              ),
              );
            },
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


  void _onTapSingIn(){
    Navigator.pop(context);
  }
}
