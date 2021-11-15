import 'file:///C:/Users/ali%20elsayed/AndroidStudioProjects/e_commerce/lib/helper/binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/control_view.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:ControlView(),
      initialBinding: Binding(),
      theme: ThemeData(
        fontFamily: 'Source Sans Pro'
      ),
    );
  }
}
