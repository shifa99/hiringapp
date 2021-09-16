import 'package:flutter/material.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/network/local/cache_helper.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

import '../who_are_you_screen.dart';

void logoutEmployee(BuildContext context,{String tokenKey,String tokenEmp,String url}){
  print('tokenEE1 :$tokenEmployee');
  print('tokenER2 :$tokenEmployer');


  DioHelper.postData(url: url,token: tokenEmp).then((value) {
    print(value.data);
    print(value.statusMessage);
    if(value.data['status'] == false){
      print('Status :${value.data['status']}');
    }else{
      print('Status :${value.data['status']}');
      CacheHelper.removeData(key: '$tokenKey');
      navigateAndFinish(context, WhoAreYouScreen());
      tokenEmployee = '';
      tokenEmployer = '';

    }

  }).catchError((e){print('EE $e');});

}