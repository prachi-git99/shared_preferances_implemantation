import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController();

  static const String KEYNAME = "myKey";
  var nameValue = "No value Saved";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shared Preferance"),centerTitle: true,),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 200,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      label: Text("Name"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21)
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () async{
                  var name = nameController.text.toString();
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString(KEYNAME,name);
                },
                child: Text("Save")
            ),
            SizedBox(height: 20,),
            Text(nameValue)
          ],
        ),
      ),
    );
  }

  void getValue() async{
    //initialising shared pref
    var prefs = await SharedPreferences.getInstance();
    var getName = prefs.getString(KEYNAME);
    nameValue = getName != null ? getName : "No value Saved";

    setState(() {

    });
  }
}

