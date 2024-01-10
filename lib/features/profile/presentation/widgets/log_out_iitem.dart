import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/utils/navigators.dart';
import 'package:e_commerece_app/features/login/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LogOutItem extends StatelessWidget {
  const LogOutItem({super.key});


  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){

        MyShared.clear().then((value) => pushAndRemoveUntil(context, LoginScreen()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.login_outlined,color: Colors.red,size: 20.sp,),
          SizedBox(width: 3.w,),
          Text("LogOut",style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: 15.sp
          ),)

        ],),
    );
  }
}
