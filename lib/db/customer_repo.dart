import 'package:pm/model/customer_modal.dart';
import 'package:isar/isar.dart';
import 'db.dart';

class CustomerRepo {
  Future<void> createCustomer(CustomerModal customer) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      await isar.customerModals.put(customer);
    });
  }

  Future<void> deleteCustomer(int id) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      await isar.customerModals.delete(id);
    });
  }

  Stream<List<CustomerModal>> getRecoveryList()async*{
    final isar = await openDb();
    yield*  isar.customerModals.filter().duesGreaterThan(0).watch(fireImmediately: true);
  }

  Future<List<CustomerModal>> getCustomer(String n) async {
    final isar = await openDb();
    return await isar.customerModals.filter().nameStartsWith(n, caseSensitive: false).findAll();
  }

  Stream<List<CustomerModal>> listenTocustomer() async* {
    final isar = await openDb();
    yield* isar.customerModals.where(sort: Sort.desc).watch(fireImmediately: true);
  }

  Stream<List<CustomerModal>> filterCustomer({required String name}) async* {
    final isar = await openDb();
    yield* isar.customerModals.filter().nameStartsWith(name, caseSensitive: false).watch(fireImmediately: true);
  }

  Stream<CustomerModal?> listenToSingleCustomer(int id) async* {
    final isar = await openDb();
    yield* isar.customerModals.watchObject(id, fireImmediately: true);
  }
}
