// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ContactosSchemaTable extends ContactosSchema
    with TableInfo<$ContactosSchemaTable, ContactoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContactosSchemaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fotoMeta = const VerificationMeta('foto');
  @override
  late final GeneratedColumn<String> foto = GeneratedColumn<String>(
    'foto',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _correoMeta = const VerificationMeta('correo');
  @override
  late final GeneratedColumn<String> correo = GeneratedColumn<String>(
    'correo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _telefonoMeta = const VerificationMeta(
    'telefono',
  );
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
    'telefono',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 7,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _esFavoritoMeta = const VerificationMeta(
    'esFavorito',
  );
  @override
  late final GeneratedColumn<bool> esFavorito = GeneratedColumn<bool>(
    'es_favorito',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("es_favorito" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nombre,
    descripcion,
    foto,
    correo,
    telefono,
    esFavorito,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contactos_schema';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContactoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('foto')) {
      context.handle(
        _fotoMeta,
        foto.isAcceptableOrUnknown(data['foto']!, _fotoMeta),
      );
    } else if (isInserting) {
      context.missing(_fotoMeta);
    }
    if (data.containsKey('correo')) {
      context.handle(
        _correoMeta,
        correo.isAcceptableOrUnknown(data['correo']!, _correoMeta),
      );
    } else if (isInserting) {
      context.missing(_correoMeta);
    }
    if (data.containsKey('telefono')) {
      context.handle(
        _telefonoMeta,
        telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta),
      );
    } else if (isInserting) {
      context.missing(_telefonoMeta);
    }
    if (data.containsKey('es_favorito')) {
      context.handle(
        _esFavoritoMeta,
        esFavorito.isAcceptableOrUnknown(data['es_favorito']!, _esFavoritoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContactoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContactoData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      foto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}foto'],
      )!,
      correo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}correo'],
      )!,
      telefono: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefono'],
      )!,
      esFavorito: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}es_favorito'],
      )!,
    );
  }

  @override
  $ContactosSchemaTable createAlias(String alias) {
    return $ContactosSchemaTable(attachedDatabase, alias);
  }
}

