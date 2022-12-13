// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotation_modal.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetQuotationModalCollection on Isar {
  IsarCollection<QuotationModal> get quotationModals => this.collection();
}

const QuotationModalSchema = CollectionSchema(
  name: r'QuotationModal',
  id: 9000714480206367260,
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
    r'finalamt': PropertySchema(
      id: 2,
      name: r'finalamt',
      type: IsarType.double,
    ),
    r'total': PropertySchema(
      id: 3,
      name: r'total',
      type: IsarType.double,
    )
  },
  estimateSize: _quotationModalEstimateSize,
  serialize: _quotationModalSerialize,
  deserialize: _quotationModalDeserialize,
  deserializeProp: _quotationModalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'customer': LinkSchema(
      id: -5822171413832923492,
      name: r'customer',
      target: r'CustomerModal',
      single: true,
    ),
    r'cart': LinkSchema(
      id: -5133449470623005226,
      name: r'cart',
      target: r'CartItem',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _quotationModalGetId,
  getLinks: _quotationModalGetLinks,
  attach: _quotationModalAttach,
  version: '3.0.5',
);

int _quotationModalEstimateSize(
  QuotationModal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _quotationModalSerialize(
  QuotationModal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.created);
  writer.writeDouble(offsets[1], object.dis);
  writer.writeDouble(offsets[2], object.finalamt);
  writer.writeDouble(offsets[3], object.total);
}

QuotationModal _quotationModalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuotationModal();
  object.created = reader.readDateTime(offsets[0]);
  object.dis = reader.readDouble(offsets[1]);
  object.finalamt = reader.readDouble(offsets[2]);
  object.id = id;
  object.total = reader.readDouble(offsets[3]);
  return object;
}

P _quotationModalDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _quotationModalGetId(QuotationModal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _quotationModalGetLinks(QuotationModal object) {
  return [object.customer, object.cart];
}

void _quotationModalAttach(
    IsarCollection<dynamic> col, Id id, QuotationModal object) {
  object.id = id;
  object.customer
      .attach(col, col.isar.collection<CustomerModal>(), r'customer', id);
  object.cart.attach(col, col.isar.collection<CartItem>(), r'cart', id);
}

extension QuotationModalQueryWhereSort
    on QueryBuilder<QuotationModal, QuotationModal, QWhere> {
  QueryBuilder<QuotationModal, QuotationModal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuotationModalQueryWhere
    on QueryBuilder<QuotationModal, QuotationModal, QWhereClause> {
  QueryBuilder<QuotationModal, QuotationModal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterWhereClause> idBetween(
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

extension QuotationModalQueryFilter
    on QueryBuilder<QuotationModal, QuotationModal, QFilterCondition> {
  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      createdEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      createdGreaterThan(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      createdLessThan(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      createdBetween(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      disEqualTo(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      disGreaterThan(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      disLessThan(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      disBetween(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      finalamtEqualTo(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      finalamtGreaterThan(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      finalamtLessThan(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      finalamtBetween(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      totalEqualTo(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      totalGreaterThan(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      totalLessThan(
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

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      totalBetween(
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

extension QuotationModalQueryObject
    on QueryBuilder<QuotationModal, QuotationModal, QFilterCondition> {}

extension QuotationModalQueryLinks
    on QueryBuilder<QuotationModal, QuotationModal, QFilterCondition> {
  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition> customer(
      FilterQuery<CustomerModal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'customer');
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customer', 0, true, 0, true);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition> cart(
      FilterQuery<CartItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'cart');
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      cartLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'cart', length, true, length, true);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      cartIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'cart', 0, true, 0, true);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      cartIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'cart', 0, false, 999999, true);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      cartLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'cart', 0, true, length, include);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      cartLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'cart', length, include, 999999, true);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterFilterCondition>
      cartLengthBetween(
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

extension QuotationModalQuerySortBy
    on QueryBuilder<QuotationModal, QuotationModal, QSortBy> {
  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy>
      sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> sortByDis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dis', Sort.asc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> sortByDisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dis', Sort.desc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> sortByFinalamt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalamt', Sort.asc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy>
      sortByFinalamtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalamt', Sort.desc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension QuotationModalQuerySortThenBy
    on QueryBuilder<QuotationModal, QuotationModal, QSortThenBy> {
  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy>
      thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> thenByDis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dis', Sort.asc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> thenByDisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dis', Sort.desc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> thenByFinalamt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalamt', Sort.asc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy>
      thenByFinalamtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finalamt', Sort.desc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension QuotationModalQueryWhereDistinct
    on QueryBuilder<QuotationModal, QuotationModal, QDistinct> {
  QueryBuilder<QuotationModal, QuotationModal, QDistinct> distinctByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created');
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QDistinct> distinctByDis() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dis');
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QDistinct> distinctByFinalamt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finalamt');
    });
  }

  QueryBuilder<QuotationModal, QuotationModal, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }
}

extension QuotationModalQueryProperty
    on QueryBuilder<QuotationModal, QuotationModal, QQueryProperty> {
  QueryBuilder<QuotationModal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuotationModal, DateTime, QQueryOperations> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<QuotationModal, double, QQueryOperations> disProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dis');
    });
  }

  QueryBuilder<QuotationModal, double, QQueryOperations> finalamtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finalamt');
    });
  }

  QueryBuilder<QuotationModal, double, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }
}
