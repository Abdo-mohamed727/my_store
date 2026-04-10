import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/app/widgets/coustom_text_form_field.dart';
import 'package:my_store/core/app/widgets/custom_button.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_state.dart';
import 'package:my_store/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/create_product/create_product_bloc.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/create_product/create_product_event.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/create_product/create_product_state.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/get_all_products/get_all_products_event.dart';

class AddProductBottomSheet extends StatefulWidget {
  const AddProductBottomSheet({super.key});

  @override
  State<AddProductBottomSheet> createState() => _AddProductBottomSheetState();
}

class _AddProductBottomSheetState extends State<AddProductBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedCategoryId;

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  text: 'Add New Product',
                  theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextApp(
                text: 'Product Title',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              TextApp(
                text: 'Price',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              TextApp(
                text: 'Description',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                controller: _descriptionController,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              TextApp(
                text: 'Category',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
                builder: (context, state) {
                  return state.when(
                    initial: () =>
                        const Center(child: CircularProgressIndicator()),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    success: (response) {
                      final categories = response.data.totalCategorys;
                      return DropdownButtonFormField<String>(
                        isExpanded: true,
                        value: _selectedCategoryId,
                        hint: const Text('Select Category'),
                        dropdownColor: Colors.grey.shade800,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: categories.map((category) {
                          return DropdownMenuItem<String>(
                            value: category.id,
                            child: Text(
                              category.name,
                              style: const TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCategoryId = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a category';
                          }
                          return null;
                        },
                      );
                    },
                    error: (errorMessage) => Center(child: Text(errorMessage)),
                  );
                },
              ),
              SizedBox(height: 16.h),
              BlocBuilder<UploadImageCubit, UploadImageState>(
                builder: (context, state) {
                  final cubit = context.read<UploadImageCubit>();
                  final imageUrl = cubit.imageUrl;

                  return state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    orElse: () => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (imageUrl.isNotEmpty)
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 15.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        CustomButton(
                          backgroundColor: Colors.grey.shade800,
                          onPressed: () {
                            context.read<UploadImageCubit>().uploadImage();
                          },
                          text: imageUrl.isNotEmpty
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
              BlocConsumer<CreateProductBloc, CreateProductState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: (response) {
                      context.read<GetAllProductsBloc>().add(
                        const GetAllProductsEvent.fetch(),
                      );
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product added successfully'),
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
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );

                  if (isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return CustomButton(
                    backgroundColor: context.myColors.bluePinkDark,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final imageUrl = context
                            .read<UploadImageCubit>()
                            .imageUrl;
                        if (imageUrl.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please upload an image'),
                            ),
                          );
                          return;
                        }

                        context.read<CreateProductBloc>().add(
                          CreateProductEvent.createProduct(
                            body: CreateProductRequestBody(
                              title: _titleController.text,
                              price: double.parse(_priceController.text),
                              description: _descriptionController.text,
                              images: [imageUrl],
                              categoryId: _selectedCategoryId!,
                            ),
                          ),
                        );
                      }
                    },
                    text: 'Add Product',
                    width: double.infinity,
                    height: 45.h,
                    lastRadius: 10,
                    threeRadius: 10,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showAddProductBottomSheet(BuildContext context) {
  final getAllProductsBloc = context.read<GetAllProductsBloc>();
  final getAllCategoriesBloc = context.read<GetAllCategoriesBloc>();

  showModalBottomSheet<Widget>(
    context: context,
    isScrollControlled: true,
    backgroundColor: context.myColors.mainColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<UploadImageCubit>()),
          BlocProvider(create: (context) => sl<CreateProductBloc>()),
          BlocProvider.value(value: getAllCategoriesBloc),
          BlocProvider.value(value: getAllProductsBloc),
        ],
        child: const AddProductBottomSheet(),
      );
    },
  );
}
