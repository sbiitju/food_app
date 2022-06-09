import 'package:flutter/material.dart';
import 'package:food_app/database/dbhelper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/person.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = "/Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final _myNameController = TextEditingController();
  final _myAgeController = TextEditingController();
  final _myFocus = FocusNode();

  @override
  void dispose() {
    _myNameController.dispose();
    _myAgeController.dispose();
    _myFocus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    var dbHelper = DBHelper();
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: TextFormField(
                    autofocus: false,
                    controller: _myNameController,
                    decoration: const InputDecoration(
                        labelText: "Name", border: OutlineInputBorder()),
                    textAlign: TextAlign.center,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: TextFormField(
                    autofocus: false,
                    controller: _myAgeController,
                    decoration: const InputDecoration(
                        labelText: "Age", border: OutlineInputBorder()),
                    textAlign: TextAlign.center,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null;
                    },
                  ),
                ),
                MaterialButton(
                    color: Colors.green,
                    child: const Text("Save"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(_myNameController.text)));
                      }else{
                        var person= Person(1, _myNameController.text, int.parse(_myAgeController.text));
                        dbHelper.saveEmployee(person);
                      }
                    }),
                MaterialButton(
                    child: Text("Get Data"),
                    color: Colors.redAccent,
                    onPressed: (){
                      debugPrint(dbHelper.getPerson().toString());
                })
              ],
            )),
      ),
    );
  }
}
