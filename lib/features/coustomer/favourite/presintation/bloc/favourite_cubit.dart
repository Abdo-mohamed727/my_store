import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/coustomer/favourite/data/models/favourite_model.dart';
import 'package:my_store/features/coustomer/favourite/data/repositories/favourite_repository_impl.dart';
import 'package:my_store/features/coustomer/favourite/presintation/bloc/favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this._repository) : super(const FavouriteState.initial());

  final FavouriteRepositoryImpl _repository;

  Future<void> loadFavourites() async {
    emit(const FavouriteState.loading());
    await _emitLoadedState();
  }

  Future<void> ensureLoaded() async {
    final isLoaded = state.maybeWhen(
      loaded: (_, __) => true,
      orElse: () => false,
    );
    if (isLoaded) {
      return;
    }
    await loadFavourites();
  }

  Future<void> toggleFavourite(FavouriteModel product) async {
    try {
      await _repository.toggleFavourite(product);
      await _emitLoadedState();
    } catch (e) {
      emit(FavouriteState.error(e.toString()));
    }
  }

  Future<void> removeFavourite(String productId) async {
    try {
      await _repository.removeFavourite(productId);
      await _emitLoadedState();
    } catch (e) {
      emit(FavouriteState.error(e.toString()));
    }
  }

  bool isFavourite(String productId) {
    return state.maybeWhen(
      loaded: (_, favouriteProductIds) => favouriteProductIds.contains(productId),
      orElse: () => false,
    );
  }

  Future<void> _emitLoadedState() async {
    try {
      final favourites = await _repository.getFavourites();
      final favouriteProductIds = favourites.map((product) => product.id).toSet();
      emit(
        FavouriteState.loaded(
          favourites: favourites,
          favouriteProductIds: favouriteProductIds,
        ),
      );
    } catch (e) {
      emit(FavouriteState.error(e.toString()));
    }
  }
}
