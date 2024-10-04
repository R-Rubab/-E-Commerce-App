import 'package:ecommerce_app/domain/product/entities/product.dart';
import 'package:ecommerce_app/domain/product/usecases/add_or_remove_favorite_product.dart';
import 'package:ecommerce_app/domain/product/usecases/is_favorite.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavImageCubit extends Cubit<bool> {
  NavImageCubit() : super(false);

  void isClick(String productId) async {
    var result = await sl<IsFavoriteUseCase>().call(params: productId);
    emit(result);
  }

  void onTap(ProductEntity product) async {
    var result =
        await sl<AddOrRemoveFavoriteProductUseCase>().call(params: product);
    result.fold((error) {}, (data) {
      emit(data);
    });
  }
}
