import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';

class FormValidates extends StatefulWidget {
  const FormValidates({Key? key}) : super(key: key);
  @override
  _FormValidatesState createState() => _FormValidatesState();
}

class _FormValidatesState extends State<FormValidates> {
  final _formkey = GlobalKey<FormState>();
  String principal = '';
  String rate = '';
  String time = "";
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form validation'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                const SizedBox(height: 30),
                TextFormField(
                  onSaved: (value) {
                    principal = value!;
                  },
                  keyboardType: TextInputType.number,
                  validator: MultiValidator([
                    RequiredValidator(errorText: '* Required'),
                  ]),
                  decoration: const InputDecoration(
                    labelText: 'Principal',
                    hintText: 'Enter Principal amount',
                    prefixIcon: Icon(Icons.monetization_on),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onSaved: (value) {
                    rate = value!;
                  },
                  keyboardType: TextInputType.number,
                  validator: MultiValidator([
                    RequiredValidator(errorText: '* Required'),
                  ]),
                  decoration: const InputDecoration(
                    labelText: 'Rate',
                    hintText: 'enter Rate in Percentage',
                    prefixIcon: Icon(Icons.payment),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onSaved: (value) {
                    time = value!;
                  },
                  keyboardType: TextInputType.number,
                  validator: MultiValidator([
                    RequiredValidator(errorText: '* Required'),
                  ]),
                  decoration: const InputDecoration(
                    labelText: 'Time',
                    hintText: 'enter Time in years',
                    prefixIcon: Icon(Icons.timer),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 150,
                        height: 80,
                        color: Colors.red,
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
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Your accuired intrest  at $time year is $result'),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      setState(() {
                        result = ((int.parse(principal) *
                                int.parse(rate) *
                                int.parse(time) /
                                100)
                            .toString());
                        //   var calc= int.parse(result)+ int.parse(principal);
                        //    var total= calc.toString();
                        //
                      });
                      MotionToast.success(description: 'Here is your result')
                          .show(context);
                    }
                  },
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    _formkey.currentState!.reset();
                    MotionToast.success(description: 'Data reset successfully')
                        .show(context);
                  },
                  child: const Text('clear'),
                ),
              ],
            ),
          ),
        ));
  }
}
