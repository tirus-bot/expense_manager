import 'package:expense_managerr/components/main_page_item_component.dart';
import 'package:flutter/material.dart';
import 'package:expense_managerr/constants.dart';
import 'package:expense_managerr/screens/expense_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:function_tree/function_tree.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String number = '0.00';
  IconData iconData;
  String nameCategory = '';
  String price = '';
  dynamic now;
  dynamic date = DateFormat.yMMMd().format(DateTime.now());
  String typeTransaction;

  List<ListItem> _buildListItems = [];

  Widget listViewBuilder(int index) {
    if (index < _buildListItems.length) {
      return _buildListItems[index++];
    } else {
      return SizedBox(
        height: 5,
      );
    }
  }

  addItem() {
    setState(() {
      _buildListItems.add(ListItem(
        icon: iconData,
        categoryName: nameCategory,
        price: price,
        now: now,
        typeTransaction: typeTransaction,
      ));
    });
    print('Name $nameCategory');
    print('Price $price');
  }

  updateItem(int index) {
    setState(() {
      _buildListItems[index] = ListItem(
        icon: iconData,
        categoryName: nameCategory,
        price: price,
        now: now,
        typeTransaction: typeTransaction,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Ksh ' + number,
          style: textIncomeExpense,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 13,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                RawMaterialButton(
                  onPressed: () {},
                  child: Text(
                    '${DateFormat.yMMMd().format(DateTime.now())}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Product Sans',
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int i) {
                    if (i.isOdd)
                      return SizedBox(
                        height: 10,
                      );

                    int index = i ~/ 2;
                    return GestureDetector(
                      onTap: () {},
                      child: Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        secondaryActions: [
                          IconSlideAction(
                            caption: 'Edit',
                            color: Colors.blue[700],
                            icon: Icons.edit,
                            onTap: () {
                              setState(() {
                                showMaterialModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                    height: 230,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.green[700],
                                                radius: 23,
                                                child: Icon(
                                                  _buildListItems[index].icon,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _buildListItems[index]
                                                        .categoryName,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily:
                                                          'Product Sans',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    '$date',
                                                    style: TextStyle(
                                                      fontSize: 14.5,
                                                      color: Colors.grey,
                                                      fontFamily:
                                                          'Product Sans',
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            child: Center(
                                              child: Text(
                                                'Ksh ' +
                                                    _buildListItems[index]
                                                        .price,
                                                style: TextStyle(
                                                  fontFamily: 'Product Sans',
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MaterialButton(
                                                color: Colors.red,
                                                elevation: 0.0,
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    if (_buildListItems[index]
                                                            .typeTransaction ==
                                                        'New Transaction') {
                                                      number = (number
                                                                  .interpret() +
                                                              _buildListItems[
                                                                      index]
                                                                  .price
                                                                  .interpret())
                                                          .toString();
                                                    } else {
                                                      number = (number
                                                                  .interpret() -
                                                              _buildListItems[
                                                                      index]
                                                                  .price
                                                                  .interpret())
                                                          .toString();
                                                    }
                                                    _buildListItems
                                                        .removeAt(index);
                                                  });
                                                },
                                                child: Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                    fontFamily: 'Product Sans',
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 35,
                                              ),
                                              MaterialButton(
                                                elevation: 0.0,
                                                color: Colors.blue[700],
                                                child: Text(
                                                  'Edit',
                                                  style: TextStyle(
                                                    fontFamily: 'Product Sans',
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  final result =
                                                      await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ExpensePage(
                                                              typeTransaction:
                                                                  _buildListItems[
                                                                          index]
                                                                      .typeTransaction,
                                                              income: number,
                                                            )),
                                                  );
                                                  setState(() {
                                                    number = result[0];
                                                    price = result[1];
                                                    iconData = result[2];
                                                    nameCategory = result[3];
                                                    now = result[4];
                                                    typeTransaction = result[5];
                                                    updateItem(index);
                                                  });
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                            },
                          ),
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () {
                              setState(() {
                                if (_buildListItems[index].typeTransaction ==
                                    'New Transaction') {
                                  number = (number.interpret() +
                                          _buildListItems[index]
                                              .price
                                              .interpret())
                                      .toString();
                                } else {
                                  number = (number.interpret() -
                                          _buildListItems[index]
                                              .price
                                              .interpret())
                                      .toString();
                                }
                                _buildListItems.removeAt(index);
                              });
                            },
                          ),
                        ],
                        child: listViewBuilder(index),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 40,
            height: 40,
            child: RawMaterialButton(
              fillColor: Colors.black,
              shape: CircleBorder(),
              elevation: 0.0,
              onPressed: () {
                onClickedIncome(context);
              },
              child: Icon(
                Icons.edit_outlined,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.green[800],
            foregroundColor: Colors.white,
            child: Icon(Icons.add),
            onPressed: () {
              onClickedExpense(context);
            },
          ),
        ],
      ),
    );
  }

  onClickedExpense(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ExpensePage(
                typeTransaction: 'New Transaction',
                income: number,
              )),
    );
    setState(() {
      if (result != null) {
        number = result[0];
        price = result[1];
        iconData = result[2];
        nameCategory = result[3];
        now = result[4];
        typeTransaction = result[5];
        addItem();
      }
    });
  }

  onClickedIncome(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ExpensePage(
              typeTransaction: 'New Income Stream', income: number)),
    );
    setState(() {
      if (result != null) {
        number = result[0];
        price = result[1];
        iconData = result[2];
        nameCategory = result[3];
        now = result[4];
        typeTransaction = result[5];
        addItem();
      }
    });
  }
}
