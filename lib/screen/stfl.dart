import 'package:flutter/material.dart';

class stflExample extends StatefulWidget {
  const stflExample({Key? key}) : super(key: key);

  @override
  _stflExampleState createState() => _stflExampleState();
}

class _stflExampleState extends State<stflExample> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Stateful'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('images/one1.jpg'),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                // maxLines: null,
                // textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Name:",
                  labelStyle: TextStyle(
                    fontSize: 30,
                  ),
                  hintText: "Enter your name....",
                  icon: Icon(
                    Icons.people_alt_outlined,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Your bestfriend is $name',
                style: TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
