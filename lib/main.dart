import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your name."
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter your name.";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),

                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your number."
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter your number.";
                    }else if(value.length != 10){
                      return "Please enter valid number.";

                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),

                ElevatedButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(content: Text("Submit Data"))
                    );
                  }
                }, child:
                Text("Submit"))
              ],
            ),
          )

      ),
    );
  }
}
