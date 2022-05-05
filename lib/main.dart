import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'src/app.dart';
import 'src/database/index.dart';

void main() async {
  await initializeDateFormatting();

  final phoenix = Phoenix(
    child: Application(),
  );

  final provider = Provider<Database>(
    create: (context) => Database(),
    dispose: (context, database) => database.close(),
    child: phoenix,
  );

  runApp(provider);
}
