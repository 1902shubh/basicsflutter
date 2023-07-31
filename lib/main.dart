import 'package:flutter/material.dart';

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


  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {

    myController.dispose();
    super.dispose();
  }

  void _printLatestValue(){
    print('papayacoders : Second field value is ${myController.text}');

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [

              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your email"
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 20,),

              TextFormField(
                controller: myController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Enter your email"
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              SizedBox(height: 20,),

              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter your email"
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (text){
                  print('papayacoders : Third field value is $text');
                },
              ),

              TextButton(onPressed: (){
                showDialog(context: context, builder: (context){
                 return AlertDialog(
                   content: Text(myController.text),
                 );
                });
              }, child:
              Text("Click Me"))


            ],
          )

      ),
    );
  }
}
