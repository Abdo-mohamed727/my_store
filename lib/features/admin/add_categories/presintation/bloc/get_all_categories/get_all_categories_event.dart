import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_categories_event.freezed.dart';

@freezed
class GetAllCategoriesEvent with _$GetAllCategoriesEvent {
  const factory GetAllCategoriesEvent.fetch() = FetchGetAllCategoriesEvent;
}
