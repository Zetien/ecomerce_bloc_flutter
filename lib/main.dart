import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:smart_z_comerce/features/cart/presentation/bloc/cubit/cart_cubit.dart';

import 'features/products/data/datasource/product_remote_datasource.dart';
import 'features/products/data/repositories/product_repository_impl.dart';
import 'features/products/domain/usecases/get_products.dart';
import 'features/products/presentation/bloc/product_bloc.dart';
import 'features/products/presentation/pages/products_page.dart';

void main() {
  final dio = Dio();

  final remoteDataSource = ProductRemoteDataSourceImpl(dio);
  final repository = ProductRepositoryImpl(remoteDataSource);
  final getProducts = GetProducts(repository);

  runApp(MyApp(getProducts));
}

class MyApp extends StatelessWidget {
  final GetProducts getProducts;

  const MyApp(this.getProducts, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductBloc(getProducts)..fetchProducts()),
        BlocProvider(create: (_) => CartCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const ProductsPage(),
      ),
    );
  }
}
