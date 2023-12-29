import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/utils/custom_container.dart';
import 'package:untitled/data/utils/gridview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Home'),
        titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.black),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: AlignedGrid(mainSpacing: 20, spacing: 20, columns: 2, widgets: [
         GestureDetector(
            onTap: (){


            },
            child: CustomContanier(
                child: Center(
                    child: Text(
                  "Students",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  textScaler: TextScaler.linear(1),
                )),
                borderradius: 10,
                height: h * 0.15,
                width: w*0.9 ),
          ), GestureDetector(
            onTap: (){

            },
            child: CustomContanier(
                child: Center(
                    child: Text(
                  "Subjects",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  textScaler: TextScaler.linear(1),
                )),
                borderradius: 10,
                height: h * 0.15,
                width: w *0.9),
          ), GestureDetector(
            onTap: (){

            },
            child: CustomContanier(
                child: Center(
                    child: Text(
                  "Classrooms",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  textScaler: TextScaler.linear(1),
                )),
                borderradius: 10,
                height: h * 0.15,
                width: w *0.9),
          ),
        ]),
      ),
    );
  }
}
