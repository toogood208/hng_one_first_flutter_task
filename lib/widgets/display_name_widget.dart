import 'package:flutter/material.dart';
import 'package:hng_first_flutter_task/viewmodel/result_view+model.dart';
import 'package:provider/provider.dart';

class DisplayName extends StatefulWidget {
  const DisplayName({Key? key}) : super(key: key);

  @override
  _DisplayNameState createState() => _DisplayNameState();
}

class _DisplayNameState extends State<DisplayName> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DisplayNameModel>(builder: (context, result, child) {
      if (result.result.length > 1) {
        return Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(2, 2),
                spreadRadius: 2,
                blurRadius: 1,
              ),
            ],
          ),
          child: Text(
            result.result,
            style: TextStyle(fontSize: 30),
          ),
        );
      }
      return Container();
    });
  }
}
