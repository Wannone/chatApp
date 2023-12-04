import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<Widget> myChats = List.generate(
    10,
    (index) => ListTile(
          onTap: () => Get.toNamed('/ChatRoom'),
          leading: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.black26,
              child: Icon(Icons.person)),
          title: Text(
            "Orang ke ${index + 1}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          subtitle: const Text(
            "Status",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          trailing: const Chip(
            label: Text("message"),
          ),
        ));
