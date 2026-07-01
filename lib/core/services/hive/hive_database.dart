import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_store/features/coustomer/favourite/data/models/favourite_model.dart';

class HiveDatabas {
  HiveDatabas._();

  static const String favouritesBoxName = 'favourites_box';

  static Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(FavouriteModelAdapter().typeId)) {
      Hive.registerAdapter(FavouriteModelAdapter());
    }

    if (!Hive.isBoxOpen(favouritesBoxName)) {
      await Hive.openBox<FavouriteModel>(favouritesBoxName);
    }
  }

  static Box<FavouriteModel> get favouritesBox {
    if (!Hive.isBoxOpen(favouritesBoxName)) {
      throw StateError('Favourites box is not open');
    }
    return Hive.box<FavouriteModel>(favouritesBoxName);
  }
}
