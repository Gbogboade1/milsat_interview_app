import 'package:moor_flutter/moor_flutter.dart';

part 'form_database.g.dart';

class Forms extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text().withLength(min: 1, max: 25)();
  TextColumn get lastName => text().withLength(min: 1, max: 25)();
  BoolColumn get gender => boolean().withDefault(Constant(true))();

  ///TRUE -MALE, FALSE FEMALE
  IntColumn get phoneNumber => integer()();
  TextColumn get address => text().withLength(min: 1, max: 250)();
}

@UseMoor(tables: [Forms])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        ));

  @override
  int get schemaVersion => 1;

  Future<List<Form>>? getAllForms() => select(forms).get();
  Stream<List<Form>>? watchAllForms() => select(forms).watch();

  Future insertForm({
    required String firstName,
    required String lastName,
    required bool gender,
    required int phoneNumber,
    required String address,
  }) =>
      into(forms).insert(FormsCompanion(
        firstName: Value(firstName),
        gender: Value(gender),
        address: Value(address),
        lastName: Value(lastName),
        phoneNumber: Value(phoneNumber)
      ));

  Future updateForm(Form form) => update(forms).replace(form);
  Future deleteForm(Form form) => delete(forms).delete(form);
}
