import 'package:dec_10/screen/stfl.dart';
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Example"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                side: BorderSide(color: Colors.blue, width: 3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(100, 60),
                padding: EdgeInsets.all(20),
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                primary: Colors.white,
                backgroundColor: Colors.red,
                elevation: 10,
                shadowColor: Colors.orange,
              ),
              onLongPress: () {
                print("hero");
              },
              onPressed: () {
                print("Text Button");
              },
              child: Text("Hello"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  print("Elevated Button");
                },
                child: Icon(Icons.wifi)),
            SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.person),
                label: Text("Hello"))
          ],
        ),
      ),
    );
  }
}
