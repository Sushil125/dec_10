import 'package:flutter/material.dart';

class ClassWork extends StatefulWidget {
  const ClassWork({Key? key}) : super(key: key);

  @override
  _ClassWorkState createState() => _ClassWorkState();
}

class _ClassWorkState extends State<ClassWork> {
  String Sum = "";
  String f = "";
  String s = "";

  bool validate = true;
  bool validate1 = true;

  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();

  @override
  void dispose() {
    first.dispose();
    second.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("classwork"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: first,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: ("First Number"),
                  hintText: ("Enter First Number..."),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  errorText: validate ? "field cannot be empty" : null,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: second,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: ("Second Number"),
                  hintText: ("Enter Second Number..."),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  errorText: validate1 ? "field cannot be empty" : null,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    f = first.text;
                    s = second.text;
                    if (f.isNotEmpty && s.isNotEmpty) {
                      int sum = int.parse(first.text) + int.parse(second.text);
                      Sum = sum.toString();
                    }
                    f.isEmpty ? validate = true : validate = false;
                    s.isEmpty ? validate1 = true : validate1 = false;
                  });
                },
                child: Icon(Icons.add),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                Sum,
                textScaleFactor: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
