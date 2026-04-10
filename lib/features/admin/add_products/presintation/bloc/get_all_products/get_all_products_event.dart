import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_products_event.freezed.dart';

@freezed
class GetAllProductsEvent with _$GetAllProductsEvent {
  const factory GetAllProductsEvent.fetch() = FetchGetAllProductsEvent;
}
