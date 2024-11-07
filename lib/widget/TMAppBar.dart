import 'package:flutter/material.dart';
import 'package:taskmanager/Utils/app_colors.dart';
import 'package:taskmanager/data/ui/controllers/auth_controller.dart';
import 'package:taskmanager/screens/profile_screen.dart';
import 'package:taskmanager/screens/sing_in_screen.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
    this.isProfileScreenOpen=false,
  });
  final bool isProfileScreenOpen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(isProfileScreenOpen){
          return;
        }
        Navigator.push(context, MaterialPageRoute(builder: (context)=>profile_screen(),
        ),
        );
      },
      child: AppBar(
        backgroundColor: AppColors.ThemeColor,
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
            ),
            const SizedBox(width: 16),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authcontrollers.userData?.fullName??'',
                      style:const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      authcontrollers.userData?.email??'',
                      style:const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
            IconButton(onPressed: () async{
              await authcontrollers.clearUserData();
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(
                    builder: (context)=>const sing_in_screen(),),
                      (predicate)=>false);
              },
                icon: const Icon(Icons.logout))
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}