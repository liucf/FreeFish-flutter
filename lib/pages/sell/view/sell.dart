import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freefish/common/widgets/app_textfields.dart';
import 'package:freefish/common/widgets/button_widgets.dart';
import 'package:freefish/pages/category/controller/category_controller.dart';

import 'package:freefish/pages/sell/controller/sell_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class Sell extends ConsumerStatefulWidget {
  const Sell({super.key});

  @override
  ConsumerState<Sell> createState() => _SellState();
}

class _SellState extends ConsumerState<Sell> {
  late SellController sellController;

  @override
  void didChangeDependencies() {
    sellController = SellController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var selectedPhotos = ref.watch(sellSelectedPhotosProvider);
    var inputValues = ref.watch(sellFormProvider);

    return Scaffold(
      // appBar: buildAppbar(title: "Sell"),
      body: SingleChildScrollView(
        child: Form(
          key: sellController.formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                "What are you selling?".text.size(24).bold.make(),
                VxBox().height(20).make(),
                Stack(
                  children: [
                    Container(
                      height: 250.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          selectedPhotos.isNotEmpty
                              ? BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                )
                              : BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            child: selectedPhotos.isNotEmpty
                                ? Image(
                                    image: AssetEntityImageProvider(
                                      selectedPhotos[0],
                                      isOriginal: false,
                                    ),
                                    fit: BoxFit.fitWidth,
                                    height: 250.h,
                                    width: 340.w,
                                  )
                                : const Icon(
                                    Icons.image_outlined,
                                    color: Colors.black54,
                                    size: 50,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: GestureDetector(
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: Colors.green[500],
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: 200.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      VxBox().height(10.h).make(),
                                      ListTile(
                                        title: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.camera_alt_outlined),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("Take a photo"),
                                          ],
                                        ),
                                        onTap: () async {
                                          final AssetEntity? entity =
                                              await CameraPicker.pickFromCamera(
                                            context,
                                            pickerConfig:
                                                const CameraPickerConfig(
                                                    enableRecording: false),
                                          );

                                          ref
                                              .read(sellSelectedPhotosProvider
                                                  .notifier)
                                              .updatedSelectedPhotos(
                                                  entity != null
                                                      ? [entity]
                                                      : null);
                                          if (context.mounted) {
                                            Navigator.of(context).pop();
                                          }
                                        },
                                      ),
                                      ListTile(
                                        title: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.image_outlined),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("Choose from gallery"),
                                          ],
                                        ),
                                        onTap: () async {
                                          final List<AssetEntity>? result =
                                              await AssetPicker.pickAssets(
                                                  context,
                                                  pickerConfig:
                                                      const AssetPickerConfig(
                                                    maxAssets: 1,
                                                  ));

                                          ref
                                              .read(sellSelectedPhotosProvider
                                                  .notifier)
                                              .updatedSelectedPhotos(result);
                                          if (context.mounted) {
                                            Navigator.of(context).pop();
                                          }
                                        },
                                      ),
                                      const Divider(),
                                      ListTile(
                                        title: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("Cancel"),
                                          ],
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                  ],
                ),
                VxBox().height(20).make(),
                _buildSellForm(selectedPhotos, inputValues)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSellForm(selectedPhotos, inputValues) {
    final categorylistState = ref.watch(categoryListProvider);
    final selectedCategory = ref.watch(sellSelectedCategoryProvider);
    final selectedSubcategory = ref.watch(sellSelectedSubcategoryProvider);

    return (selectedPhotos.isNotEmpty)
        ? [
            appTextFieldOnly(
                hint: "Title",
                func: (value) {
                  ref.read(sellFormProvider.notifier).onNameChange(value);
                }),
            VxBox().height(20).make(),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "Category",
              ),
              // value: inputValues.category,
              onChanged: (value) {
                // ref.read(sellFormProvider.notifier).onCategoryChange(value);
                ref
                    .read(sellSelectedCategoryProvider.notifier)
                    .update(value as int);
              },
              items: categorylistState.when(
                data: (data) => data
                    .map((e) => DropdownMenuItem<int>(
                          value: e.id,
                          child: Text(e.name),
                        ))
                    .toList(),
                loading: () => const [],
                error: (e, s) => const [],
              ),
            ),
            VxBox().height(20).make(),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "SubCategory",
              ),
              // value: inputValues.category,
              onChanged: (value) {
                // ref.read(sellFormProvider.notifier).onCategoryChange(value);
                ref
                    .read(sellSelectedSubcategoryProvider.notifier)
                    .update(value as int);
              },
              items: categorylistState.when(
                data: (data) => data
                    .where((e) => e.id == selectedCategory)
                    .map((e) => e.sub_category
                        .map((e) => DropdownMenuItem<int>(
                              value: e.id,
                              child: Text(e.name),
                            ))
                        .toList())
                    .expand((element) => element)
                    .toList(),
                loading: () => const [],
                error: (e, s) => const [],
              ),
            ),
            VxBox().height(20).make(),
            appTextFieldOnly(
                hint: "Description",
                linenumber: 3,
                height: 100,
                func: (value) {
                  ref
                      .read(sellFormProvider.notifier)
                      .onDescriptionChange(value);
                }),
            VxBox().height(20).make(),
            appTextFieldOnly(
              hint: "Price",
              func: (value) {
                ref.read(sellFormProvider.notifier).onPriceChange(value);
              },
              validateFunc: (value) {
                if (double.tryParse(value) != null) {
                  return null;
                } else {
                  return 'Please input a number';
                }
              },
            ),
            VxBox().height(20).make(),
            appButton(
                text: "Submit",
                onPressed: () {
                  if ((sellController.formKey.currentState! as FormState)
                      .validate()) {
                    sellController.handleSellSubmit(
                      ref,
                      inputValues,
                      selectedCategory,
                      selectedSubcategory,
                    );
                  }
                }),
          ].vStack()
        : const SizedBox();
  }
}
