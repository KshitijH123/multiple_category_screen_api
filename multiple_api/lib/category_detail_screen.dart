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
                    return Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text(
                          category.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        subtitle: Text(
                          category.slug,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('URL: ${category.url}'),
                              backgroundColor: Color.fromARGB(255, 46, 208, 24),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
