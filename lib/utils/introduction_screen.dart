import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';

class ListPageViewModel {
  final pages = [
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: const Center(
          child: Icon(Icons.ac_unit, size: 175.0, color: Colors.blue)),
    ),
    PageViewModel(
      title: "Title of second page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: const Center(
          child:
              Icon(Icons.accessibility_new, size: 175.0, color: Colors.blue)),
    ),
    PageViewModel(
      title: "Title of third page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: const Center(
          child: Icon(Icons.account_balance, size: 175.0, color: Colors.blue)),
    ),
  ];
}
