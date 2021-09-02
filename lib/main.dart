import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gstsampleproject/view/screens/details_screen.dart';
import 'package:gstsampleproject/view_model/gst_view_model.dart';
import 'package:provider/provider.dart';
import 'view/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: GstViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context)=> HomeScreen(),
          '/details': (context)=> DetailsScreen(),
          '*': (context)=> HomeScreen(),
        },
      ),
    );
  }
}
