
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db {

  static Database? _database;

  Future<Database> get database async {
    if( _database != null ) return _database!;
    _database = await _initDb('storedb.db');
    return _database!;
  }

  Future<Database> _initDb( String fileName ) async{
    final dbPath = await getDatabasesPath();
    final path = join( dbPath, fileName );

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate( Database db, int version ) async {
    await db.execute(
    '''
      CREATE TABLE products (
        id INTEGER primary key,
        title TEXT,
        price REAL,
        description TEXT,
        slug TEXT,
        images TEXT,
        quantity INTEGER
      );
    '''
    );
  }

}