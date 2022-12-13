import 'package:isar/isar.dart';
import 'package:pm/db/db.dart';
import 'package:pm/model/customer_modal.dart';
import 'package:pm/model/quotation_modal.dart';

import '../model/cart_item.dart';

class QuotationRepo {
  Future addQuotation({required QuotationModal quote, required CustomerModal customer, required List<CartItem> cart}) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      for (var element in cart) {
        await isar.cartItems.put(element);
        await element.product.save();
      }
      await isar.quotationModals.put(quote);
      await isar.customerModals.put(customer);
      await quote.cart.save();
      await quote.customer.save();
    });
  }

  Future deleteQuotation(int id) async {
    final isar = await openDb();
    await isar.writeTxn(() async {
      await isar.quotationModals.delete(id);
    });
  }

  Stream<List<QuotationModal>> listenToQuotation() async* {
    final isar = await openDb();
    yield* isar.quotationModals.where(sort: Sort.desc).watch(fireImmediately: true);
  }

  Stream<List<QuotationModal>> listenToQuote(String filter) async* {
    final isar = await openDb();
    yield* isar.quotationModals.filter().customer((q) => q.numberStartsWith(filter)).watch(fireImmediately: true);
  }

Stream<QuotationModal?> listenToQuoteById(int id) async* {
    final isar = await openDb();
    yield* isar.quotationModals.watchObject(id,fireImmediately: true);
  }

}
