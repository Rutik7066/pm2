// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_modal.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetBillModalCollection on Isar {
  IsarCollection<BillModal> get billModals => this.collection();
}

const BillModalSchema = CollectionSchema(
  name: r'BillModal',
  id: 6385868477356431227,
  properties: {
    r'created': PropertySchema(
      id: 0,
      name: r'created',
      type: IsarType.dateTime,
    ),
    r'dis': PropertySchema(
      id: 1,
      name: r'dis',
      type: IsarType.double,
    ),
    r'dues': PropertySchema(
      id: 2,
      name: r'dues',
      type: IsarType.double,
    ),
    r'finalamt': PropertySchema(
      id: 3,
      name: r'finalamt',
      type: IsarType.double,
    ),
    r'paid': PropertySchema(
      id: 4,
      name: r'paid',
      type: IsarType.double,
    ),
    r'total': PropertySchema(
      id: 5,
      name: r'total',
      type: IsarType.double,
    )
  },
  estimateSize: _billModalEstimateSize,
  serialize: _billModalSerialize,
  deserialize: _billModalDeserialize,
  deserializeProp: _billModalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'customer': LinkSchema(
      id: -8201689102876016780,
      name: r'customer',
      target: r'CustomerModal',
      single: true,
    ),
    r'event': LinkSchema(
      id: -4806646743555452669,
      name: r'event',
      target: r'EventModal',
      single: true,
    ),
    r'cart': LinkSchema(
      id: 7189453926255293642,
      name: r'cart',
      target: r'CartItem',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _billModalGetId,
  getLinks: _billModalGetLinks,
  attach: _billModalAttach,
  version: '3.0.5',
);

int _billModalEstimateSize(
  BillModal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _billModalSerialize(
  BillModal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.created);
  writer.writeDouble(offsets[1], object.dis);
  writer.writeDouble(offsets[2], object.dues);
  writer.writeDouble(offsets[3], object.finalamt);
  writer.writeDouble(offsets[4], object.paid);
  writer.writeDouble(offsets[5], object.total);
}

BillModal _billModalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BillModal();
  object.created = reader.readDateTime(offsets[0]);
  object.dis = reader.readDouble(offsets[1]);
  object.dues = reader.readDouble(offsets[2]);
  object.finalamt = reader.readDouble(offsets[3]);
  object.id = id;
  object.paid = reader.readDouble(offsets[4]);
  object.total = reader.readDouble(offsets[5]);
  return object;
}

P _billModalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _billModalGetId(BillModal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _billModalGetLinks(BillModal object) {
  return [object.customer, object.event, object.cart];
}

void _billModalAttach(IsarCollection<dynamic> col, Id id, BillModal object) {
  object.id = id;
  object.customer
      .attach(col, col.isar.collection<CustomerModal>(), r'customer', id);
  object.event.attach(col, col.isar.collection<EventModal>(), r'event', id);
  object.cart.attach(col, col.isar.collection<CartItem>(), r'cart', id);
}

extension BillModalQueryWhereSort
    on QueryBuilder<BillModal, BillModal, QWhere> {
  QueryBuilder<BillModal, BillModal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BillModalQueryWhere
    on QueryBuilder<BillModal, BillModal, QWhereClause> {
  QueryBuilder<BillModal, BillModal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<BillModal, BillModal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterWhereClause> idBetween(
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

extension BillModalQueryFilter
    on QueryBuilder<BillModal, BillModal, QFilterCondition> {
  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> createdEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> createdGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> createdLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> createdBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'created',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> disEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dis',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> disGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dis',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> disLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dis',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> disBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> duesEqualTo(
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

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> duesGreaterThan(
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

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> duesLessThan(
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

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> duesBetween(
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

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> finalamtEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finalamt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> finalamtGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'finalamt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> finalamtLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'finalamt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> finalamtBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'finalamt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> paidEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> paidGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> paidLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> paidBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> totalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> totalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> totalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> totalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension BillModalQueryObject
    on QueryBuilder<BillModal, BillModal, QFilterCondition> {}

extension BillModalQueryLinks
    on QueryBuilder<BillModal, BillModal, QFilterCondition> {
  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> customer(
      FilterQuery<CustomerModal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'customer');
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customer', 0, true, 0, true);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> event(
      FilterQuery<EventModal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'event');
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> eventIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'event', 0, true, 0, true);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> cart(
      FilterQuery<CartItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'cart');
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> cartLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'cart', length, true, length, true);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> cartIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'cart', 0, true, 0, true);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> cartIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'cart', 0, false, 999999, true);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> cartLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'cart', 0, true, length, include);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition>
      cartLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'cart', length, include, 999999, true);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterFilterCondition> cartLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'cart', lower, includeLower, upper, includeUpper);
    });
  }
}

extension BillModalQuerySortBy on QueryBuilder<BillModal, BillModal, QSortBy> {
  QueryBuilder<BillModal, BillModal, QAfterSortBy> sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> sortByDis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dis', Sort.asc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> sortByDisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dis', Sort.desc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> sortByDues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dues', Sort.asc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> sortByDuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dues', Sort.desc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> sortByFinalamt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalamt', Sort.asc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> sortByFinalamtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalamt', Sort.desc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> sortByPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paid', Sort.asc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> sortByPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paid', Sort.desc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension BillModalQuerySortThenBy
    on QueryBuilder<BillModal, BillModal, QSortThenBy> {
  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenByDis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dis', Sort.asc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenByDisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dis', Sort.desc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenByDues() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dues', Sort.asc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenByDuesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dues', Sort.desc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenByFinalamt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalamt', Sort.asc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenByFinalamtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalamt', Sort.desc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenByPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paid', Sort.asc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenByPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paid', Sort.desc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<BillModal, BillModal, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension BillModalQueryWhereDistinct
    on QueryBuilder<BillModal, BillModal, QDistinct> {
  QueryBuilder<BillModal, BillModal, QDistinct> distinctByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created');
    });
  }

  QueryBuilder<BillModal, BillModal, QDistinct> distinctByDis() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dis');
    });
  }

  QueryBuilder<BillModal, BillModal, QDistinct> distinctByDues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dues');
    });
  }

  QueryBuilder<BillModal, BillModal, QDistinct> distinctByFinalamt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalamt');
    });
  }

  QueryBuilder<BillModal, BillModal, QDistinct> distinctByPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paid');
    });
  }

  QueryBuilder<BillModal, BillModal, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }
}

extension BillModalQueryProperty
    on QueryBuilder<BillModal, BillModal, QQueryProperty> {
  QueryBuilder<BillModal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BillModal, DateTime, QQueryOperations> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<BillModal, double, QQueryOperations> disProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dis');
    });
  }

  QueryBuilder<BillModal, double, QQueryOperations> duesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dues');
    });
  }

  QueryBuilder<BillModal, double, QQueryOperations> finalamtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalamt');
    });
  }

  QueryBuilder<BillModal, double, QQueryOperations> paidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paid');
    });
  }

  QueryBuilder<BillModal, double, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }
}
