import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/coustomer/home/data/repositories/home_repository_impl.dart';
import 'package:my_store/features/coustomer/home/presintation/bloc/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(const HomeState.initial());

  final HomeRepositoryImpl _homeRepository;

  Future<void> loadHomeData() async {
    emit(const HomeState.loading());
    try {
      final banners = await _homeRepository.getPromoBanners();
      final categories = await _homeRepository.getCategories();
      final products = await _homeRepository.getFeaturedProducts();
      emit(
        HomeState.loaded(
          banners: banners,
          categories: categories,
          products: products,
        ),
      );
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }

  void toggleFavorite(String productId) {
    state.mapOrNull(
      loaded: (loaded) {
        final updated = Set<String>.from(loaded.favoriteProductIds);
        if (updated.contains(productId)) {
          updated.remove(productId);
        } else {
          updated.add(productId);
        }
        emit(loaded.copyWith(favoriteProductIds: updated));
      },
    );
  }
}
