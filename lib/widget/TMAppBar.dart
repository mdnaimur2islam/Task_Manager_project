import 'package:flutter/material.dart';
import 'package:taskmanager/Utils/app_colors.dart';
import 'package:taskmanager/screens/sing_in_screen.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                    'MD Naimur Islam Nissan',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'mdnaimur122@gmail.com',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )
                ],
              )),
          IconButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(
                  builder: (context)=>const sing_in_screen(),),
                    (predicate)=>false);
            },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}