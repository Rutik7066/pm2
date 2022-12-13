import 'package:pm/db/db.dart';
import 'package:isar/isar.dart';
import 'package:pm/model/product_modal.dart';

class ProductRepo {
  static Future<int> addProduct(ProductModal product) async {
    final isar = await openDb();
    return await isar.writeTxn(() async {
      return await isar.productModals.put(product);
    });
  }

  Future<List<ProductModal>> getProduct(String p) async {
    final isar = await openDb();
    return await isar.productModals.filter().nameContains(p, caseSensitive: false).findAll();
  }

  Stream<List<ProductModal>> listenToProduct() async* {
    final isar = await openDb();
    yield* isar.productModals.where(sort: Sort.asc).watch(fireImmediately: true);
  }

  
  Stream<List<ProductModal>> listenToOneProduct(String v) async* {
    final isar = await openDb();
    yield* isar.productModals.filter().nameStartsWith(v,caseSensitive: false).watch(fireImmediately: true);
  }


  Future<void> deleteProduct(int id) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      await isar.productModals.delete(id);
    });
  }
}
