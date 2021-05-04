import 'package:flutter/material.dart';
import 'package:todo/Task.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

List<Task> _todoItems = [];

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO LIST APP"),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: _todoItems,
            ),
            width: double.infinity,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createNewTask(context);
        },
        child: Icon(Icons.add),
        tooltip: 'Add New Task',
      ),
    );
  }

  void _createNewTask(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Add a new task"),
          ),
          body: TextField(
            autofocus: true,
            onSubmitted: (val) {
              //_addTodoItem(val);
              // test = val;
              if (val != null && val != "") {
                setState(() {
                  _todoItems.add(Task(val));
                });
              }
              Navigator.pop(context); // Close the add todo screen
            },
            decoration: new InputDecoration(
              hintText: 'Enter something to do...',
              contentPadding: const EdgeInsets.all(16.0),
            ),
            textAlign: TextAlign.center,
          ),
        );
      }),
    );
  }
}
