// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_database.dart';

// ignore_for_file: type=lint
class $WorkoutTableTable extends WorkoutTable
    with TableInfo<$WorkoutTableTable, WorkoutTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_table';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $WorkoutTableTable createAlias(String alias) {
    return $WorkoutTableTable(attachedDatabase, alias);
  }
}

class WorkoutTableData extends DataClass
    implements Insertable<WorkoutTableData> {
  final int id;
  final String name;
  const WorkoutTableData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  WorkoutTableCompanion toCompanion(bool nullToAbsent) {
    return WorkoutTableCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory WorkoutTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  WorkoutTableData copyWith({int? id, String? name}) => WorkoutTableData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  WorkoutTableData copyWithCompanion(WorkoutTableCompanion data) {
    return WorkoutTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class WorkoutTableCompanion extends UpdateCompanion<WorkoutTableData> {
  final Value<int> id;
  final Value<String> name;
  const WorkoutTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  WorkoutTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<WorkoutTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  WorkoutTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return WorkoutTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $WorkoutSetTableTable extends WorkoutSetTable
    with TableInfo<$WorkoutSetTableTable, WorkoutSetTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutSetTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _exerciseMeta =
      const VerificationMeta('exercise');
  @override
  late final GeneratedColumnWithTypeConverter<Exercise, int> exercise =
      GeneratedColumn<int>('exercise', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Exercise>($WorkoutSetTableTable.$converterexercise);
  static const VerificationMeta _weightKgMeta =
      const VerificationMeta('weightKg');
  @override
  late final GeneratedColumn<int> weightKg = GeneratedColumn<int>(
      'weight_kg', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _repetitionsMeta =
      const VerificationMeta('repetitions');
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
      'repetitions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<int> workoutId = GeneratedColumn<int>(
      'workout_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES workout_table (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, exercise, weightKg, repetitions, workoutId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout_set_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<WorkoutSetTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_exerciseMeta, const VerificationResult.success());
    if (data.containsKey('weight_kg')) {
      context.handle(_weightKgMeta,
          weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta));
    } else if (isInserting) {
      context.missing(_weightKgMeta);
    }
    if (data.containsKey('repetitions')) {
      context.handle(
          _repetitionsMeta,
          repetitions.isAcceptableOrUnknown(
              data['repetitions']!, _repetitionsMeta));
    } else if (isInserting) {
      context.missing(_repetitionsMeta);
    }
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    } else if (isInserting) {
      context.missing(_workoutIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutSetTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutSetTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      exercise: $WorkoutSetTableTable.$converterexercise.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}exercise'])!),
      weightKg: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}weight_kg'])!,
      repetitions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}repetitions'])!,
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}workout_id'])!,
    );
  }

  @override
  $WorkoutSetTableTable createAlias(String alias) {
    return $WorkoutSetTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Exercise, int, int> $converterexercise =
      const EnumIndexConverter(Exercise.values);
}

