// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companion_config.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCompanionConfigCollection on Isar {
  IsarCollection<CompanionConfig> get companionConfigs => this.collection();
}

const CompanionConfigSchema = CollectionSchema(
  name: r'CompanionConfig',
  id: 7412089292435650210,
  properties: {
    r'customInstructions': PropertySchema(
      id: 0,
      name: r'customInstructions',
      type: IsarType.string,
    ),
    r'mode': PropertySchema(
      id: 1,
      name: r'mode',
      type: IsarType.byte,
      enumMap: _CompanionConfigmodeEnumValueMap,
    ),
    r'studentId': PropertySchema(
      id: 2,
      name: r'studentId',
      type: IsarType.string,
    )
  },
  estimateSize: _companionConfigEstimateSize,
  serialize: _companionConfigSerialize,
  deserialize: _companionConfigDeserialize,
  deserializeProp: _companionConfigDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'studentId': IndexSchema(
      id: -6791323312898281473,
      name: r'studentId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'studentId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _companionConfigGetId,
  getLinks: _companionConfigGetLinks,
  attach: _companionConfigAttach,
  version: '3.1.0+1',
);

int _companionConfigEstimateSize(
  CompanionConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.customInstructions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.studentId.length * 3;
  return bytesCount;
}

void _companionConfigSerialize(
  CompanionConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.customInstructions);
  writer.writeByte(offsets[1], object.mode.index);
  writer.writeString(offsets[2], object.studentId);
}

CompanionConfig _companionConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CompanionConfig(
    customInstructions: reader.readStringOrNull(offsets[0]),
    mode: _CompanionConfigmodeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
        CompanionMode.teacher,
    studentId: reader.readString(offsets[2]),
  );
  object.isarId = id;
  return object;
}

P _companionConfigDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (_CompanionConfigmodeValueEnumMap[reader.readByteOrNull(offset)] ??
          CompanionMode.teacher) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CompanionConfigmodeEnumValueMap = {
  'teacher': 0,
  'friend': 1,
};
const _CompanionConfigmodeValueEnumMap = {
  0: CompanionMode.teacher,
  1: CompanionMode.friend,
};

Id _companionConfigGetId(CompanionConfig object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _companionConfigGetLinks(CompanionConfig object) {
  return [];
}

void _companionConfigAttach(
    IsarCollection<dynamic> col, Id id, CompanionConfig object) {
  object.isarId = id;
}

extension CompanionConfigByIndex on IsarCollection<CompanionConfig> {
  Future<CompanionConfig?> getByStudentId(String studentId) {
    return getByIndex(r'studentId', [studentId]);
  }

  CompanionConfig? getByStudentIdSync(String studentId) {
    return getByIndexSync(r'studentId', [studentId]);
  }

  Future<bool> deleteByStudentId(String studentId) {
    return deleteByIndex(r'studentId', [studentId]);
  }

  bool deleteByStudentIdSync(String studentId) {
    return deleteByIndexSync(r'studentId', [studentId]);
  }

  Future<List<CompanionConfig?>> getAllByStudentId(
      List<String> studentIdValues) {
    final values = studentIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'studentId', values);
  }

  List<CompanionConfig?> getAllByStudentIdSync(List<String> studentIdValues) {
    final values = studentIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'studentId', values);
  }

  Future<int> deleteAllByStudentId(List<String> studentIdValues) {
    final values = studentIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'studentId', values);
  }

  int deleteAllByStudentIdSync(List<String> studentIdValues) {
    final values = studentIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'studentId', values);
  }

  Future<Id> putByStudentId(CompanionConfig object) {
    return putByIndex(r'studentId', object);
  }

  Id putByStudentIdSync(CompanionConfig object, {bool saveLinks = true}) {
    return putByIndexSync(r'studentId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByStudentId(List<CompanionConfig> objects) {
    return putAllByIndex(r'studentId', objects);
  }

  List<Id> putAllByStudentIdSync(List<CompanionConfig> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'studentId', objects, saveLinks: saveLinks);
  }
}

