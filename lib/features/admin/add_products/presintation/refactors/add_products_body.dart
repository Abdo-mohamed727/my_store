import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/get_all_products/get_all_products_state.dart';
import 'package:my_store/features/admin/add_products/presintation/widgets/create_product.dart';
import 'package:my_store/features/admin/add_products/presintation/widgets/product_item.dart';
import 'package:my_store/features/admin/add_products/presintation/widgets/products_list_shimmer.dart';

class AddProductsBody extends StatelessWidget {
  const AddProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CreateProduct(),
        Expanded(
          child: BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
            builder: (context, state) {
              return state.when(
                initial: () => const ProductsListShimmer(),
                loading: () => const ProductsListShimmer(),
                success: (response) => _ProductsList(response: response),
                error: (errorMessage) => _ProductsError(message: errorMessage),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ProductsList extends StatelessWidget {
  const _ProductsList({required this.response});

  final GetAllProductResponse response;

  @override
  Widget build(BuildContext context) {
    final products = response.productGetAllList;
    if (products.isEmpty) {
      return Center(
        child: Text(
          'No products found',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white70,
          ),
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.only(top: 8.h, bottom: 20.h),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductItem(product: products[index]);
      },
    );
  }
}

class _ProductsError extends StatelessWidget {
  const _ProductsError({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
