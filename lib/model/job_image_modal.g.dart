// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_image_modal.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetJobImageModalCollection on Isar {
  IsarCollection<JobImageModal> get jobImageModals => this.collection();
}

const JobImageModalSchema = CollectionSchema(
  name: r'JobImageModal',
  id: 1401946493452616336,
  properties: {
    r'awsKey': PropertySchema(
      id: 0,
      name: r'awsKey',
      type: IsarType.string,
    ),
    r'backendId': PropertySchema(
      id: 1,
      name: r'backendId',
      type: IsarType.long,
    ),
    r'backendfolderid': PropertySchema(
      id: 2,
      name: r'backendfolderid',
      type: IsarType.long,
    ),
    r'isSelected': PropertySchema(
      id: 3,
      name: r'isSelected',
      type: IsarType.bool,
    ),
    r'localurl': PropertySchema(
      id: 4,
      name: r'localurl',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 6,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _jobImageModalEstimateSize,
  serialize: _jobImageModalSerialize,
  deserialize: _jobImageModalDeserialize,
  deserializeProp: _jobImageModalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _jobImageModalGetId,
  getLinks: _jobImageModalGetLinks,
  attach: _jobImageModalAttach,
  version: '3.0.5',
);

int _jobImageModalEstimateSize(
  JobImageModal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.awsKey.length * 3;
  bytesCount += 3 + object.localurl.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _jobImageModalSerialize(
  JobImageModal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.awsKey);
  writer.writeLong(offsets[1], object.backendId);
  writer.writeLong(offsets[2], object.backendfolderid);
  writer.writeBool(offsets[3], object.isSelected);
  writer.writeString(offsets[4], object.localurl);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.url);
}

JobImageModal _jobImageModalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = JobImageModal();
  object.awsKey = reader.readString(offsets[0]);
  object.backendId = reader.readLong(offsets[1]);
  object.backendfolderid = reader.readLong(offsets[2]);
  object.id = id;
  object.isSelected = reader.readBool(offsets[3]);
  object.localurl = reader.readString(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.url = reader.readString(offsets[6]);
  return object;
}

P _jobImageModalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _jobImageModalGetId(JobImageModal object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _jobImageModalGetLinks(JobImageModal object) {
  return [];
}

void _jobImageModalAttach(
    IsarCollection<dynamic> col, Id id, JobImageModal object) {
  object.id = id;
}

extension JobImageModalQueryWhereSort
    on QueryBuilder<JobImageModal, JobImageModal, QWhere> {
  QueryBuilder<JobImageModal, JobImageModal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension JobImageModalQueryWhere
    on QueryBuilder<JobImageModal, JobImageModal, QWhereClause> {
  QueryBuilder<JobImageModal, JobImageModal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<JobImageModal, JobImageModal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterWhereClause> idBetween(
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

extension JobImageModalQueryFilter
    on QueryBuilder<JobImageModal, JobImageModal, QFilterCondition> {
  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      awsKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'awsKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      awsKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'awsKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      awsKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'awsKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      awsKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'awsKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      awsKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'awsKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      awsKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'awsKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      awsKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'awsKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      awsKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'awsKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      awsKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'awsKey',
        value: '',
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      awsKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'awsKey',
        value: '',
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      backendIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      backendIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backendId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      backendIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backendId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      backendIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backendId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      backendfolderidEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendfolderid',
        value: value,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      backendfolderidGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backendfolderid',
        value: value,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      backendfolderidLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backendfolderid',
        value: value,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      backendfolderidBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backendfolderid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
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

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      isSelectedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSelected',
        value: value,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      localurlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localurl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      localurlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localurl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      localurlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localurl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      localurlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localurl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      localurlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'localurl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      localurlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'localurl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      localurlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'localurl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      localurlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'localurl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      localurlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localurl',
        value: '',
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      localurlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'localurl',
        value: '',
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
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

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
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

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
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

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
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

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition> urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension JobImageModalQueryObject
    on QueryBuilder<JobImageModal, JobImageModal, QFilterCondition> {}

extension JobImageModalQueryLinks
    on QueryBuilder<JobImageModal, JobImageModal, QFilterCondition> {}

extension JobImageModalQuerySortBy
    on QueryBuilder<JobImageModal, JobImageModal, QSortBy> {
  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> sortByAwsKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awsKey', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> sortByAwsKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awsKey', Sort.desc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy>
      sortByBackendfolderid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendfolderid', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy>
      sortByBackendfolderidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendfolderid', Sort.desc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> sortByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy>
      sortByIsSelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.desc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> sortByLocalurl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localurl', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy>
      sortByLocalurlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localurl', Sort.desc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension JobImageModalQuerySortThenBy
    on QueryBuilder<JobImageModal, JobImageModal, QSortThenBy> {
  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> thenByAwsKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awsKey', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> thenByAwsKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awsKey', Sort.desc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy>
      thenByBackendfolderid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendfolderid', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy>
      thenByBackendfolderidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendfolderid', Sort.desc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> thenByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy>
      thenByIsSelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.desc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> thenByLocalurl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localurl', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy>
      thenByLocalurlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localurl', Sort.desc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension JobImageModalQueryWhereDistinct
    on QueryBuilder<JobImageModal, JobImageModal, QDistinct> {
  QueryBuilder<JobImageModal, JobImageModal, QDistinct> distinctByAwsKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'awsKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QDistinct> distinctByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId');
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QDistinct>
      distinctByBackendfolderid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendfolderid');
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QDistinct> distinctByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSelected');
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QDistinct> distinctByLocalurl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localurl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JobImageModal, JobImageModal, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension JobImageModalQueryProperty
    on QueryBuilder<JobImageModal, JobImageModal, QQueryProperty> {
  QueryBuilder<JobImageModal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<JobImageModal, String, QQueryOperations> awsKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'awsKey');
    });
  }

  QueryBuilder<JobImageModal, int, QQueryOperations> backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<JobImageModal, int, QQueryOperations> backendfolderidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendfolderid');
    });
  }

  QueryBuilder<JobImageModal, bool, QQueryOperations> isSelectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSelected');
    });
  }

  QueryBuilder<JobImageModal, String, QQueryOperations> localurlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localurl');
    });
  }

  QueryBuilder<JobImageModal, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<JobImageModal, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