extension CompanionConfigQueryWhereSort
    on QueryBuilder<CompanionConfig, CompanionConfig, QWhere> {
  QueryBuilder<CompanionConfig, CompanionConfig, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CompanionConfigQueryWhere
    on QueryBuilder<CompanionConfig, CompanionConfig, QWhereClause> {
  QueryBuilder<CompanionConfig, CompanionConfig, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterWhereClause>
      studentIdEqualTo(String studentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'studentId',
        value: [studentId],
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterWhereClause>
      studentIdNotEqualTo(String studentId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentId',
              lower: [],
              upper: [studentId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentId',
              lower: [studentId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentId',
              lower: [studentId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'studentId',
              lower: [],
              upper: [studentId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CompanionConfigQueryFilter
    on QueryBuilder<CompanionConfig, CompanionConfig, QFilterCondition> {
  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      customInstructionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customInstructions',
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      customInstructionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customInstructions',
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      customInstructionsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      customInstructionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      customInstructionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      customInstructionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customInstructions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      customInstructionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      customInstructionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      customInstructionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      customInstructionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customInstructions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      customInstructionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customInstructions',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      customInstructionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customInstructions',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      modeEqualTo(CompanionMode value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mode',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      modeGreaterThan(
    CompanionMode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mode',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      modeLessThan(
    CompanionMode value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mode',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      modeBetween(
    CompanionMode lower,
    CompanionMode upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      studentIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      studentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'studentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      studentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'studentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      studentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'studentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      studentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'studentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      studentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'studentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      studentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'studentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      studentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'studentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      studentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentId',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterFilterCondition>
      studentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'studentId',
        value: '',
      ));
    });
  }
}

extension CompanionConfigQueryObject
    on QueryBuilder<CompanionConfig, CompanionConfig, QFilterCondition> {}

extension CompanionConfigQueryLinks
    on QueryBuilder<CompanionConfig, CompanionConfig, QFilterCondition> {}

extension CompanionConfigQuerySortBy
    on QueryBuilder<CompanionConfig, CompanionConfig, QSortBy> {
  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy>
      sortByCustomInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customInstructions', Sort.asc);
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy>
      sortByCustomInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customInstructions', Sort.desc);
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy> sortByMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.asc);
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy>
      sortByModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.desc);
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy>
      sortByStudentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentId', Sort.asc);
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy>
      sortByStudentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentId', Sort.desc);
    });
  }
}

extension CompanionConfigQuerySortThenBy
    on QueryBuilder<CompanionConfig, CompanionConfig, QSortThenBy> {
  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy>
      thenByCustomInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customInstructions', Sort.asc);
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy>
      thenByCustomInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customInstructions', Sort.desc);
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy> thenByMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.asc);
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy>
      thenByModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.desc);
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy>
      thenByStudentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentId', Sort.asc);
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QAfterSortBy>
      thenByStudentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentId', Sort.desc);
    });
  }
}

extension CompanionConfigQueryWhereDistinct
    on QueryBuilder<CompanionConfig, CompanionConfig, QDistinct> {
  QueryBuilder<CompanionConfig, CompanionConfig, QDistinct>
      distinctByCustomInstructions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customInstructions',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QDistinct> distinctByMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mode');
    });
  }

  QueryBuilder<CompanionConfig, CompanionConfig, QDistinct> distinctByStudentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentId', caseSensitive: caseSensitive);
    });
  }
}

extension CompanionConfigQueryProperty
    on QueryBuilder<CompanionConfig, CompanionConfig, QQueryProperty> {
  QueryBuilder<CompanionConfig, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<CompanionConfig, String?, QQueryOperations>
      customInstructionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customInstructions');
    });
  }

  QueryBuilder<CompanionConfig, CompanionMode, QQueryOperations>
      modeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mode');
    });
  }

  QueryBuilder<CompanionConfig, String, QQueryOperations> studentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentId');
    });
  }
}
