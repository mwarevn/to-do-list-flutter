import 'package:flutter/material.dart';

class bottomSheet extends StatelessWidget {
  const bottomSheet({super.key, required this.callback});

  final Function callback;
  @override
  Widget build(BuildContext context) {
    String taskName = '';

    void handleOnClick(BuildContext context) {
      if (taskName.isEmpty) {
        return;
      }
      callback(taskName);
      Navigator.pop(context);
    }

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          height: 228,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(26), topRight: Radius.circular(26)),
            color: Colors.white, // Màu nền của container
            boxShadow: [
              BoxShadow(
                color: Colors.grey
                    .withOpacity(0.1), // Màu của shadow và độ trong suốt
                spreadRadius: 5, // Độ lan rộng của shadow
                blurRadius: 7, // Độ mờ của shadow
                offset: const Offset(
                    0, 3), // Độ dịch chuyển của shadow theo trục X và Y
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            children: [
              TextField(
                onChanged: (value) => {taskName = value},
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Task name...."),
              ),
              const SizedBox(
                width: double.infinity,
                height: 28,
              ),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => handleOnClick(context),
                      child: const Text("Add Task")))
            ],
          ),
        ),
      ),
    );
  }
}
