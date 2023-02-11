import 'dart:convert';

import 'package:basic_project/screens/shopping_cart/models/cart_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDB {
  static const String dbName = "BasmatiCartDB";
  static const int version = 1;
  static const table1Name = "CartTable";
  static const String cId = "id";
  static const String cdbId = "id";
  static const String cQty = "qty";
  static const String cName = "name";
  static const String cPrice = "price";
  static const String cWarranty = "warranty";

  CartDB.privateConstructor();
  static final CartDB instance = CartDB.privateConstructor();
  static Database? database;
  Future<Database> get getDB async {
    if (database != null) return database!;
    database = await initDB();
    return database!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), CartDB.dbName);
    return await openDatabase(path,
        version: CartDB.version, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table1Name(
    $cdbId String PRIMARY KEY,
    $cQty INTEGER,
    $cPrice INTEGER,
    $cWarranty STRING,
    $cName STRING
    )
    ''');
  }

  Future<int> insert(Products cartItemData) async {
    Database db = await instance.getDB;
    return await db.insert(table1Name, cartItemData.toJsonDB(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Products>> getAllItems() async {
    Database db = await instance.getDB;
    List<Map<String, dynamic>> raw = await db.query(
      table1Name,
    );
    List<Products> data = [];
    for (var map in raw) {
      debugPrint(map.toString());
      data.add(Products(
          id: map["id"],
          warranty: map['warranty'] == null
              ? null
              : WarrantyShopping.fromJson(jsonDecode(map['warranty'])),
          name: map['name'],
          price: map['price'],
          qty: map['qty']));
    }
    return data;
  }

  Future<int> delete(String id) async {
    Database db = await instance.getDB;
    return await db.delete(table1Name, where: "$cId = ?", whereArgs: [id]);
  }

  Future clear() async {
    Database db = await instance.getDB;
    await db.rawQuery("DELETE FROM $table1Name");
  }

  Future<int> getCount() async {
    Database db = await instance.getDB;
    return Sqflite.firstIntValue(
            await db.rawQuery("SELECT COUNT(*) FROM $table1Name")) ??
        0;
  }

  Future<void> updateQty(String id, int qty) async {
    Database db = await instance.getDB;
    await db
        .rawUpdate("UPDATE $table1Name SET qty = ? WHERE id = ?", [qty, id]);
  }
}
