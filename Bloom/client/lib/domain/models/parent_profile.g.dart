// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_profile.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParentProfileCollection on Isar {
  IsarCollection<ParentProfile> get parentProfiles => this.collection();
}

const ParentProfileSchema = CollectionSchema(
  name: r'ParentProfile',
  id: 614250861187319581,
  properties: {
    r'canViewJournal': PropertySchema(
      id: 0,
      name: r'canViewJournal',
      type: IsarType.bool,
    ),
    r'displayName': PropertySchema(
      id: 1,
      name: r'displayName',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 2,
      name: r'email',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 3,
      name: r'id',
      type: IsarType.string,
    ),
    r'linkedStudentIds': PropertySchema(
      id: 4,
      name: r'linkedStudentIds',
      type: IsarType.stringList,
    ),
    r'notifyOnMoodDrop': PropertySchema(
      id: 5,
      name: r'notifyOnMoodDrop',
      type: IsarType.bool,
    ),
    r'notifyOnTaskCompletion': PropertySchema(
      id: 6,
      name: r'notifyOnTaskCompletion',
      type: IsarType.bool,
    )
  },
  estimateSize: _parentProfileEstimateSize,
  serialize: _parentProfileSerialize,
  deserialize: _parentProfileDeserialize,
  deserializeProp: _parentProfileDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'id': IndexSchema(
      id: -3268401673993471357,
      name: r'id',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'id',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _parentProfileGetId,
  getLinks: _parentProfileGetLinks,
  attach: _parentProfileAttach,
  version: '3.1.0+1',
);

int _parentProfileEstimateSize(
  ParentProfile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.displayName.length * 3;
  bytesCount += 3 + object.email.length * 3;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.linkedStudentIds.length * 3;
  {
    for (var i = 0; i < object.linkedStudentIds.length; i++) {
      final value = object.linkedStudentIds[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _parentProfileSerialize(
  ParentProfile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.canViewJournal);
  writer.writeString(offsets[1], object.displayName);
  writer.writeString(offsets[2], object.email);
  writer.writeString(offsets[3], object.id);
  writer.writeStringList(offsets[4], object.linkedStudentIds);
  writer.writeBool(offsets[5], object.notifyOnMoodDrop);
  writer.writeBool(offsets[6], object.notifyOnTaskCompletion);
}

ParentProfile _parentProfileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParentProfile(
    canViewJournal: reader.readBoolOrNull(offsets[0]) ?? false,
    displayName: reader.readString(offsets[1]),
    email: reader.readString(offsets[2]),
    id: reader.readString(offsets[3]),
    linkedStudentIds: reader.readStringList(offsets[4]) ?? const [],
    notifyOnMoodDrop: reader.readBoolOrNull(offsets[5]) ?? true,
    notifyOnTaskCompletion: reader.readBoolOrNull(offsets[6]) ?? true,
  );
  object.isarId = id;
  return object;
}

P _parentProfileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? const []) as P;
    case 5:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 6:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _parentProfileGetId(ParentProfile object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _parentProfileGetLinks(ParentProfile object) {
  return [];
}

void _parentProfileAttach(
    IsarCollection<dynamic> col, Id id, ParentProfile object) {
  object.isarId = id;
}

extension ParentProfileByIndex on IsarCollection<ParentProfile> {
  Future<ParentProfile?> getById(String id) {
    return getByIndex(r'id', [id]);
  }

  ParentProfile? getByIdSync(String id) {
    return getByIndexSync(r'id', [id]);
  }

  Future<bool> deleteById(String id) {
    return deleteByIndex(r'id', [id]);
  }

  bool deleteByIdSync(String id) {
    return deleteByIndexSync(r'id', [id]);
  }

  Future<List<ParentProfile?>> getAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndex(r'id', values);
  }

  List<ParentProfile?> getAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'id', values);
  }

  Future<int> deleteAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'id', values);
  }

  int deleteAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'id', values);
  }

  Future<Id> putById(ParentProfile object) {
    return putByIndex(r'id', object);
  }

  Id putByIdSync(ParentProfile object, {bool saveLinks = true}) {
    return putByIndexSync(r'id', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllById(List<ParentProfile> objects) {
    return putAllByIndex(r'id', objects);
  }

  List<Id> putAllByIdSync(List<ParentProfile> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'id', objects, saveLinks: saveLinks);
  }
}

