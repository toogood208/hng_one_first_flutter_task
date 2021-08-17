import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng_first_flutter_task/viewmodel/result_view+model.dart';
import 'package:provider/provider.dart';

class DisplayNameForm extends StatefulWidget {
  const DisplayNameForm({Key? key}) : super(key: key);

  @override
  _DisplayNameFormState createState() => _DisplayNameFormState();
}

class _DisplayNameFormState extends State<DisplayNameForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final result = Provider.of<DisplayNameModel>(context);
    return Container(
      margin: EdgeInsets.all(29),
      child: Card(
          child: Container(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                "Fill the form to display your name",
                style: TextStyle(
                  color: Colors.blue,
                  letterSpacing: 2,
                ),
              ),
              nameColumn("Surname",
                  howMany: "What is your surname?",
                  controller: surnameController),
              nameColumn("Name",
                  howMany: "What is your name?", controller: nameController),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        result.setName("${surnameController.text}\t"
                            "${nameController.text}");
                      }
                    },
                    icon: Icon(Icons.smart_display_rounded),
                    label: Text("Display Name")),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("powered by:"),
                  Image.asset(
                    'assets/images/hng.png',
                    height: 30,
                    width: 30,
                  ),
                  Image.asset(
                    'assets/images/i4g.png',
                    height: 50,
                    width: 50,
                  ),
                  Image.asset(
                    'assets/images/zuri.png',
                    height: 50,
                    width: 50,
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget nameColumn(String key,
      {required String howMany, required TextEditingController controller}) {
    return Container(
      padding: EdgeInsets.all(10),
      //margin: EdgeInsets.all(10),
      child: Column(
        children: [
          TextFormField(
            key: Key(key),
            keyboardType: TextInputType.text,
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Field cannot be empty";
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: howMany,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.face,
                  color: Colors.blue,
                )),
          ),
        ],
      ),
    );
  }
}
