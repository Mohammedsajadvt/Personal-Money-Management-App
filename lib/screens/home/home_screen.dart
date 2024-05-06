import 'package:flutter/material.dart';
import 'package:personalmoneymanagement/screens/add_transaction/screen_add_transaction.dart';
import 'package:personalmoneymanagement/screens/category/category_add_popup.dart';
import 'package:personalmoneymanagement/screens/category/screen_category.dart';
import 'package:personalmoneymanagement/screens/home/widgets/bottom_navigation.dart';
import 'package:personalmoneymanagement/screens/transactions/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [ScreenTransactions(), ScreenCategory()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("MONEY MANAGER"),
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (BuildContext context, int updatedIndex, Widget? _) {
              return _pages[updatedIndex];
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('Add Transaction');
            Navigator.of(context).pushNamed(ScreenAddTransaction.routeName);
          } else {
             print('Add Category');
             showCategoryAddPopup(context);
            // final _sample = CategoryModel(name: 'Travel', type: CategoryType.expense, id: DateTime.now().millisecondsSinceEpoch.toString());
            // CategoryDB().insertCategory(_sample);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
