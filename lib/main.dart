import 'package:fieldnxtdemo/bloc/loginbloc/loginbloc.dart';
import 'package:fieldnxtdemo/bloc/profilebloc/profilebloc.dart';
import 'package:fieldnxtdemo/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
              create: (BuildContext context) => LoginBloc()),
                BlocProvider<ProfileBloc>(
              create: (BuildContext context) => ProfileBloc()),
        ],
       child: MaterialApp(
        title: 'FieldNXT Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'poppins',
          primarySwatch: Colors.blue,
        ),
        home: const  Login(),
      ),
    );
  }
}
