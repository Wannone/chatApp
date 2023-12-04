import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart';
import '../utils/generate_list.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final SearchViewController controller = Get.put(SearchViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(135),
        child: AppBar(
            backgroundColor: Colors.blue,
            title: const Text('Search'),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: controller.searchController,
                    decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search)),
                  ),
                ),
              ),
            )),
      ),
      body: myChats.isEmpty
          ? const Center(
              child: Text("No Friends Found"),
            )
          : ListView.builder(
              itemCount: myChats.length,
              itemBuilder: (context, index) {
                return myChats[index];
              }),
    );
  }
}
