import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/classroom_cubit/classroom_cubit.dart';
import 'package:untitled/cubit/student_cubit/student_cubit.dart';
import 'package:untitled/cubit/subject_cubit/subject_cubit.dart';
import 'package:untitled/data/utils/custom_container.dart';

class ClassRooms extends StatefulWidget {
  final bool buttonVisible;
  final int sub_id;
  final int sut_id;
  const ClassRooms({super.key, required this.buttonVisible, required this.sub_id, required this.sut_id});

  @override
  State<ClassRooms> createState() => _ClassRoomsState();
}

class _ClassRoomsState extends State<ClassRooms> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<ClassroomCubit>().getClassRooms(context);
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('ClassRooms'),
        titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.black),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<ClassroomCubit, ClassroomState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is ClassroomLoding){

            }else if(state is ClassroomLoaded){

              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.classroom.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          double h=MediaQuery.of(context).size.height;
                          double w=MediaQuery.of(context).size.width;
                          return  PopScope(
                            canPop: true,
                            child: Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child: FractionallySizedBox(
                                widthFactor: 1.1,
                                child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(

                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Center(child: Text("ClassRoom Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
                                              SizedBox(height: h*0.008,),
                                              Text("Name  : ${state.classroom[index].name}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                                              Padding(
                                                padding:  EdgeInsets.fromLTRB(0, h*0.007, 0, h*0.007),
                                                child: Text("Layout : ${state.classroom[index].layout}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                                              ),
                                              Text("Size     : ${state.classroom[index].size}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                                              Center(
                                                child: Visibility(
                                                  visible: widget.buttonVisible,
                                                  replacement: Container(),
                                                  child: Padding(
                                                    padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        if(widget.sub_id!=0){
                                                          context.read<ClassroomCubit>().assignSubject(context: context, id: state.classroom[index].id, subject: widget.sub_id);
                                                        }
                                                        if(widget.sut_id!=0){
                                                          context.read<ClassroomCubit>().assignSudent(context: context, id: state.classroom[index].id, student: widget.sut_id);
                                                        }
                                                      },
                                                      child: Container(height: 35,
                                                        width: w*0.7,

                                                        decoration: BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: Center(child: Text("Assign",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )


                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon (Icons.cancel),color: Colors.red,),
                                          ],
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          );
                        },
                      );


                    },
                    child: CustomContanier(
                        child: Padding(
                          padding:  EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.classroom[index].name,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),


                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        borderradius: 8,
                        height: h*0.09,
                        width: w*0.8),
                  ),
                ),
              );
            }return Container();},
        ),
      ),
    );
  }
}
