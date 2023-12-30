import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/student_cubit/student_cubit.dart';
import 'package:untitled/cubit/subject_cubit/subject_cubit.dart';
import 'package:untitled/data/utils/custom_container.dart';

import '../../cubit/classroom_cubit/classroom_cubit.dart';
import '../classroom/classrooms.dart';

class SubjectList extends StatefulWidget {
  const SubjectList({super.key});

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<SubjectCubit>().getSubjects(context);
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
        title: Text('Subjects'),
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
        child: BlocConsumer<SubjectCubit, SubjectState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is SubjectLoading){

            }else if(state is SubjectLoaded){

              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.subjects.length,
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
                                              Center(child: Text("Subject Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
                                              SizedBox(height: h*0.008,),
                                              Text("Subject  : ${state.subjects[index].name}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                                              Padding(
                                                padding:  EdgeInsets.fromLTRB(0, h*0.007, 0, h*0.007),
                                                child: Text("Teacher : ${state.subjects[index].teacher}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                                              ),
                                              Text("Credits  : ${state.subjects[index].credits}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                                              Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => BlocProvider(
                                                              create: (context) => ClassroomCubit(),
                                                              child: ClassRooms(buttonVisible:true, sub_id: state.subjects[index].id, sut_id: 0,),
                                                            ),
                                                          ));
                                                    },
                                                    child: Container(height: 35,
                                                      width: w*0.7,

                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      child: Center(child: Text("Assign To Class",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),)),
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
                                      state.subjects[index].name,
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
