import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/widgets/coustom_text_form_field.dart';
import 'package:my_store/core/app/widgets/custom_button.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_state.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';
import 'package:my_store/features/admin/add_products/data/models/update_product_request_body.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/get_all_products/get_all_products_event.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/update_product/update_product_bloc.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/update_product/update_product_event.dart';
import 'package:my_store/features/admin/add_products/presintation/bloc/update_product/update_product_state.dart';

class UpdateProductForm extends StatefulWidget {
  const UpdateProductForm({required this.product, super.key});
  final ProductGetAllModel product;

  @override
  State<UpdateProductForm> createState() => _UpdateProductFormState();
}

class _UpdateProductFormState extends State<UpdateProductForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _priceController;
  late final TextEditingController _descriptionController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.product.title);
    _priceController = TextEditingController(
      text: widget.product.price?.toString(),
    );
    _descriptionController = TextEditingController(
      text: widget.product.description,
    );
    _selectedCategoryId = widget.product.category?.id;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField('Product Title', _titleController),
          _buildTextField('Price', _priceController, isNumber: true),
          _buildTextField('Description', _descriptionController, maxLines: 3),
          _buildCategoryDropdown(),
          SizedBox(height: 16.h),
          _buildImageUploader(),
          SizedBox(height: 20.h),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool isNumber = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(
            text: label,
            theme: context.textStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            controller: controller,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            maxLines: maxLines,
            validator: (value) =>
                (value == null || value.isEmpty) ? 'Please enter $label' : null,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: 'Category',
          theme: context.textStyle.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (response) {
                final categories = response.data.totalCategorys;
                return DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: _selectedCategoryId,
                  // hint: const Text('Select Category'),
                  dropdownColor: Colors.grey.shade800,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: categories
                      .map(
                        (category) => DropdownMenuItem(
                          value: category.id,
                          child: Text(
                            category.name ?? 'No Name',
                            style: const TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) =>
                      setState(() => _selectedCategoryId = value),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Please select a category'
                      : null,
                );
              },
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildImageUploader() {
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();
        final imageUrl = cubit.imageUrl.isNotEmpty
            ? cubit.imageUrl
            : (widget.product.images?.firstOrNull ?? '');
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (imageUrl.isNotEmpty)
                Container(
                  height: 100.h,
                  margin: EdgeInsets.only(bottom: 15.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              CustomButton(
                backgroundColor: Colors.grey.shade800,
                onPressed: () => context.read<UploadImageCubit>().uploadImage(),
                text: imageUrl.isNotEmpty ? 'Change Image' : 'Upload Image',
                width: double.infinity,
                height: 45.h,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSubmitButton() {
    return BlocConsumer<UpdateProductBloc, UpdateProductState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (_) {
            context.read<GetAllProductsBloc>().add(
              const GetAllProductsEvent.fetch(),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Product updated successfully')),
            );
            Navigator.pop(context);
          },
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error)),
            );
          },
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        return isLoading
            ? const Center(child: CircularProgressIndicator())
            : CustomButton(
                backgroundColor: context.myColors.bluePinkDark,
                onPressed: _onSubmit,
                text: 'Update Product',
                width: double.infinity,
                height: 45.h,
                lastRadius: 10,
                threeRadius: 10,
              );
      },
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      final imageUrl = context.read<UploadImageCubit>().imageUrl.isNotEmpty
          ? context.read<UploadImageCubit>().imageUrl
          : (widget.product.images?.firstOrNull ?? '');
      if (imageUrl.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please upload an image')),
        );
        return;
      }
      context.read<UpdateProductBloc>().add(
        UpdateProductEvent.updateProduct(
          body: UpdateProductRequestBody(
            id: widget.product.id!,
            title: _titleController.text,
            price: double.parse(_priceController.text),
            description: _descriptionController.text,
            images: [imageUrl],
            categoryId: _selectedCategoryId!,
          ),
        ),
      );
    }
  }
}
