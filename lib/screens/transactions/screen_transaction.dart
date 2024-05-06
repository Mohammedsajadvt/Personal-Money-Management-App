import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:personalmoneymanagement/db/category/category_db.dart';
import 'package:personalmoneymanagement/db/transactions/transaction_db.dart';
import 'package:personalmoneymanagement/models/category/category_model.dart';
import 'package:personalmoneymanagement/models/transactions/transaction_model.dart';
import 'package:intl/intl.dart';

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDB.instance.refreshUI();
    return ValueListenableBuilder(
        valueListenable: TransactionDB.instance.transactionListNotifier,
        builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
          return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (ctx, index) {
                final _value = newList[index];
                return Slidable(
                  key: Key(_value.id!),
                  startActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                        onPressed: (ctx) {
                          TransactionDB.instance.deleteTransaction(_value.id!);
                        },
                        icon: Icons.delete,
                        label: 'Delete',
                      )
                      ]),
                  child: Card(
                    elevation: 0,
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: _value.type == CategoryType.income
                              ? Colors.green
                              : Colors.red,
                          foregroundColor: Colors.white,
                          radius: 50,
                          child: Text(
                            parseDate(_value.date),
                            textAlign: TextAlign.center,
                          )),
                      title: Text('RS ${_value.amount.toString()}'),
                      subtitle: Text(_value.category.name),
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: newList.length);
        });
  }

  String parseDate(DateTime date) {
    final _date = DateFormat("dd \n MMM")
        .format(date); // Format to display day followed by month abbreviation
    return _date;
    //return '${date.day}\n${date.month}';
  }
}
