import 'package:flutter/material.dart';
import 'package:personalmoneymanagement/db/category/category_db.dart';
import 'package:personalmoneymanagement/models/category/category_model.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: CategoryDB().expenseCategoryListListener, builder: (BuildContext ctx, List<CategoryModel> newList, Widget?_){
      return ListView.separated(itemBuilder: (ctx,index){
        final Category = newList[index];
      return  Card(child: ListTile(title: Text(Category.name),trailing: IconButton(onPressed: (){
        CategoryDB.instance.deleteCategory(Category.id);
      }, icon:const Icon(Icons.delete)),));
    }, separatorBuilder: (ctx,index){
      return const SizedBox(
        height: 10,
      );
    }, itemCount: newList.length);
    });
  }
}