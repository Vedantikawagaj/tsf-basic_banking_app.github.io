import 'dart:io';
import 'package:basic_bank/Models/UserModel.dart';
import 'package:basic_bank/Models/TransactonModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
class DatabaseHelper{

  static final _databaseName= "Database2.db";
  static final _databaseVersion= 2;
  static final table1='UserTable';
  static final table2= 'TransactionTable';
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    
    _database = await _initDatabase();
    return _database;

  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE UserTable (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            curBal DOUBLE NOT NULL,
            phoneNo INTEGER NOT NULL
           )
          ''');

    await db.execute(''' 
          CREATE TABLE TransactionTable (
            id INTEGER PRIMARY KEY,
            tid INTEGER NOT NULL,
            sname TEXT NOT NULL,
            rname TEXT NOT NULL,
            tamount DOUBLE NOT NULL,
            status TEXT NOT NULL
            )
    
    ''');      
  }

  Future<void> insertUser(UserTable user) async{
     Database db = await instance.database;
     
     await db.insert('UserTable',user.toMap(),
     conflictAlgorithm: ConflictAlgorithm.replace
     );
 }

  Future<List<UserTable>> fetchUserDetails() async{
    Database db = await instance.database;
    final List<Map<String, dynamic>> userMap = await db.query('UserTable');
    return List.generate(
      userMap.length, (index){
          return UserTable(
            id: userMap[index]['id'],
            name: userMap[index]['name'],
            email: userMap[index]['email'],
            curBal: userMap[index]['curBal'],
            phoneNo: userMap[index]['phoneNo'],
          );

      },
    );

  }

  Future<void> updateCurBalance(int id, double curBal) async{
    Database db = await instance.database;
    await db.rawUpdate(
      "UPDATE UserTable SET curBal = '$curBal' WHERE id = '$id'"
    );
  }

  Future<void> insertTransaction(TransactionTable transactions) async{
    Database db = await instance.database;
    await db.insert('TransactionTable', transactions.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<TransactionTable>> fetchTransactionDetails() async{
    Database db = await instance.database;
    final List<Map<String, dynamic>> transactionMap = await db.query('TransactionTable');
    return List.generate(transactionMap.length, (index) {
      return TransactionTable(
        id: transactionMap[index]['id'],
        tid: transactionMap[index]['tid'],
        sname: transactionMap[index]['sname'],
        rname: transactionMap[index]['rname'],
        status: transactionMap[index]['status'],
        tamount: transactionMap[index]['tamount'],

      );
    }
    
    );
  }
  
  Future<void> deleteUser(int id) async{
    Database db = await instance.database;
    await db.rawDelete(
      "DELETE FROM UserTable WHERE id = '$id' "
    );
  }
}
