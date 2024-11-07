import 'package:flutter/material.dart';
import 'package:taskmanager/data/ui/controllers/auth_controller.dart';
import 'package:taskmanager/widget/TMAppBar.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  final TextEditingController _emailTEController=TextEditingController();
  final TextEditingController _firstNameTEController=TextEditingController();
  final TextEditingController _lastNameTEController=TextEditingController();
  final TextEditingController _phoneTEController=TextEditingController();
  final TextEditingController _passwordTEController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setUserData();
  }
  void _setUserData(){
    _emailTEController.text=authcontrollers.userData?.email??'';
    _firstNameTEController.text=authcontrollers.userData?.firstName??'';
    _lastNameTEController.text=authcontrollers.userData?.lastName??'';
    _phoneTEController.text=authcontrollers.userData?.mobile??'';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(
        isProfileScreenOpen: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 48,
                ),
                Text(
                  'Update Profile',
                  style:
                  Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                _buildPhotoPicker(),
                const SizedBox(height: 8),
                TextFormField(
                  enabled: false,
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                    hintText: 'Email'
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(
                    hintText: 'First name'
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(
                    hintText: 'last name'
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _phoneTEController,
                  decoration: const InputDecoration(
                    hintText: 'Phone'
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: const InputDecoration(
                    hintText: 'Password'
                  ),
                ),
                const SizedBox(height: 16),

                ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){

                  }
                },
                    child: const Icon(Icons.arrow_circle_right_outlined),

                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoPicker() {
    return Container(
      height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white
              ),
              child: Row
                (
                children: [
                  Container(
                    height: 50,width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)
                      )
                    ),
                    alignment: Alignment.center,
                    child: Text('Photo',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                 const SizedBox(width: 8,),
                 const Text('Selected Photo')
                ],
              ),
            );
  }
}
