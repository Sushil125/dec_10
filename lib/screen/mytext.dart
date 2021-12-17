import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String name1 = '';
  String name2 = '';

  bool validate = false;
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
        title: Text("TextField retrieve"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              controller: first,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: "First Name",
                hintText: "Enter Your First Name",
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: "Last Name",
                hintText: "Enter Your Last Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                errorText: validate ? "field cannot be empty" : null,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name1 = first.text;
                  name2 = second.text;
                  name1.isEmpty ? validate = true : validate = false;
                  name2.isEmpty ? validate = true : validate = false;
                });
              },
              child: Icon(
                Icons.person,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name1,
                  textScaleFactor: 3,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  name2,
                  textScaleFactor: 3,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
