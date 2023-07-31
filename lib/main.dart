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
        useMaterial3: true

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: TextButton(
            child: const Text("Click Me"),
            onPressed: ()  => showDialog(context: context, builder:
            (BuildContext context) => AlertDialog(
              title: const Text("Subscribe Channel"),
              content: const Text("Are you want to subscribe this channel"),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context, "Cancel"),
                    child: const Text("Cancel")),
                TextButton(onPressed: () => Navigator.pop(context, "Ok"),
                    child:const Text("Ok"))
              ],
              backgroundColor: Colors.amber,
            )  )  ,
          )


      ),
    );
  }
}
