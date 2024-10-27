import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/Utils/app_colors.dart';
import 'package:taskmanager/data/Utils/snack_bar_message.dart';
import 'package:taskmanager/data/Utils/uris.dart';
import 'package:taskmanager/data/models/network_response.dart';
import 'package:taskmanager/data/services/network_caller.dart';
import 'package:taskmanager/widget/center_circular_indicator.dart';
import 'package:taskmanager/widget/screen_background.dart';

class Sing_Up_Screen extends StatefulWidget {
  const Sing_Up_Screen({super.key});

  @override
  State<Sing_Up_Screen> createState() => _Sing_Up_ScreenState();
}

class _Sing_Up_ScreenState extends State<Sing_Up_Screen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _inProgress = false;
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
      )),
    );
  }

  Widget _buildSingInForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Email'),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _firstNameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(hintText: 'First name'),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter valid first name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _lastNameTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(hintText: 'Last name'),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter valid last name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _mobileTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: 'Phone no'),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter valid phone no';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(hintText: 'password'),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter valid password';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          Visibility(
            visible: !_inProgress,
            replacement: center_circular_indicator(),
            child: ElevatedButton(
                onPressed: _OnTapNextButton,
                child: const Icon(Icons.arrow_forward_rounded)),
          ),
        ],
      ),
    );
  }

  Widget _buildHaveAccountSection() {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w100,
                fontSize: 14,
                letterSpacing: 0.5),
            text: "Have account? ",
            children: [
          TextSpan(
              text: 'Sing In',
              style: TextStyle(
                color: AppColors.ThemeColor,
              ),
              recognizer: TapGestureRecognizer()..onTap = _onTapSingIn)
        ]));
  }

  void _OnTapNextButton() {
    if (_formkey.currentState!.validate()) {
      _sing_Up();
    }
  }

  Future<void> _sing_Up() async {
    _inProgress = true;
    setState(() {});

    Map<String,dynamic> requestBody={
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _passwordTEController.text,

    };
    network_response response = await network_caller.postRequest(
        url: uris.registration,
      body: requestBody,
    );
    _inProgress=false;
    setState(() {});
    if (response.isSuccess) {
      _clearTextFields();
     snack_bar_message(context,'NEW User Created');
    } else {
      snack_bar_message(context, response.errorMessage,true);
    }
  }
void _clearTextFields(){
    _passwordTEController.clear();
  _mobileTEController.clear();
  _lastNameTEController.clear();
  _firstNameTEController.clear();
  _mobileTEController.clear();

}
  void _onTapSingIn() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
  }
}
