import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:learn_shared_pref/app.dart';
import 'package:learn_shared_pref/models/person_model.dart';

import '../models/note_model.dart';

class HivePage extends StatefulWidget {
  const HivePage({super.key});

  @override
  State<HivePage> createState() => _HivePageState();
}

class _HivePageState extends State<HivePage> {


  List<NoteModel> list = [
    NoteModel(id: 12, title: "title", text: "text"),
    NoteModel(id: 12, title: "title", text: "text"),
    NoteModel(id: 12, title: "title", text: "text"),
    NoteModel(id: 12, title: "title", text: "text"),
    NoteModel(id: 12, title: "title", text: "text"),
  ];


  @override
  void initState(){
    super.initState();
    // Hive.registerAdapter(PersonModelAdapter());



  }

  // Future<void> saveData()async{
  //   var box = await Hive.openBox("g10Box");
  //   // PersonModel personModel = PersonModel(name: "Asadbek", age: 17);
  //   PersonModel personModel2 = PersonModel(name: "Asadbek", age: 17);
  //   await box.add(personModel2);
  //   log("message");
  // }
  //
  // Future<void> getData()async{
  //   var box = await Hive.openBox("g10Box");
  //   var savedData = await box.getAt(10);
  //   if(savedData != null && savedData is PersonModel){
  //     log(savedData.name);
  //     log(savedData.age.toString());
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index){
            return Card(
              child: ListTile(
                title: Text(list[index].title),
                subtitle: Text(list[index].text),
                trailing: Text(list[index].id.toString()),
                leading: Text(list[index].createdTime?.toIso8601String() ?? ""),
              ),
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: TextField(),
                  actions: [
                    IconButton(
                      onPressed: (){

                        
                        

                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.done),
                    )
                  ],
                );
              }
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