class ContactoData extends DataClass implements Insertable<ContactoData> {
  final int id;
  final String nombre;
  final String descripcion;
  final String foto;
  final String correo;
  final String telefono;
  final bool esFavorito;
  const ContactoData({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.foto,
    required this.correo,
    required this.telefono,
    required this.esFavorito,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    map['descripcion'] = Variable<String>(descripcion);
    map['foto'] = Variable<String>(foto);
    map['correo'] = Variable<String>(correo);
    map['telefono'] = Variable<String>(telefono);
    map['es_favorito'] = Variable<bool>(esFavorito);
    return map;
  }

  ContactosSchemaCompanion toCompanion(bool nullToAbsent) {
    return ContactosSchemaCompanion(
      id: Value(id),
      nombre: Value(nombre),
      descripcion: Value(descripcion),
      foto: Value(foto),
      correo: Value(correo),
      telefono: Value(telefono),
      esFavorito: Value(esFavorito),
    );
  }

  factory ContactoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContactoData(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      foto: serializer.fromJson<String>(json['foto']),
      correo: serializer.fromJson<String>(json['correo']),
      telefono: serializer.fromJson<String>(json['telefono']),
      esFavorito: serializer.fromJson<bool>(json['esFavorito']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'descripcion': serializer.toJson<String>(descripcion),
      'foto': serializer.toJson<String>(foto),
      'correo': serializer.toJson<String>(correo),
      'telefono': serializer.toJson<String>(telefono),
      'esFavorito': serializer.toJson<bool>(esFavorito),
    };
  }

  ContactoData copyWith({
    int? id,
    String? nombre,
    String? descripcion,
    String? foto,
    String? correo,
    String? telefono,
    bool? esFavorito,
  }) => ContactoData(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    descripcion: descripcion ?? this.descripcion,
    foto: foto ?? this.foto,
    correo: correo ?? this.correo,
    telefono: telefono ?? this.telefono,
    esFavorito: esFavorito ?? this.esFavorito,
  );
  ContactoData copyWithCompanion(ContactosSchemaCompanion data) {
    return ContactoData(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      foto: data.foto.present ? data.foto.value : this.foto,
      correo: data.correo.present ? data.correo.value : this.correo,
      telefono: data.telefono.present ? data.telefono.value : this.telefono,
      esFavorito: data.esFavorito.present
          ? data.esFavorito.value
          : this.esFavorito,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContactoData(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('foto: $foto, ')
          ..write('correo: $correo, ')
          ..write('telefono: $telefono, ')
          ..write('esFavorito: $esFavorito')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nombre, descripcion, foto, correo, telefono, esFavorito);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContactoData &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.descripcion == this.descripcion &&
          other.foto == this.foto &&
          other.correo == this.correo &&
          other.telefono == this.telefono &&
          other.esFavorito == this.esFavorito);
}

class ContactosSchemaCompanion extends UpdateCompanion<ContactoData> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String> descripcion;
  final Value<String> foto;
  final Value<String> correo;
  final Value<String> telefono;
  final Value<bool> esFavorito;
  const ContactosSchemaCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.foto = const Value.absent(),
    this.correo = const Value.absent(),
    this.telefono = const Value.absent(),
    this.esFavorito = const Value.absent(),
  });
  ContactosSchemaCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    required String descripcion,
    required String foto,
    required String correo,
    required String telefono,
    this.esFavorito = const Value.absent(),
  }) : nombre = Value(nombre),
       descripcion = Value(descripcion),
       foto = Value(foto),
       correo = Value(correo),
       telefono = Value(telefono);
  static Insertable<ContactoData> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? descripcion,
    Expression<String>? foto,
    Expression<String>? correo,
    Expression<String>? telefono,
    Expression<bool>? esFavorito,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (descripcion != null) 'descripcion': descripcion,
      if (foto != null) 'foto': foto,
      if (correo != null) 'correo': correo,
      if (telefono != null) 'telefono': telefono,
      if (esFavorito != null) 'es_favorito': esFavorito,
    });
  }

  ContactosSchemaCompanion copyWith({
    Value<int>? id,
    Value<String>? nombre,
    Value<String>? descripcion,
    Value<String>? foto,
    Value<String>? correo,
    Value<String>? telefono,
    Value<bool>? esFavorito,
  }) {
    return ContactosSchemaCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      foto: foto ?? this.foto,
      correo: correo ?? this.correo,
      telefono: telefono ?? this.telefono,
      esFavorito: esFavorito ?? this.esFavorito,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (foto.present) {
      map['foto'] = Variable<String>(foto.value);
    }
    if (correo.present) {
      map['correo'] = Variable<String>(correo.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    if (esFavorito.present) {
      map['es_favorito'] = Variable<bool>(esFavorito.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactosSchemaCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('foto: $foto, ')
          ..write('correo: $correo, ')
          ..write('telefono: $telefono, ')
          ..write('esFavorito: $esFavorito')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ContactosSchemaTable contactosSchema = $ContactosSchemaTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [contactosSchema];
}

typedef $$ContactosSchemaTableCreateCompanionBuilder =
    ContactosSchemaCompanion Function({
      Value<int> id,
      required String nombre,
      required String descripcion,
      required String foto,
      required String correo,
      required String telefono,
      Value<bool> esFavorito,
    });
typedef $$ContactosSchemaTableUpdateCompanionBuilder =
    ContactosSchemaCompanion Function({
      Value<int> id,
      Value<String> nombre,
      Value<String> descripcion,
      Value<String> foto,
      Value<String> correo,
      Value<String> telefono,
      Value<bool> esFavorito,
    });

class $$ContactosSchemaTableFilterComposer
    extends Composer<_$AppDatabase, $ContactosSchemaTable> {
  $$ContactosSchemaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get foto => $composableBuilder(
    column: $table.foto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get correo => $composableBuilder(
    column: $table.correo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get esFavorito => $composableBuilder(
    column: $table.esFavorito,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ContactosSchemaTableOrderingComposer
    extends Composer<_$AppDatabase, $ContactosSchemaTable> {
  $$ContactosSchemaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get foto => $composableBuilder(
    column: $table.foto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get correo => $composableBuilder(
    column: $table.correo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get esFavorito => $composableBuilder(
    column: $table.esFavorito,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ContactosSchemaTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContactosSchemaTable> {
  $$ContactosSchemaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get foto =>
      $composableBuilder(column: $table.foto, builder: (column) => column);

  GeneratedColumn<String> get correo =>
      $composableBuilder(column: $table.correo, builder: (column) => column);

  GeneratedColumn<String> get telefono =>
      $composableBuilder(column: $table.telefono, builder: (column) => column);

  GeneratedColumn<bool> get esFavorito => $composableBuilder(
    column: $table.esFavorito,
    builder: (column) => column,
  );
}

class $$ContactosSchemaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ContactosSchemaTable,
          ContactoData,
          $$ContactosSchemaTableFilterComposer,
          $$ContactosSchemaTableOrderingComposer,
          $$ContactosSchemaTableAnnotationComposer,
          $$ContactosSchemaTableCreateCompanionBuilder,
          $$ContactosSchemaTableUpdateCompanionBuilder,
          (
            ContactoData,
            BaseReferences<_$AppDatabase, $ContactosSchemaTable, ContactoData>,
          ),
          ContactoData,
          PrefetchHooks Function()
        > {
  $$ContactosSchemaTableTableManager(
    _$AppDatabase db,
    $ContactosSchemaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContactosSchemaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContactosSchemaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContactosSchemaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<String> foto = const Value.absent(),
                Value<String> correo = const Value.absent(),
                Value<String> telefono = const Value.absent(),
                Value<bool> esFavorito = const Value.absent(),
              }) => ContactosSchemaCompanion(
                id: id,
                nombre: nombre,
                descripcion: descripcion,
                foto: foto,
                correo: correo,
                telefono: telefono,
                esFavorito: esFavorito,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
                required String descripcion,
                required String foto,
                required String correo,
                required String telefono,
                Value<bool> esFavorito = const Value.absent(),
              }) => ContactosSchemaCompanion.insert(
                id: id,
                nombre: nombre,
                descripcion: descripcion,
                foto: foto,
                correo: correo,
                telefono: telefono,
                esFavorito: esFavorito,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ContactosSchemaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ContactosSchemaTable,
      ContactoData,
      $$ContactosSchemaTableFilterComposer,
      $$ContactosSchemaTableOrderingComposer,
      $$ContactosSchemaTableAnnotationComposer,
      $$ContactosSchemaTableCreateCompanionBuilder,
      $$ContactosSchemaTableUpdateCompanionBuilder,
      (
        ContactoData,
        BaseReferences<_$AppDatabase, $ContactosSchemaTable, ContactoData>,
      ),
      ContactoData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ContactosSchemaTableTableManager get contactosSchema =>
      $$ContactosSchemaTableTableManager(_db, _db.contactosSchema);
}
