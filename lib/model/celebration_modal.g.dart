// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celebration_modal.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCelebrationModalCollection on Isar {
  IsarCollection<CelebrationModal> get celebrationModals => this.collection();
}

const CelebrationModalSchema = CollectionSchema(
  name: r'CelebrationModal',
  id: -494413924831074272,
  properties: {
    r'celebration': PropertySchema(
      id: 0,
      name: r'celebration',
      type: IsarType.string,
    ),
    r'customer': PropertySchema(
      id: 1,
      name: r'customer',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 2,
      name: r'date',
      type: IsarType.long,
    ),
    r'month': PropertySchema(
      id: 3,
      name: r'month',
      type: IsarType.long,
    ),
    r'number': PropertySchema(
      id: 4,
      name: r'number',
      type: IsarType.string,
    )
  },
  estimateSize: _celebrationModalEstimateSize,
  serialize: _celebrationModalSerialize,
  deserialize: _celebrationModalDeserialize,
  deserializeProp: _celebrationModalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _celebrationModalGetId,
  getLinks: _celebrationModalGetLinks,
  attach: _celebrationModalAttach,
  version: '3.0.5',
);

int _celebrationModalEstimateSize(
  CelebrationModal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.celebration.length * 3;
  bytesCount += 3 + object.customer.length * 3;
  bytesCount += 3 + object.number.length * 3;
  return bytesCount;
}

void _celebrationModalSerialize(
  CelebrationModal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.celebration);
  writer.writeString(offsets[1], object.customer);
  writer.writeLong(offsets[2], object.date);
  writer.writeLong(offsets[3], object.month);
  writer.writeString(offsets[4], object.number);
}

CelebrationModal _celebrationModalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CelebrationModal();
  object.celebration = reader.readString(offsets[0]);
  object.customer = reader.readString(offsets[1]);
  object.date = reader.readLong(offsets[2]);
  object.id = id;
  object.month = reader.readLong(offsets[3]);
  object.number = reader.readString(offsets[4]);
  return object;
}

P _celebrationModalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _celebrationModalGetId(CelebrationModal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _celebrationModalGetLinks(CelebrationModal object) {
  return [];
}

void _celebrationModalAttach(
    IsarCollection<dynamic> col, Id id, CelebrationModal object) {
  object.id = id;
}

extension CelebrationModalQueryWhereSort
    on QueryBuilder<CelebrationModal, CelebrationModal, QWhere> {
  QueryBuilder<CelebrationModal, CelebrationModal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CelebrationModalQueryWhere
    on QueryBuilder<CelebrationModal, CelebrationModal, QWhereClause> {
  QueryBuilder<CelebrationModal, CelebrationModal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterWhereClause>
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

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterWhereClause> idBetween(
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

extension CelebrationModalQueryFilter
    on QueryBuilder<CelebrationModal, CelebrationModal, QFilterCondition> {
  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      celebrationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'celebration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      celebrationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'celebration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      celebrationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'celebration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      celebrationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'celebration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      celebrationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'celebration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      celebrationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'celebration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      celebrationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'celebration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      celebrationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'celebration',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      celebrationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'celebration',
        value: '',
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      celebrationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'celebration',
        value: '',
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      customerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      customerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      customerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      customerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      customerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      customerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      customerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      customerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      customerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customer',
        value: '',
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      customerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customer',
        value: '',
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      dateEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      dateGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      dateLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      dateBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
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

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
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

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
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

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      monthEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      monthGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      monthLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      monthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'month',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
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

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
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

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
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

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
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

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
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

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
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

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      numberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      numberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'number',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      numberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: '',
      ));
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterFilterCondition>
      numberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'number',
        value: '',
      ));
    });
  }
}

extension CelebrationModalQueryObject
    on QueryBuilder<CelebrationModal, CelebrationModal, QFilterCondition> {}

extension CelebrationModalQueryLinks
    on QueryBuilder<CelebrationModal, CelebrationModal, QFilterCondition> {}

extension CelebrationModalQuerySortBy
    on QueryBuilder<CelebrationModal, CelebrationModal, QSortBy> {
  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      sortByCelebration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'celebration', Sort.asc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      sortByCelebrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'celebration', Sort.desc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      sortByCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.asc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      sortByCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.desc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      sortByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      sortByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }
}

extension CelebrationModalQuerySortThenBy
    on QueryBuilder<CelebrationModal, CelebrationModal, QSortThenBy> {
  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      thenByCelebration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'celebration', Sort.asc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      thenByCelebrationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'celebration', Sort.desc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      thenByCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.asc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      thenByCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.desc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      thenByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QAfterSortBy>
      thenByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }
}

extension CelebrationModalQueryWhereDistinct
    on QueryBuilder<CelebrationModal, CelebrationModal, QDistinct> {
  QueryBuilder<CelebrationModal, CelebrationModal, QDistinct>
      distinctByCelebration({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'celebration', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QDistinct>
      distinctByCustomer({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QDistinct>
      distinctByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month');
    });
  }

  QueryBuilder<CelebrationModal, CelebrationModal, QDistinct> distinctByNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'number', caseSensitive: caseSensitive);
    });
  }
}

extension CelebrationModalQueryProperty
    on QueryBuilder<CelebrationModal, CelebrationModal, QQueryProperty> {
  QueryBuilder<CelebrationModal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CelebrationModal, String, QQueryOperations>
      celebrationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'celebration');
    });
  }

  QueryBuilder<CelebrationModal, String, QQueryOperations> customerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customer');
    });
  }

  QueryBuilder<CelebrationModal, int, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<CelebrationModal, int, QQueryOperations> monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }

  QueryBuilder<CelebrationModal, String, QQueryOperations> numberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'number');
    });
  }
}
