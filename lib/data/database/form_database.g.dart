// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Form extends DataClass implements Insertable<Form> {
  final int id;
  final String firstName;
  final String lastName;
  final bool gender;

  ///TRUE -MALE, FALSE FEMALE
  final int phoneNumber;
  final String address;
  Form(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.phoneNumber,
      required this.address});
  factory Form.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Form(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name'])!,
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name'])!,
      gender: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender'])!,
      phoneNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_number'])!,
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['gender'] = Variable<bool>(gender);
    map['phone_number'] = Variable<int>(phoneNumber);
    map['address'] = Variable<String>(address);
    return map;
  }

  FormsCompanion toCompanion(bool nullToAbsent) {
    return FormsCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      gender: Value(gender),
      phoneNumber: Value(phoneNumber),
      address: Value(address),
    );
  }

  factory Form.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Form(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      gender: serializer.fromJson<bool>(json['gender']),
      phoneNumber: serializer.fromJson<int>(json['phoneNumber']),
      address: serializer.fromJson<String>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'gender': serializer.toJson<bool>(gender),
      'phoneNumber': serializer.toJson<int>(phoneNumber),
      'address': serializer.toJson<String>(address),
    };
  }

  Form copyWith(
          {int? id,
          String? firstName,
          String? lastName,
          bool? gender,
          int? phoneNumber,
          String? address}) =>
      Form(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
      );
  @override
  String toString() {
    return (StringBuffer('Form(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('gender: $gender, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          firstName.hashCode,
          $mrjc(
              lastName.hashCode,
              $mrjc(gender.hashCode,
                  $mrjc(phoneNumber.hashCode, address.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Form &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.gender == this.gender &&
          other.phoneNumber == this.phoneNumber &&
          other.address == this.address);
}

class FormsCompanion extends UpdateCompanion<Form> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<bool> gender;
  final Value<int> phoneNumber;
  final Value<String> address;
  const FormsCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.gender = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.address = const Value.absent(),
  });
  FormsCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
    this.gender = const Value.absent(),
    required int phoneNumber,
    required String address,
  })  : firstName = Value(firstName),
        lastName = Value(lastName),
        phoneNumber = Value(phoneNumber),
        address = Value(address);
  static Insertable<Form> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<bool>? gender,
    Expression<int>? phoneNumber,
    Expression<String>? address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (gender != null) 'gender': gender,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (address != null) 'address': address,
    });
  }

  FormsCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<bool>? gender,
      Value<int>? phoneNumber,
      Value<String>? address}) {
    return FormsCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (gender.present) {
      map['gender'] = Variable<bool>(gender.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<int>(phoneNumber.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FormsCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('gender: $gender, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

class $FormsTable extends Forms with TableInfo<$FormsTable, Form> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FormsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedTextColumn firstName = _constructFirstName();
  GeneratedTextColumn _constructFirstName() {
    return GeneratedTextColumn('first_name', $tableName, false,
        minTextLength: 1, maxTextLength: 25);
  }

  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedTextColumn lastName = _constructLastName();
  GeneratedTextColumn _constructLastName() {
    return GeneratedTextColumn('last_name', $tableName, false,
        minTextLength: 1, maxTextLength: 25);
  }

  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedBoolColumn gender = _constructGender();
  GeneratedBoolColumn _constructGender() {
    return GeneratedBoolColumn('gender', $tableName, false,
        defaultValue: Constant(true));
  }

  final VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedIntColumn phoneNumber = _constructPhoneNumber();
  GeneratedIntColumn _constructPhoneNumber() {
    return GeneratedIntColumn(
      'phone_number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedTextColumn address = _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn('address', $tableName, false,
        minTextLength: 1, maxTextLength: 250);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, firstName, lastName, gender, phoneNumber, address];
  @override
  $FormsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'forms';
  @override
  final String actualTableName = 'forms';
  @override
  VerificationContext validateIntegrity(Insertable<Form> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Form map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Form.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FormsTable createAlias(String alias) {
    return $FormsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FormsTable forms = $FormsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [forms];
}
