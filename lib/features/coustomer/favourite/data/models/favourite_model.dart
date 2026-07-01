import 'package:hive/hive.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';
import 'package:my_store/features/coustomer/product_details/data/models/product_model.dart';

@HiveType(typeId: 1)
class FavouriteModel extends HiveObject {
  FavouriteModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.categoryName,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      categoryName: json['categoryName'] as String? ?? '',
    );
  }

  factory FavouriteModel.fromProduct(ProductGetAllModel product) {
    final images = product.images;
    return FavouriteModel(
      id: product.id ?? '',
      title: product.title ?? '',
      image: images.isNotEmpty ? images.first : '',
      price: product.price ?? 0,
      categoryName: product.category?.name ?? '',
    );
  }

  factory FavouriteModel.fromProductDetails(ProductDetailsModel product) {
    final images = product.images;
    return FavouriteModel(
      id: product.id ?? '',
      title: product.title ?? '',
      image: images.isNotEmpty ? images.first : '',
      price: product.price ?? 0,
      categoryName: product.category?.name ?? '',
    );
  }

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final String categoryName;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'categoryName': categoryName,
    };
  }

  bool get isValid => id.trim().isNotEmpty;
}

class FavouriteModelAdapter extends TypeAdapter<FavouriteModel> {
  @override
  final int typeId = 1;

  @override
  FavouriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return FavouriteModel(
      id: fields[0] as String? ?? '',
      title: fields[1] as String? ?? '',
      image: fields[2] as String? ?? '',
      price: (fields[3] as num?)?.toDouble() ?? 0,
      categoryName: fields[4] as String? ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.categoryName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
