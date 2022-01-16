import 'package:e_commerce/constants.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/model/favorite_products_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    await initDB();
    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'cartProducts.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database database, int version) async {
        print('database created.......');
        await database.execute(''' CREATE TABLE $cartTableName( 
            $cartProductName TEXT NOT NULL,
             $cartProductImage TEXT NOT NULL, 
             $cartProductPrice TEXT NOT NULL, 
             $cartProductQuantity INTEGER NOT NULL , 
             $cartProductId TEXT NOT NULL )''');
        print(' $cartTableName table created.......');

        await database.execute(''' CREATE TABLE $favTableName( 
            $favProductName TEXT NOT NULL,
             $favProductImage TEXT NOT NULL, 
             $favProductPrice TEXT NOT NULL,
             $favProductDescription TEXT NOT NULL, 
             $favProductId TEXT NOT NULL )''');
        print(' $favTableName table created.......');
      },
    );
  }

  insertToCart(CartProductModel model) async {
    var clientDb = await database;
    await clientDb.insert(cartTableName, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(' product inserted.......');
  }

  insertToFavorites(FavoritesProductModel model) async {
    var clientDb = await database;
    await clientDb.insert(favTableName, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(' product added to favorites.......');
  }

  getAllCartProducts() async {
    var clientDb = await database;
    List<Map> cartProductsList = await clientDb.query(cartTableName);
    List<CartProductModel> allCartProducts = cartProductsList.isNotEmpty
        ? cartProductsList
            .map((cartProduct) => CartProductModel.fromJson(cartProduct))
            .toList()
        : [];

    return allCartProducts;
  }

  getAllFavoriteProducts() async {
    var clientDb = await database;
    List<Map> favoriteProductsList = await clientDb.query(favTableName);
    List<FavoritesProductModel> allFavProducts = favoriteProductsList.isNotEmpty
        ? favoriteProductsList
            .map((favProduct) => FavoritesProductModel.fromJson(favProduct))
            .toList()
        : [];

    return allFavProducts;
  }

  update(CartProductModel model) async {
    var clientDB = await database;
    await clientDB.update(cartTableName, model.toJson(),
        where: ' $cartProductId = ?', whereArgs: ['${model.productId}']);
  }

  deleteProductFromCart(String proId) async {
    var clientDB = await database;
    await clientDB.delete('$cartTableName',
        where: '$cartProductId = ?', whereArgs: [proId]);
  }

  deleteProductFromFavorites(String proId) async {
    var clientDB = await database;
    await clientDB.delete('$favTableName',
        where: '$favProductId = ?', whereArgs: [proId]);
  }

  deleteAllCartProducts() async {
    var clientDB = await database;
    await clientDB.rawDelete('DELETE FROM $cartTableName');
  }
}
