// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_modal.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTransactionModalCollection on Isar {
  IsarCollection<TransactionModal> get transactionModals => this.collection();
}

const TransactionModalSchema = CollectionSchema(
  name: r'TransactionModal',
  id: 6504406861683411259,
  properties: {
    r'time': PropertySchema(
      id: 0,
      name: r'time',
      type: IsarType.dateTime,
    ),
    r'title': PropertySchema(
      id: 1,
      name: r'title',
      type: IsarType.string,
    ),
    r'transactionAmt': PropertySchema(
      id: 2,
      name: r'transactionAmt',
      type: IsarType.double,
    )
  },
  estimateSize: _transactionModalEstimateSize,
  serialize: _transactionModalSerialize,
  deserialize: _transactionModalDeserialize,
  deserializeProp: _transactionModalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'customer': LinkSchema(
      id: 6297519646723078600,
      name: r'customer',
      target: r'CustomerModal',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _transactionModalGetId,
  getLinks: _transactionModalGetLinks,
  attach: _transactionModalAttach,
  version: '3.0.5',
);

int _transactionModalEstimateSize(
  TransactionModal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _transactionModalSerialize(
  TransactionModal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.time);
  writer.writeString(offsets[1], object.title);
  writer.writeDouble(offsets[2], object.transactionAmt);
}

TransactionModal _transactionModalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionModal();
  object.id = id;
  object.time = reader.readDateTime(offsets[0]);
  object.title = reader.readString(offsets[1]);
  object.transactionAmt = reader.readDouble(offsets[2]);
  return object;
}

P _transactionModalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _transactionModalGetId(TransactionModal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _transactionModalGetLinks(TransactionModal object) {
  return [object.customer];
}

void _transactionModalAttach(
    IsarCollection<dynamic> col, Id id, TransactionModal object) {
  object.id = id;
  object.customer
      .attach(col, col.isar.collection<CustomerModal>(), r'customer', id);
}

extension TransactionModalQueryWhereSort
    on QueryBuilder<TransactionModal, TransactionModal, QWhere> {
  QueryBuilder<TransactionModal, TransactionModal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TransactionModalQueryWhere
    on QueryBuilder<TransactionModal, TransactionModal, QWhereClause> {
  QueryBuilder<TransactionModal, TransactionModal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<TransactionModal, TransactionModal, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterWhereClause> idBetween(
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

extension TransactionModalQueryFilter
    on QueryBuilder<TransactionModal, TransactionModal, QFilterCondition> {
  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
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

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
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

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      timeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      timeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      timeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      timeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      transactionAmtEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionAmt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      transactionAmtGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionAmt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      transactionAmtLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionAmt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      transactionAmtBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionAmt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension TransactionModalQueryObject
    on QueryBuilder<TransactionModal, TransactionModal, QFilterCondition> {}

extension TransactionModalQueryLinks
    on QueryBuilder<TransactionModal, TransactionModal, QFilterCondition> {
  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      customer(FilterQuery<CustomerModal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'customer');
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterFilterCondition>
      customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customer', 0, true, 0, true);
    });
  }
}

extension TransactionModalQuerySortBy
    on QueryBuilder<TransactionModal, TransactionModal, QSortBy> {
  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy>
      sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy>
      sortByTransactionAmt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionAmt', Sort.asc);
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy>
      sortByTransactionAmtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionAmt', Sort.desc);
    });
  }
}

extension TransactionModalQuerySortThenBy
    on QueryBuilder<TransactionModal, TransactionModal, QSortThenBy> {
  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy>
      thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy>
      thenByTransactionAmt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionAmt', Sort.asc);
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QAfterSortBy>
      thenByTransactionAmtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionAmt', Sort.desc);
    });
  }
}

extension TransactionModalQueryWhereDistinct
    on QueryBuilder<TransactionModal, TransactionModal, QDistinct> {
  QueryBuilder<TransactionModal, TransactionModal, QDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionModal, TransactionModal, QDistinct>
      distinctByTransactionAmt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionAmt');
    });
  }
}

extension TransactionModalQueryProperty
    on QueryBuilder<TransactionModal, TransactionModal, QQueryProperty> {
  QueryBuilder<TransactionModal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TransactionModal, DateTime, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<TransactionModal, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<TransactionModal, double, QQueryOperations>
      transactionAmtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionAmt');
    });
  }
}
