import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateStatusView extends StatelessWidget {
  const UpdateStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Status'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Update Status',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: const Center(
                    child: Text(
                      'Update',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
