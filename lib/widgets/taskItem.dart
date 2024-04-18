import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class taskItem extends StatelessWidget {
  final dynamic item; // Khai báo thuộc tính item
  final Function handleDelete;
  final int index;

  // Constructor với tham số item
  const taskItem(
      {super.key,
      required this.item,
      required this.handleDelete,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        margin: const EdgeInsets.only(bottom: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: index % 2 == 0
              ? Colors.white
              : const Color.fromARGB(
                  179, 225, 225, 225), // Màu nền của container
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                  onTap: () async {
                    if (await confirm(context)) {
                      handleDelete(item.id);
                    }
                  },
                  child: const Icon(Icons.delete_forever_rounded))
            ],
          ),
        ));
  }
}
