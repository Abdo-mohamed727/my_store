import 'package:hive/hive.dart';
import 'package:my_store/features/coustomer/favourite/data/models/favourite_model.dart';

abstract class LocalFavouriteDataSource {
  Future<List<FavouriteModel>> getFavourites();
  Future<Set<String>> getFavouriteIds();
  Future<void> addFavourite(FavouriteModel product);
  Future<void> removeFavourite(String productId);
  Future<bool> isFavourite(String productId);
  Future<void> toggleFavourite(FavouriteModel product);
}

class LocalFavouriteDataSourceImpl implements LocalFavouriteDataSource {
  LocalFavouriteDataSourceImpl(this._box);

  final Box<FavouriteModel> _box;

  @override
  Future<List<FavouriteModel>> getFavourites() async {
    final favourites = <FavouriteModel>[];

    for (final key in _box.keys) {
      try {
        final value = _box.get(key);
        if (value != null && value.isValid) {
          favourites.add(value);
        } else {
          await _box.delete(key);
        }
      } catch (_) {
        await _box.delete(key);
      }
    }

    return List.unmodifiable(favourites);
  }

  @override
  Future<Set<String>> getFavouriteIds() async {
    final favourites = await getFavourites();
    return favourites.map((product) => product.id).toSet();
  }

  @override
  Future<void> addFavourite(FavouriteModel product) async {
    if (!product.isValid) {
      return;
    }
    await _box.put(product.id, product);
  }

  @override
  Future<void> removeFavourite(String productId) async {
    if (productId.trim().isEmpty) {
      return;
    }
    await _box.delete(productId);
  }

  @override
  Future<bool> isFavourite(String productId) async {
    if (productId.trim().isEmpty) {
      return false;
    }
    return _box.containsKey(productId);
  }

  @override
  Future<void> toggleFavourite(FavouriteModel product) async {
    if (!product.isValid) {
      return;
    }

    final isSaved = await isFavourite(product.id);
    if (isSaved) {
      await removeFavourite(product.id);
      return;
    }

    await addFavourite(product);
  }
}
