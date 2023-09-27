import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freefish/common/api/product_api.dart';
import 'package:freefish/common/global_loader/global_loader.dart';
import 'package:freefish/common/widgets/app_messages.dart';
import 'package:freefish/pages/sell/controller/sell_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
part 'sell_controller.g.dart';

class SellController {
  SellController();

  GlobalKey formKey = GlobalKey<FormState>();

  Future<void> handleSellSubmit(
      WidgetRef ref, SellState state, int category, int subcategory) async {
    var context = ref.context;
    try {
      ref.read(appLoaderProvider.notifier).showLoader();

      await ProductApi.sell(
        name: state.name,
        description: state.description,
        price: state.price,
        photos: ref.watch(sellSelectedPhotosProvider),
        rootcategory: category.toString(),
        subcategory: subcategory.toString(),
      );

      if (context.mounted) {
        toastInfo(
            msg: "Congratulations, Post successfully!",
            backgroundColor: Colors.green);

        ref
            .read(sellSelectedPhotosProvider.notifier)
            .updatedSelectedPhotos(null);
        ref.read(sellFormProvider.notifier).onNameChange("");
        ref.read(sellFormProvider.notifier).onDescriptionChange("");
        ref.read(sellFormProvider.notifier).onPriceChange("0");
        Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false);
      }
    } on DioException catch (e) {
      toastInfo(msg: "${e.error}", backgroundColor: Colors.red);
    } catch (e) {
      toastInfo(msg: e.toString(), backgroundColor: Colors.red);
    } finally {
      ref.read(appLoaderProvider.notifier).hideLoader();
    }
  }
}

@riverpod
class SellSelectedCategory extends _$SellSelectedCategory {
  @override
  int build() => 0;

  void update(int id) {
    state = id;
  }
}

@riverpod
class SellSelectedSubcategory extends _$SellSelectedSubcategory {
  @override
  int build() => 0;

  void update(int id) {
    state = id;
  }
}

@riverpod
class SellSelectedPhotos extends _$SellSelectedPhotos {
  @override
  List<AssetEntity> build() => List.empty();

  void updatedSelectedPhotos(List<AssetEntity>? assets) {
    if (assets != null) {
      state = assets;
    } else {
      state = List.empty();
    }
  }
}

@riverpod
class SellForm extends _$SellForm {
  @override
  SellState build() {
    return SellState();
  }

  void onNameChange(String name) {
    state = state.copyWith(name: name);
  }

  void onDescriptionChange(String description) {
    state = state.copyWith(description: description);
  }

  void onPriceChange(String price) {
    state = state.copyWith(price: price);
  }
}
