
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_z_comerce/features/products/domain/entities/product.dart';
import 'package:smart_z_comerce/features/products/domain/usecases/get_products.dart';

part 'product_bloc_event.dart';
part 'product_bloc_state.dart';

class ProductBloc extends Cubit<ProductState> {
  final GetProducts getProducts;

  ProductBloc(this.getProducts) : super(ProductInitial());

  Future<void> fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}