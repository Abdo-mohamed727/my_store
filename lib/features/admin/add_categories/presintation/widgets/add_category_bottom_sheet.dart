import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/app/widgets/coustom_text_form_field.dart';
import 'package:my_store/core/app/widgets/custom_button.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:my_store/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:my_store/features/admin/add_categories/data/models/update_category_request_body.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/create_category/create_category_bloc.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/create_category/create_category_event.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/create_category/create_category_state.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/update_category/update_category_bloc.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/update_category/update_category_event.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/update_category/update_category_state.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_event.dart';

class AddCategoryBottomSheet extends StatefulWidget {
  const AddCategoryBottomSheet({
    this.categoryId,
    this.initialName,
    this.initialImage,
    super.key,
  });

  final String? categoryId;
  final String? initialName;
  final String? initialImage;

  @override
  State<AddCategoryBottomSheet> createState() => _AddCategoryBottomSheetState();
}

class _AddCategoryBottomSheetState extends State<AddCategoryBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.initialName != null) {
      _nameController.text = widget.initialName!;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isUpdate = widget.categoryId != null;
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 20.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: TextApp(
                  text: isUpdate ? 'Update Category' : 'Add New Category',
                  theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextApp(
                text: 'Category Name',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              BlocBuilder<UploadImageCubit, UploadImageState>(
                builder: (context, state) {
                  final cubit = context.read<UploadImageCubit>();
                  final bool isImageLoaded = cubit.imageUrl.isNotEmpty;
                  final imageUrlToShow = isImageLoaded
                      ? cubit.imageUrl
                      : (widget.initialImage ?? '');
                  final hasImageToShow = imageUrlToShow.isNotEmpty;

                  return state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    orElse: () => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (hasImageToShow)
                          Container(
                            height: 100.h,
                            margin: EdgeInsets.only(bottom: 15.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(imageUrlToShow),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        CustomButton(
                          backgroundColor: Colors.grey.shade800,
                          onPressed: () {
                            context.read<UploadImageCubit>().uploadImage();
                          },
                          text: hasImageToShow
                              ? 'Change Image'
                              : 'Upload Image',
                          width: double.infinity,
                          height: 45.h,
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              BlocListener<UpdateCategoryBloc, UpdateCategoryState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: (response) {
                      context.read<GetAllCategoriesBloc>().add(
                        const GetAllCategoriesEvent.fetch(),
                      );
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Category updated successfully'),
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
                child: BlocConsumer<CreateCategoryBloc, CreateCategoryState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: (response) {
                        context.read<GetAllCategoriesBloc>().add(
                          const GetAllCategoriesEvent.fetch(),
                        );
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Category added successfully'),
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
                  builder: (context, createReqState) {
                    return BlocBuilder<UpdateCategoryBloc, UpdateCategoryState>(
                      builder: (context, updateReqState) {
                        final isLoading =
                            createReqState.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            ) ||
                            updateReqState.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );

                        if (isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return CustomButton(
                          backgroundColor: context.myColors.bluePinkDark,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final imageUrl = context
                                  .read<UploadImageCubit>()
                                  .imageUrl;
                              final finalImageUrl = imageUrl.isNotEmpty
                                  ? imageUrl
                                  : (widget.initialImage ?? '');

                              if (finalImageUrl.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please upload an image'),
                                  ),
                                );
                                return;
                              }

                              if (isUpdate) {
                                context.read<UpdateCategoryBloc>().add(
                                  UpdateCategoryEvent.updateCategory(
                                    body: UpdateCategoryRequestBody(
                                      id: widget.categoryId!,
                                      name: _nameController.text,
                                      image: finalImageUrl,
                                    ),
                                  ),
                                );
                              } else {
                                context.read<CreateCategoryBloc>().add(
                                  CreateCategoryEvent.createCategory(
                                    body: CreateCategoryRequestBody(
                                      name: _nameController.text,
                                      image: finalImageUrl,
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          text: isUpdate ? 'Update Category' : 'Add Category',
                          width: double.infinity,
                          height: 45.h,
                          lastRadius: 10,
                          threeRadius: 10,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showAddCategoryBottomSheet(
  BuildContext context, {
  String? categoryId,
  String? initialName,
  String? initialImage,
}) {
  // We need to capture the parent's GetAllCategoriesBloc to refresh it.
  final getAllCategoriesBloc = context.read<GetAllCategoriesBloc>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.myColors.mainColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<UploadImageCubit>()),
          BlocProvider(create: (context) => sl<CreateCategoryBloc>()),
          BlocProvider(create: (context) => sl<UpdateCategoryBloc>()),
          BlocProvider.value(
            value: getAllCategoriesBloc,
          ), // Pass the existing bloc down
        ],
        child: AddCategoryBottomSheet(
          categoryId: categoryId,
          initialName: initialName,
          initialImage: initialImage,
        ),
      );
    },
  );
}
