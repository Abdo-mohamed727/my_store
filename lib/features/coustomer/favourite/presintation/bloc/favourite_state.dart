import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/features/coustomer/favourite/data/models/favourite_model.dart';

part 'favourite_state.freezed.dart';

@freezed
class FavouriteState with _$FavouriteState {
  const factory FavouriteState.initial() = _Initial;
  const factory FavouriteState.loading() = _Loading;
  const factory FavouriteState.loaded({
    required List<FavouriteModel> favourites,
    required Set<String> favouriteProductIds,
  }) = _Loaded;
  const factory FavouriteState.error(String message) = _Error;
}
