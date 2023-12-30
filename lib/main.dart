import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/classroom_cubit/classroom_cubit.dart';
import 'package:untitled/cubit/student_cubit/student_cubit.dart';
import 'package:untitled/cubit/subject_cubit/subject_cubit.dart';
import 'package:untitled/screens/classroom/classrooms.dart';
import 'package:untitled/screens/homepage/homepage.dart';
import 'package:untitled/screens/student/student_list.dart';
import 'package:untitled/screens/subject/subject_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => ClassroomCubit()),
    BlocProvider(create: (context) => StudentCubit(),)
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:HomePage(),
    );
  }
}
