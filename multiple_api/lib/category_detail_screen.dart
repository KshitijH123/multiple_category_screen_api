// screens/category_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_api/model_class.dart/get_api_categories_controller.dart';
import 'package:multiple_api/model_class.dart/get_api_categories_model.dart';

class CategoryDetailScreen extends StatelessWidget {
  final CategoryDetailController _categoryDetailController =
      Get.put(CategoryDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Details'),
      ),
      body: GetBuilder<CategoryDetailController>(
        init: _categoryDetailController,
        builder: (controller) {
          return controller.categories.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    CategoryDetailModel category = controller.categories[index];
                    return ListTile(
                      title: Text(category.name),
                      subtitle: Text(category.slug),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('URL: ${category.url}'),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}
