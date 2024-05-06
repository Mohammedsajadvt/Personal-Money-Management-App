import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:personalmoneymanagement/models/category/category_model.dart';
import 'package:personalmoneymanagement/models/transactions/transaction_model.dart';
import 'package:personalmoneymanagement/screens/add_transaction/screen_add_transaction.dart';
import 'package:personalmoneymanagement/screens/home/home_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)){
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  if(!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)){
    Hive.registerAdapter(CategoryModelAdapter());
  } 
  if(!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)){
  Hive.registerAdapter(TransactionModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(color: Colors.purple,centerTitle: true,foregroundColor: Colors.white),
        floatingActionButtonTheme:const FloatingActionButtonThemeData(backgroundColor: Colors.purple,foregroundColor: Colors.white),
        elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purple),foregroundColor: MaterialStatePropertyAll(Colors.white)))
      ),
      home: const ScreenHome(),
      routes: {
        ScreenAddTransaction.routeName:(ctx)=> const ScreenAddTransaction(),
      },
    );
  }
}

