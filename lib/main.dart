import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/bottomSheet.dart';
import 'package:flutter_application_1/widgets/modal/item.dart';
import 'package:flutter_application_1/widgets/taskItem.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<TaskItem> items = [];

  void _handleAddTask(String taskName) {
    var newItem = TaskItem(id: DateTime.now().toString(), name: taskName);

    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To Do List App",
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 31),
        child: Column(
          children: items
              .map((taskI) => taskItem(
                  index: items.indexOf(taskI),
                  item: taskI,
                  handleDelete: _handleDeleteTask))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext buildContext) {
                return bottomSheet(callback: _handleAddTask);
              });
        },
        tooltip: "Create new task",
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
