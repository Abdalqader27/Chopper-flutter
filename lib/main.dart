import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_chopper/data/post_api_service.dart';
import 'package:provider/provider.dart';

import 'Home Pages.dart';


void main()
  {
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
    {
    // TODO: implement build
    return Provider(
      create: (_)
      => PostApiServices.create(),
      dispose: (_, PostApiServices services)
      => services.client.dispose(),
      child: MaterialApp(
      home: Home_page(),
    ),);
    }
}