import 'package:flutter/material.dart';

// class Task extends StatelessWidget {
//   final String text;
//   Task(this.text);
//
//   @override
//   Widget build(BuildContext context) {
//     bool _checkboxValue = false;
//     return Row(
//       children: [
//         Checkbox(
//           onChanged: (bool newValue) {
//             print("pressed");
//             if (newValue) {}
//           },
//           value: _checkboxValue,
//         ),
//         // RawMaterialButton(
//         //   onPressed: () {
//         //     print("pressed");
//         //   }, //TODO function for done
//         //   shape: CircleBorder(),
//         //   fillColor: Colors.green,
//         // ),
//         Text(
//           text,
//           maxLines: 10,
//         ),
//       ],
//       //crossAxisAlignment: CrossAxisAlignment.stretch,
//     );
//   }
// }
//
class Task extends StatefulWidget {
  final String text;
  Task(this.text);

  _TaskState createState() => _TaskState(text);
}

class _TaskState extends State<Task> {
  final String text;
  _TaskState(this.text);
  TextDecoration decoration = TextDecoration.none;
  @override
  Widget build(BuildContext context) {
    bool _checkboxValue = false;
    // return StatefulBuilder
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Row(
        children: [
          Checkbox(
            value: _checkboxValue,
            onChanged: (newValue) {
              setState(() {
                _checkboxValue = newValue;
                if (newValue) {
                  decoration = TextDecoration.lineThrough;
                } else {
                  decoration = TextDecoration.none;
                }
              });
              print(newValue);
            },
          ),
          Text(
            text,
            maxLines: 10,
            style: TextStyle(decoration: decoration),
          ),
        ],
      );
    });
  }
}
