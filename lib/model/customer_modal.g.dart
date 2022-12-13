// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_modal.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCustomerModalCollection on Isar {
  IsarCollection<CustomerModal> get customerModals => this.collection();
}

const CustomerModalSchema = CollectionSchema(
  name: r'CustomerModal',
  id: -2829500725110058571,
  properties: {
    r'dues': PropertySchema(
      id: 0,
      name: r'dues',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'number': PropertySchema(
      id: 2,
      name: r'number',
      type: IsarType.string,
    )
  },
  estimateSize: _customerModalEstimateSize,
  serialize: _customerModalSerialize,
  deserialize: _customerModalDeserialize,
  deserializeProp: _customerModalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'bill': LinkSchema(
      id: 6766924840901044835,
      name: r'bill',
      target: r'BillModal',
      single: false,
      linkName: r'customer',
    ),
    r'event': LinkSchema(
      id: 4905230023281709260,
      name: r'event',
      target: r'EventModal',
      single: false,
      linkName: r'customer',
    ),
    r'transaction': LinkSchema(
      id: -4595472914011659676,
      name: r'transaction',
      target: r'TransactionModal',
      single: false,
      linkName: r'customer',
    )
  },
  embeddedSchemas: {},
  getId: _customerModalGetId,
  getLinks: _customerModalGetLinks,
  attach: _customerModalAttach,
  version: '3.0.5',
);

int _customerModalEstimateSize(
  CustomerModal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.number.length * 3;
  return bytesCount;
}

void _customerModalSerialize(
  CustomerModal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.dues);
  writer.writeString(offsets[1], object.name);
  writer.writeString(offsets[2], object.number);
}

CustomerModal _customerModalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CustomerModal();
  object.dues = reader.readDouble(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.number = reader.readString(offsets[2]);
  return object;
}

P _customerModalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _customerModalGetId(CustomerModal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _customerModalGetLinks(CustomerModal object) {
  return [object.bill, object.event, object.transaction];
}

void _customerModalAttach(
    IsarCollection<dynamic> col, Id id, CustomerModal object) {
  object.id = id;
  object.bill.attach(col, col.isar.collection<BillModal>(), r'bill', id);
  object.event.attach(col, col.isar.collection<EventModal>(), r'event', id);
  object.transaction
      .attach(col, col.isar.collection<TransactionModal>(), r'transaction', id);
}

extension CustomerModalQueryWhereSort
    on QueryBuilder<CustomerModal, CustomerModal, QWhere> {
  QueryBuilder<CustomerModal, CustomerModal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CustomerModalQueryWhere
    on QueryBuilder<CustomerModal, CustomerModal, QWhereClause> {
  QueryBuilder<CustomerModal, CustomerModal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CustomerModalQueryFilter
    on QueryBuilder<CustomerModal, CustomerModal, QFilterCondition> {
  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition> duesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dues',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      duesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dues',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      duesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dues',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition> duesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dues',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      numberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      numberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      numberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      numberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      numberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      numberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      numberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      numberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'number',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      numberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: '',
      ));
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      numberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'number',
        value: '',
      ));
    });
  }
}

extension CustomerModalQueryObject
    on QueryBuilder<CustomerModal, CustomerModal, QFilterCondition> {}

extension CustomerModalQueryLinks
    on QueryBuilder<CustomerModal, CustomerModal, QFilterCondition> {
  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition> bill(
      FilterQuery<BillModal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'bill');
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      billLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'bill', length, true, length, true);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      billIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'bill', 0, true, 0, true);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      billIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'bill', 0, false, 999999, true);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      billLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'bill', 0, true, length, include);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      billLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'bill', length, include, 999999, true);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      billLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'bill', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition> event(
      FilterQuery<EventModal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'event');
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      eventLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'event', length, true, length, true);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      eventIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'event', 0, true, 0, true);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      eventIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'event', 0, false, 999999, true);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      eventLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'event', 0, true, length, include);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      eventLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'event', length, include, 999999, true);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      eventLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'event', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition> transaction(
      FilterQuery<TransactionModal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'transaction');
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      transactionLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transaction', length, true, length, true);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      transactionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transaction', 0, true, 0, true);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      transactionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transaction', 0, false, 999999, true);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      transactionLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transaction', 0, true, length, include);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      transactionLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transaction', length, include, 999999, true);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterFilterCondition>
      transactionLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'transaction', lower, includeLower, upper, includeUpper);
    });
  }
}

extension CustomerModalQuerySortBy
    on QueryBuilder<CustomerModal, CustomerModal, QSortBy> {
  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> sortByDues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dues', Sort.asc);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> sortByDuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dues', Sort.desc);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> sortByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> sortByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }
}

extension CustomerModalQuerySortThenBy
    on QueryBuilder<CustomerModal, CustomerModal, QSortThenBy> {
  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> thenByDues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dues', Sort.asc);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> thenByDuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dues', Sort.desc);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> thenByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QAfterSortBy> thenByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }
}

extension CustomerModalQueryWhereDistinct
    on QueryBuilder<CustomerModal, CustomerModal, QDistinct> {
  QueryBuilder<CustomerModal, CustomerModal, QDistinct> distinctByDues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dues');
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CustomerModal, CustomerModal, QDistinct> distinctByNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'number', caseSensitive: caseSensitive);
    });
  }
}

extension CustomerModalQueryProperty
    on QueryBuilder<CustomerModal, CustomerModal, QQueryProperty> {
  QueryBuilder<CustomerModal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CustomerModal, double, QQueryOperations> duesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dues');
    });
  }

  QueryBuilder<CustomerModal, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CustomerModal, String, QQueryOperations> numberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'number');
    });
  }
}
