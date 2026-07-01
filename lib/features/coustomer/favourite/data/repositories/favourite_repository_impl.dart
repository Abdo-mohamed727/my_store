import 'package:my_store/features/coustomer/favourite/data/data_sources/local_favourite_data_source.dart';
import 'package:my_store/features/coustomer/favourite/data/models/favourite_model.dart';

class FavouriteRepositoryImpl {
  FavouriteRepositoryImpl(this._localDataSource);

  final LocalFavouriteDataSource _localDataSource;

  Future<List<FavouriteModel>> getFavourites() {
    return _localDataSource.getFavourites();
  }

  Future<Set<String>> getFavouriteIds() {
    return _localDataSource.getFavouriteIds();
  }

  Future<void> addFavourite(FavouriteModel product) {
    return _localDataSource.addFavourite(product);
  }

  Future<void> removeFavourite(String productId) {
    return _localDataSource.removeFavourite(productId);
  }

  Future<bool> isFavourite(String productId) {
    return _localDataSource.isFavourite(productId);
  }

  Future<void> toggleFavourite(FavouriteModel product) {
    return _localDataSource.toggleFavourite(product);
  }
}
