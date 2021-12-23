import 'package:e_commerce/constants.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper();

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
        await database.execute(''' CREATE TABLE $tableName( 
            $productName TEXT NOT NULL,
             $productImage TEXT NOT NULL, 
             $productPrice TEXT NOT NULL, 
             $productQuantity INTEGER NOT NULL , 
             $productId TEXT NOT NULL )''');
        print('table created.......');
      },
    );
  }

  insert(CartProductModel model) async {
    var clientDb = await database;
    await clientDb.insert(tableName, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(' product inserted.......');
  }

  getAllCartProducts() async {
    var clientDb = await database;
    List<Map> cartProductsList = await clientDb.query(tableName);
    List<CartProductModel> allCartProducts = cartProductsList.isNotEmpty
        ? cartProductsList
            .map((cartProduct) => CartProductModel.fromJson(cartProduct))
            .toList()
        : [];

    return allCartProducts;
  }

  update(CartProductModel model) async {
    var clientDB = await database;
    await clientDB.update(tableName, model.toJson(),
        where: ' $productId = ?', whereArgs: ['${model.productId}']);
  }
  deleteProduct(String proId) async{
    var clientDB = await database;
    await clientDB.delete('$tableName',where: '$productId = ?', whereArgs: [proId] );

  }
  deleteAllCartProducts() async {
    var clientDB = await database;
    await clientDB.rawDelete('DELETE FROM $tableName');
  }
}
