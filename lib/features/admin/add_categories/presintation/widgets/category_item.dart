import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/app/widgets/app_image_shimmer.dart';
import 'package:my_store/core/app/widgets/coustom_container_admin.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/delete_category/delete_category_bloc.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/delete_category/delete_category_event.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/delete_category/delete_category_state.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_event.dart';
import 'package:my_store/features/admin/add_categories/presintation/widgets/add_category_bottom_sheet.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.name,
    required this.image,
    required this.id,
    super.key,
  });

  final String name;
  final String image;
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DeleteCategoryBloc>(),
      child: Builder(
        builder: (context) {
          return BlocListener<DeleteCategoryBloc, DeleteCategoryState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  context.read<GetAllCategoriesBloc>().add(
                    const GetAllCategoriesEvent.fetch(),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Category deleted successfully'),
                    ),
                  );
                },
                error: (errorMessage) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(errorMessage)),
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: CustomContainerLinearAdmin(
                height: 150.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextApp(
                              text: name,
                              theme: context.textStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showAddCategoryBottomSheet(
                                      context,
                                      categoryId: id,
                                      initialName: name,
                                      initialImage: image,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                                BlocBuilder<
                                  DeleteCategoryBloc,
                                  DeleteCategoryState
                                >(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      loading: () => const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.red,
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      ),
                                      orElse: () => IconButton(
                                        onPressed: () {
                                          context.read<DeleteCategoryBloc>().add(
                                            DeleteCategoryEvent.deleteCategory(
                                              id: id,
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: image.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: image,
                              width: 120.w,
                              height: 150.h,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const AppImageShimmer(),
                              errorWidget: (context, url, error) =>
                                  const AppImageShimmer(),
                            )
                          : const SizedBox(
                              width: 120,
                              child: AppImageShimmer(),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