extension ParentProfileQueryWhereSort
    on QueryBuilder<ParentProfile, ParentProfile, QWhere> {
  QueryBuilder<ParentProfile, ParentProfile, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ParentProfileQueryWhere
    on QueryBuilder<ParentProfile, ParentProfile, QWhereClause> {
  QueryBuilder<ParentProfile, ParentProfile, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterWhereClause>
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

  QueryBuilder<ParentProfile, ParentProfile, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<ParentProfile, ParentProfile, QAfterWhereClause> idEqualTo(
      String id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'id',
        value: [id],
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterWhereClause> idNotEqualTo(
      String id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ParentProfileQueryFilter
    on QueryBuilder<ParentProfile, ParentProfile, QFilterCondition> {
  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      canViewJournalEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canViewJournal',
        value: value,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      displayNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      displayNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      displayNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      displayNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      displayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      displayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      displayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      displayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      displayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      displayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      emailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      emailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      emailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      emailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
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

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
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

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
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

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkedStudentIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkedStudentIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkedStudentIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkedStudentIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkedStudentIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkedStudentIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkedStudentIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkedStudentIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkedStudentIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkedStudentIds',
        value: '',
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'linkedStudentIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'linkedStudentIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'linkedStudentIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'linkedStudentIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'linkedStudentIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      linkedStudentIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'linkedStudentIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      notifyOnMoodDropEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifyOnMoodDrop',
        value: value,
      ));
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterFilterCondition>
      notifyOnTaskCompletionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifyOnTaskCompletion',
        value: value,
      ));
    });
  }
}

extension ParentProfileQueryObject
    on QueryBuilder<ParentProfile, ParentProfile, QFilterCondition> {}

extension ParentProfileQueryLinks
    on QueryBuilder<ParentProfile, ParentProfile, QFilterCondition> {}

extension ParentProfileQuerySortBy
    on QueryBuilder<ParentProfile, ParentProfile, QSortBy> {
  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      sortByCanViewJournal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canViewJournal', Sort.asc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      sortByCanViewJournalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canViewJournal', Sort.desc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy> sortByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      sortByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      sortByNotifyOnMoodDrop() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnMoodDrop', Sort.asc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      sortByNotifyOnMoodDropDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnMoodDrop', Sort.desc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      sortByNotifyOnTaskCompletion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnTaskCompletion', Sort.asc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      sortByNotifyOnTaskCompletionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnTaskCompletion', Sort.desc);
    });
  }
}

extension ParentProfileQuerySortThenBy
    on QueryBuilder<ParentProfile, ParentProfile, QSortThenBy> {
  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      thenByCanViewJournal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canViewJournal', Sort.asc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      thenByCanViewJournalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canViewJournal', Sort.desc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy> thenByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      thenByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      thenByNotifyOnMoodDrop() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnMoodDrop', Sort.asc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      thenByNotifyOnMoodDropDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnMoodDrop', Sort.desc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      thenByNotifyOnTaskCompletion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnTaskCompletion', Sort.asc);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QAfterSortBy>
      thenByNotifyOnTaskCompletionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifyOnTaskCompletion', Sort.desc);
    });
  }
}

extension ParentProfileQueryWhereDistinct
    on QueryBuilder<ParentProfile, ParentProfile, QDistinct> {
  QueryBuilder<ParentProfile, ParentProfile, QDistinct>
      distinctByCanViewJournal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canViewJournal');
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QDistinct> distinctByDisplayName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QDistinct>
      distinctByLinkedStudentIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkedStudentIds');
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QDistinct>
      distinctByNotifyOnMoodDrop() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifyOnMoodDrop');
    });
  }

  QueryBuilder<ParentProfile, ParentProfile, QDistinct>
      distinctByNotifyOnTaskCompletion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifyOnTaskCompletion');
    });
  }
}

extension ParentProfileQueryProperty
    on QueryBuilder<ParentProfile, ParentProfile, QQueryProperty> {
  QueryBuilder<ParentProfile, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ParentProfile, bool, QQueryOperations> canViewJournalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canViewJournal');
    });
  }

  QueryBuilder<ParentProfile, String, QQueryOperations> displayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayName');
    });
  }

  QueryBuilder<ParentProfile, String, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<ParentProfile, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ParentProfile, List<String>, QQueryOperations>
      linkedStudentIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkedStudentIds');
    });
  }

  QueryBuilder<ParentProfile, bool, QQueryOperations>
      notifyOnMoodDropProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifyOnMoodDrop');
    });
  }

  QueryBuilder<ParentProfile, bool, QQueryOperations>
      notifyOnTaskCompletionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifyOnTaskCompletion');
    });
  }
}
