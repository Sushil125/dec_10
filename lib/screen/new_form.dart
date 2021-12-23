import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formkey = GlobalKey<FormState>();
  final _firstController = TextEditingController();
  final _secondController = TextEditingController();

  String result = '';

  String? myvalidation(value) {
    if (value == null || value.isEmpty) {
      return "Field is empty";
    }
    if (value.length < 6) {
      return "less than 6 character";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Form Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const Text(
                  'Adding two Numbers:',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                TextFormField(
                 validator: myvalidation,
                  controller: _firstController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: 'First Num',
                    hintText: '0',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _firstController.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is empty";
                    }
                    return null;
                  },
                  controller: _secondController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: 'Second Num',
                    hintText: '0',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _secondController.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        result = ((int.parse(_firstController.text) +
                                int.parse(_secondController.text))
                            .toString());
                      });
                    }
                  },
                  child: const Text('Sum'),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 150,
                        height: 80,
                        color: Colors.black,
                        child: const Center(
                          child: Text(
                            'Result',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 150,
                        height: 80,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            result,
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}