class WorkoutSetTableData extends DataClass
    implements Insertable<WorkoutSetTableData> {
  final int id;
  final Exercise exercise;
  final int weightKg;
  final int repetitions;
  final int workoutId;
  const WorkoutSetTableData(
      {required this.id,
      required this.exercise,
      required this.weightKg,
      required this.repetitions,
      required this.workoutId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['exercise'] = Variable<int>(
          $WorkoutSetTableTable.$converterexercise.toSql(exercise));
    }
    map['weight_kg'] = Variable<int>(weightKg);
    map['repetitions'] = Variable<int>(repetitions);
    map['workout_id'] = Variable<int>(workoutId);
    return map;
  }

  WorkoutSetTableCompanion toCompanion(bool nullToAbsent) {
    return WorkoutSetTableCompanion(
      id: Value(id),
      exercise: Value(exercise),
      weightKg: Value(weightKg),
      repetitions: Value(repetitions),
      workoutId: Value(workoutId),
    );
  }

  factory WorkoutSetTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutSetTableData(
      id: serializer.fromJson<int>(json['id']),
      exercise: $WorkoutSetTableTable.$converterexercise
          .fromJson(serializer.fromJson<int>(json['exercise'])),
      weightKg: serializer.fromJson<int>(json['weightKg']),
      repetitions: serializer.fromJson<int>(json['repetitions']),
      workoutId: serializer.fromJson<int>(json['workoutId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'exercise': serializer.toJson<int>(
          $WorkoutSetTableTable.$converterexercise.toJson(exercise)),
      'weightKg': serializer.toJson<int>(weightKg),
      'repetitions': serializer.toJson<int>(repetitions),
      'workoutId': serializer.toJson<int>(workoutId),
    };
  }

  WorkoutSetTableData copyWith(
          {int? id,
          Exercise? exercise,
          int? weightKg,
          int? repetitions,
          int? workoutId}) =>
      WorkoutSetTableData(
        id: id ?? this.id,
        exercise: exercise ?? this.exercise,
        weightKg: weightKg ?? this.weightKg,
        repetitions: repetitions ?? this.repetitions,
        workoutId: workoutId ?? this.workoutId,
      );
  WorkoutSetTableData copyWithCompanion(WorkoutSetTableCompanion data) {
    return WorkoutSetTableData(
      id: data.id.present ? data.id.value : this.id,
      exercise: data.exercise.present ? data.exercise.value : this.exercise,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      repetitions:
          data.repetitions.present ? data.repetitions.value : this.repetitions,
      workoutId: data.workoutId.present ? data.workoutId.value : this.workoutId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSetTableData(')
          ..write('id: $id, ')
          ..write('exercise: $exercise, ')
          ..write('weightKg: $weightKg, ')
          ..write('repetitions: $repetitions, ')
          ..write('workoutId: $workoutId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, exercise, weightKg, repetitions, workoutId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutSetTableData &&
          other.id == this.id &&
          other.exercise == this.exercise &&
          other.weightKg == this.weightKg &&
          other.repetitions == this.repetitions &&
          other.workoutId == this.workoutId);
}

class WorkoutSetTableCompanion extends UpdateCompanion<WorkoutSetTableData> {
  final Value<int> id;
  final Value<Exercise> exercise;
  final Value<int> weightKg;
  final Value<int> repetitions;
  final Value<int> workoutId;
  const WorkoutSetTableCompanion({
    this.id = const Value.absent(),
    this.exercise = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.workoutId = const Value.absent(),
  });
  WorkoutSetTableCompanion.insert({
    this.id = const Value.absent(),
    required Exercise exercise,
    required int weightKg,
    required int repetitions,
    required int workoutId,
  })  : exercise = Value(exercise),
        weightKg = Value(weightKg),
        repetitions = Value(repetitions),
        workoutId = Value(workoutId);
  static Insertable<WorkoutSetTableData> custom({
    Expression<int>? id,
    Expression<int>? exercise,
    Expression<int>? weightKg,
    Expression<int>? repetitions,
    Expression<int>? workoutId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exercise != null) 'exercise': exercise,
      if (weightKg != null) 'weight_kg': weightKg,
      if (repetitions != null) 'repetitions': repetitions,
      if (workoutId != null) 'workout_id': workoutId,
    });
  }

  WorkoutSetTableCompanion copyWith(
      {Value<int>? id,
      Value<Exercise>? exercise,
      Value<int>? weightKg,
      Value<int>? repetitions,
      Value<int>? workoutId}) {
    return WorkoutSetTableCompanion(
      id: id ?? this.id,
      exercise: exercise ?? this.exercise,
      weightKg: weightKg ?? this.weightKg,
      repetitions: repetitions ?? this.repetitions,
      workoutId: workoutId ?? this.workoutId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (exercise.present) {
      map['exercise'] = Variable<int>(
          $WorkoutSetTableTable.$converterexercise.toSql(exercise.value));
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<int>(weightKg.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<int>(workoutId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutSetTableCompanion(')
          ..write('id: $id, ')
          ..write('exercise: $exercise, ')
          ..write('weightKg: $weightKg, ')
          ..write('repetitions: $repetitions, ')
          ..write('workoutId: $workoutId')
          ..write(')'))
        .toString();
  }
}

abstract class _$WorkoutDatabase extends GeneratedDatabase {
  _$WorkoutDatabase(QueryExecutor e) : super(e);
  $WorkoutDatabaseManager get managers => $WorkoutDatabaseManager(this);
  late final $WorkoutTableTable workoutTable = $WorkoutTableTable(this);
  late final $WorkoutSetTableTable workoutSetTable =
      $WorkoutSetTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [workoutTable, workoutSetTable];
}

typedef $$WorkoutTableTableCreateCompanionBuilder = WorkoutTableCompanion
    Function({
  Value<int> id,
  required String name,
});
typedef $$WorkoutTableTableUpdateCompanionBuilder = WorkoutTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
});

final class $$WorkoutTableTableReferences extends BaseReferences<
    _$WorkoutDatabase, $WorkoutTableTable, WorkoutTableData> {
  $$WorkoutTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WorkoutSetTableTable, List<WorkoutSetTableData>>
      _workoutSetTableRefsTable(_$WorkoutDatabase db) =>
          MultiTypedResultKey.fromTable(db.workoutSetTable,
              aliasName: $_aliasNameGenerator(
                  db.workoutTable.id, db.workoutSetTable.workoutId));

  $$WorkoutSetTableTableProcessedTableManager get workoutSetTableRefs {
    final manager =
        $$WorkoutSetTableTableTableManager($_db, $_db.workoutSetTable)
            .filter((f) => f.workoutId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_workoutSetTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WorkoutTableTableFilterComposer
    extends FilterComposer<_$WorkoutDatabase, $WorkoutTableTable> {
  $$WorkoutTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter workoutSetTableRefs(
      ComposableFilter Function($$WorkoutSetTableTableFilterComposer f) f) {
    final $$WorkoutSetTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.workoutSetTable,
            getReferencedColumn: (t) => t.workoutId,
            builder: (joinBuilder, parentComposers) =>
                $$WorkoutSetTableTableFilterComposer(ComposerState($state.db,
                    $state.db.workoutSetTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$WorkoutTableTableOrderingComposer
    extends OrderingComposer<_$WorkoutDatabase, $WorkoutTableTable> {
  $$WorkoutTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$WorkoutTableTableTableManager extends RootTableManager<
    _$WorkoutDatabase,
    $WorkoutTableTable,
    WorkoutTableData,
    $$WorkoutTableTableFilterComposer,
    $$WorkoutTableTableOrderingComposer,
    $$WorkoutTableTableCreateCompanionBuilder,
    $$WorkoutTableTableUpdateCompanionBuilder,
    (WorkoutTableData, $$WorkoutTableTableReferences),
    WorkoutTableData,
    PrefetchHooks Function({bool workoutSetTableRefs})> {
  $$WorkoutTableTableTableManager(
      _$WorkoutDatabase db, $WorkoutTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WorkoutTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WorkoutTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              WorkoutTableCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              WorkoutTableCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkoutTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workoutSetTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (workoutSetTableRefs) db.workoutSetTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (workoutSetTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$WorkoutTableTableReferences
                            ._workoutSetTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkoutTableTableReferences(db, table, p0)
                                .workoutSetTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workoutId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WorkoutTableTableProcessedTableManager = ProcessedTableManager<
    _$WorkoutDatabase,
    $WorkoutTableTable,
    WorkoutTableData,
    $$WorkoutTableTableFilterComposer,
    $$WorkoutTableTableOrderingComposer,
    $$WorkoutTableTableCreateCompanionBuilder,
    $$WorkoutTableTableUpdateCompanionBuilder,
    (WorkoutTableData, $$WorkoutTableTableReferences),
    WorkoutTableData,
    PrefetchHooks Function({bool workoutSetTableRefs})>;
typedef $$WorkoutSetTableTableCreateCompanionBuilder = WorkoutSetTableCompanion
    Function({
  Value<int> id,
  required Exercise exercise,
  required int weightKg,
  required int repetitions,
  required int workoutId,
});
typedef $$WorkoutSetTableTableUpdateCompanionBuilder = WorkoutSetTableCompanion
    Function({
  Value<int> id,
  Value<Exercise> exercise,
  Value<int> weightKg,
  Value<int> repetitions,
  Value<int> workoutId,
});

final class $$WorkoutSetTableTableReferences extends BaseReferences<
    _$WorkoutDatabase, $WorkoutSetTableTable, WorkoutSetTableData> {
  $$WorkoutSetTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkoutTableTable _workoutIdTable(_$WorkoutDatabase db) =>
      db.workoutTable.createAlias($_aliasNameGenerator(
          db.workoutSetTable.workoutId, db.workoutTable.id));

  $$WorkoutTableTableProcessedTableManager? get workoutId {
    if ($_item.workoutId == null) return null;
    final manager = $$WorkoutTableTableTableManager($_db, $_db.workoutTable)
        .filter((f) => f.id($_item.workoutId!));
    final item = $_typedResult.readTableOrNull(_workoutIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$WorkoutSetTableTableFilterComposer
    extends FilterComposer<_$WorkoutDatabase, $WorkoutSetTableTable> {
  $$WorkoutSetTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Exercise, Exercise, int> get exercise =>
      $state.composableBuilder(
          column: $state.table.exercise,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<int> get weightKg => $state.composableBuilder(
      column: $state.table.weightKg,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get repetitions => $state.composableBuilder(
      column: $state.table.repetitions,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$WorkoutTableTableFilterComposer get workoutId {
    final $$WorkoutTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $state.db.workoutTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$WorkoutTableTableFilterComposer(ComposerState($state.db,
                $state.db.workoutTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$WorkoutSetTableTableOrderingComposer
    extends OrderingComposer<_$WorkoutDatabase, $WorkoutSetTableTable> {
  $$WorkoutSetTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get exercise => $state.composableBuilder(
      column: $state.table.exercise,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get weightKg => $state.composableBuilder(
      column: $state.table.weightKg,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get repetitions => $state.composableBuilder(
      column: $state.table.repetitions,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$WorkoutTableTableOrderingComposer get workoutId {
    final $$WorkoutTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workoutId,
        referencedTable: $state.db.workoutTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$WorkoutTableTableOrderingComposer(ComposerState($state.db,
                $state.db.workoutTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$WorkoutSetTableTableTableManager extends RootTableManager<
    _$WorkoutDatabase,
    $WorkoutSetTableTable,
    WorkoutSetTableData,
    $$WorkoutSetTableTableFilterComposer,
    $$WorkoutSetTableTableOrderingComposer,
    $$WorkoutSetTableTableCreateCompanionBuilder,
    $$WorkoutSetTableTableUpdateCompanionBuilder,
    (WorkoutSetTableData, $$WorkoutSetTableTableReferences),
    WorkoutSetTableData,
    PrefetchHooks Function({bool workoutId})> {
  $$WorkoutSetTableTableTableManager(
      _$WorkoutDatabase db, $WorkoutSetTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WorkoutSetTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WorkoutSetTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<Exercise> exercise = const Value.absent(),
            Value<int> weightKg = const Value.absent(),
            Value<int> repetitions = const Value.absent(),
            Value<int> workoutId = const Value.absent(),
          }) =>
              WorkoutSetTableCompanion(
            id: id,
            exercise: exercise,
            weightKg: weightKg,
            repetitions: repetitions,
            workoutId: workoutId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required Exercise exercise,
            required int weightKg,
            required int repetitions,
            required int workoutId,
          }) =>
              WorkoutSetTableCompanion.insert(
            id: id,
            exercise: exercise,
            weightKg: weightKg,
            repetitions: repetitions,
            workoutId: workoutId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkoutSetTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workoutId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workoutId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workoutId,
                    referencedTable:
                        $$WorkoutSetTableTableReferences._workoutIdTable(db),
                    referencedColumn:
                        $$WorkoutSetTableTableReferences._workoutIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$WorkoutSetTableTableProcessedTableManager = ProcessedTableManager<
    _$WorkoutDatabase,
    $WorkoutSetTableTable,
    WorkoutSetTableData,
    $$WorkoutSetTableTableFilterComposer,
    $$WorkoutSetTableTableOrderingComposer,
    $$WorkoutSetTableTableCreateCompanionBuilder,
    $$WorkoutSetTableTableUpdateCompanionBuilder,
    (WorkoutSetTableData, $$WorkoutSetTableTableReferences),
    WorkoutSetTableData,
    PrefetchHooks Function({bool workoutId})>;

class $WorkoutDatabaseManager {
  final _$WorkoutDatabase _db;
  $WorkoutDatabaseManager(this._db);
  $$WorkoutTableTableTableManager get workoutTable =>
      $$WorkoutTableTableTableManager(_db, _db.workoutTable);
  $$WorkoutSetTableTableTableManager get workoutSetTable =>
      $$WorkoutSetTableTableTableManager(_db, _db.workoutSetTable);
}
