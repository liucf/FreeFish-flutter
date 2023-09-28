import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freefish/common/models/category_model.dart';
import 'package:freefish/common/widgets/app_bar.dart';
import 'package:freefish/pages/category/controller/category_controller.dart';

class Category extends ConsumerStatefulWidget {
  const Category({super.key});

  @override
  ConsumerState<Category> createState() => _CategoryState();
}

class _CategoryState extends ConsumerState<Category> {
  @override
  Widget build(BuildContext context) {
    final categorylistState = ref.watch(categoryListProvider);
    return Scaffold(
      appBar: buildAppbar(title: "Category", context: context),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: categorylistState.when(
                data: (data) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return CategoryTile(category: data[index]);
                    },
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text(error.toString()),
              ),
            ),

            //   SizedBox(
            //     height: 20.h,
            //     child: const Text("Category"),
            //   ),
            //   const Expanded(
            //     child: SingleChildScrollView(
            //       child: Text(
            //           "Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,"),
            //     ),
            //   ),
            //   categorylistState.when(
            //     data: (data) {
            //       return Expanded(
            //         child: ListView.builder(
            //           itemCount: data.length,
            //           itemBuilder: (context, index) {
            //             return ListTile(
            //               title: Text(data[index].name),
            //             );
            //           },
            //         ),
            //       );
            //     },
            //     loading: () => const CircularProgressIndicator(),
            //     error: (error, stack) => Text(error.toString()),
            //   ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(category.name,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      childrenPadding: const EdgeInsets.only(left: 20),
      children: category.sub_category
          .map((e) => ListTile(
                dense: true,
                visualDensity: const VisualDensity(vertical: -4),
                title: Text(e.name),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('category_detail', arguments: e.name);
                },
              ))
          .toList(),
      // children: const [
      //   ListTile(
      //     title: Text("On Sale"),
      //   ),
      //   ListTile(
      //     title: Text("On Sale"),
      //   ),
      //   ListTile(
      //     title: Text("On Sale"),
      //   ),
      // ],
    );
  }
}
