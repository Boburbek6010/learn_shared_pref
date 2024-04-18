import 'package:flutter/material.dart';
import 'package:learn_shared_pref/services/storage_service.dart';

import '../setup.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late TextEditingController textEditingController;


  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }


  Future<void> save()async{
    await StorageService.storeData(key: StorageKey.token, value: textEditingController.text.toString());
    token = await StorageService.loadData(key: StorageKey.token);
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully saved")));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text("Secure Storage"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textEditingController,
              ),
              const SizedBox(height: 20,),
              MaterialButton(
                color: Colors.blueGrey,
                onPressed: save,
                child: const Text("Save"),
              ),
              const SizedBox(height: 50,),


              Text(token.toString(), style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
