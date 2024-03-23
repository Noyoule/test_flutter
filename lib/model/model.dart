import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'model.g.dart';

const tableUser = SqfEntityTable(
    tableName: 'user',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: false,
    modelName: null,
    fields: [
      SqfEntityField("email", DbType.text),
      SqfEntityField('title', DbType.text),
      SqfEntityField("first", DbType.text),
      SqfEntityField("last", DbType.text),
      SqfEntityField("street_number", DbType.text),
      SqfEntityField("street_name", DbType.text),
      SqfEntityField("location_city", DbType.text),
      SqfEntityField("location_state", DbType.text),
      SqfEntityField("location_contry", DbType.text),
      SqfEntityField("location_postcode", DbType.text),
      SqfEntityField("coordinate_lat", DbType.text),
      SqfEntityField("coordinate_long", DbType.text),
      SqfEntityField("date_of_birth", DbType.numeric),
      SqfEntityField("date_of_registration", DbType.numeric),
      SqfEntityField("phone", DbType.text),
      SqfEntityField("cell", DbType.text),
      SqfEntityField("id_value", DbType.text),
      SqfEntityField("picture_path", DbType.text),
      SqfEntityField("nat", DbType.text)
    ]);

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
    modelName: 'MyDbModel', // optional
    databaseName: 'sampleORM.db',
    password: null,
    databaseTables: [tableUser],
    bundledDatabasePath: null);
