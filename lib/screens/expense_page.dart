import 'package:expense_managerr/screens/custom_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:expense_managerr/components/category.dart';
import 'package:expense_managerr/constants.dart';
import 'package:function_tree/function_tree.dart';
import 'package:intl/intl.dart';

class ExpensePage extends StatefulWidget {
  final String typeTransaction;
  final String income;
  final String categoryName;

  ExpensePage({
    this.typeTransaction,
    this.income,
    this.categoryName,
  });
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  String number = '0.00';
  int selectedIndex = 0;
  IconData iconData;
  String nameCategory;
  String price;
  dynamic now;

  changeList(int index) {
    if (widget.typeTransaction == 'New Transaction') {
      return listViewBuilder(index);
    } else {
      return listViewBuilderIncome(index);
    }
  }

  calculateIncomeExpense() {
    setState(() {
      if (widget.typeTransaction == 'New Income Stream') {
        number = (widget.income.interpret() + number.interpret()).toString();
      } else {
        number = (widget.income.interpret() - number.interpret()).toString();
      }
    });
  }

  numClick(String text) {
    setState(() {
      if (number == '0.00') {
        number = '';
        number += text;
        price = number;
      } else {
        number += text;
        price = number;
      }
    });
  }

  backSpace() {
    setState(() {
      if (number != null && number != '0.00') {
        number = number.substring(0, number.length - 1);
      }
      if (number == '') {
        number = '0.00';
      }
    });
  }

  onSave() {
    setState(() {
      if (number != null &&
          number != '0.00' &&
          iconData != null &&
          nameCategory != null) {
        calculateIncomeExpense();
        now = DateFormat.jm().format(DateTime.now());
        Navigator.pop(context, [
          number,
          price,
          iconData,
          nameCategory,
          now,
          widget.typeTransaction
        ]);
      } else {}
    });
  }

  List<CategoryButtons> _buildCategoryButtons = [
    CategoryButtons(categoryIcon: Icons.restaurant_menu, categoryName: 'Food'),
    CategoryButtons(categoryIcon: Icons.train, categoryName: 'Transport'),
    CategoryButtons(categoryIcon: Icons.king_bed, categoryName: 'Rent'),
    CategoryButtons(
        categoryIcon: Icons.phone_iphone_outlined, categoryName: 'Credit'),
    CategoryButtons(
        categoryIcon: Icons.shopping_cart, categoryName: 'Shopping'),
    CategoryButtons(categoryIcon: Icons.music_note, categoryName: 'Leisure'),
    CategoryButtons(
        categoryIcon: Icons.medical_services, categoryName: 'Health'),
  ];

  List<CategoryButtons> _buildCategoryButtonsIncome = [
    CategoryButtons(categoryIcon: Icons.backpack, categoryName: 'Pocket'),
    CategoryButtons(categoryIcon: Icons.business, categoryName: 'Salary'),
    CategoryButtons(categoryIcon: Icons.bubble_chart, categoryName: 'Stocks'),
  ];

  Widget listViewBuilder(int index) {
    if (index < _buildCategoryButtons.length) {
      return _buildCategoryButtons[index++];
    } else {
      return SizedBox(
        width: 10,
      );
    }
  }

  Widget listViewBuilderIncome(int index) {
    if (index < _buildCategoryButtonsIncome.length) {
      return _buildCategoryButtonsIncome[index++];
    } else {
      return SizedBox(
        width: 10,
      );
    }
  }

  changePicker(int index) {
    setState(() {
      _buildCategoryButtons[index] = CategoryButtons(
        categoryIcon: _buildCategoryButtons[index].categoryIcon,
        categoryName: _buildCategoryButtons[index].categoryName,
        colorCircleAvatarOutlined: Colors.green[700],
        colorCircleAvatarInline: Colors.green[700],
        colorIcon: Colors.white,
      );
      passListItems(index);
      while (selectedIndex != index) {
        _buildCategoryButtons[selectedIndex] = CategoryButtons(
          categoryIcon: _buildCategoryButtons[selectedIndex].categoryIcon,
          categoryName: _buildCategoryButtons[selectedIndex].categoryName,
          colorCircleAvatarOutlined: Colors.green,
          colorCircleAvatarInline: Colors.white,
          colorIcon: Colors.green,
        );
        if (selectedIndex > index) {
          selectedIndex--;
        } else {
          selectedIndex++;
        }
      }
    });
  }

  passListItems(int index) {
    iconData = _buildCategoryButtons[index].categoryIcon;
    nameCategory = _buildCategoryButtons[index].categoryName;
  }

  changePickerIncome(int index) {
    setState(() {
      _buildCategoryButtonsIncome[index] = CategoryButtons(
        categoryIcon: _buildCategoryButtonsIncome[index].categoryIcon,
        categoryName: _buildCategoryButtonsIncome[index].categoryName,
        colorCircleAvatarOutlined: Colors.green[700],
        colorCircleAvatarInline: Colors.green[700],
        colorIcon: Colors.white,
      );
      passListItemsIncome(index);
      while (selectedIndex != index) {
        _buildCategoryButtonsIncome[selectedIndex] = CategoryButtons(
          categoryIcon: _buildCategoryButtonsIncome[selectedIndex].categoryIcon,
          categoryName: _buildCategoryButtonsIncome[selectedIndex].categoryName,
          colorCircleAvatarOutlined: Colors.green,
          colorCircleAvatarInline: Colors.white,
          colorIcon: Colors.green,
        );
        if (selectedIndex > index) {
          selectedIndex--;
        } else {
          selectedIndex++;
        }
      }
    });
  }

  passListItemsIncome(int index) {
    iconData = _buildCategoryButtonsIncome[index].categoryIcon;
    nameCategory = _buildCategoryButtonsIncome[index].categoryName;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            'Ksh ' + number,
            style: textIncomeExpense,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                widget.typeTransaction,
                style: textIncomeTransaction,
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          child: RawMaterialButton(
                            fillColor: Colors.black,
                            shape: CircleBorder(),
                            elevation: 0.0,
                            onPressed: () {},
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'New Budget',
                          style: textNormal,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 265,
                      height: 70,
                      child: Container(
                        width: 100,
                        height: 70,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int i) {
                            if (i.isOdd)
                              return SizedBox(
                                width: 10,
                              );

                            int index = i ~/ 2;
                            return GestureDetector(
                              onTap: () {
                                if (widget.typeTransaction ==
                                    'New Transaction') {
                                  changePicker(index);
                                } else {
                                  changePickerIncome(index);
                                }
                              },
                              child: changeList(index),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13,
              ),
              MaterialButton(
                  shape: StadiumBorder(),
                  child: Text(
                    'Budget',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Prouct Sans'),
                  ),
                  color: Colors.green[700],
                  onPressed: () {}),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RawMaterialButton(
                            child: Text(
                              '1',
                              style: textNumbers,
                            ),
                            onPressed: () {
                              numClick('1');
                            }),
                        RawMaterialButton(
                            child: Text(
                              '2',
                              style: textNumbers,
                            ),
                            onPressed: () {
                              numClick('2');
                            }),
                        RawMaterialButton(
                            child: Text(
                              '3',
                              style: textNumbers,
                            ),
                            onPressed: () {
                              numClick('3');
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RawMaterialButton(
                            child: Text(
                              '4',
                              style: textNumbers,
                            ),
                            onPressed: () {
                              numClick('4');
                            }),
                        RawMaterialButton(
                            child: Text(
                              '5',
                              style: textNumbers,
                            ),
                            onPressed: () {
                              numClick('5');
                            }),
                        RawMaterialButton(
                            child: Text(
                              '6',
                              style: textNumbers,
                            ),
                            onPressed: () {
                              numClick('6');
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RawMaterialButton(
                            child: Text(
                              '7',
                              style: textNumbers,
                            ),
                            onPressed: () {
                              numClick('7');
                            }),
                        RawMaterialButton(
                            child: Text(
                              '8',
                              style: textNumbers,
                            ),
                            onPressed: () {
                              numClick('8');
                            }),
                        RawMaterialButton(
                            child: Text(
                              '9',
                              style: textNumbers,
                            ),
                            onPressed: () {
                              numClick('9');
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RawMaterialButton(
                            child: Text(
                              '0',
                              style: textNumbers,
                            ),
                            onPressed: () {
                              numClick('0');
                            }),
                        SizedBox(
                          width: 30,
                        ),
                        RawMaterialButton(
                            child: Icon(Icons.backspace),
                            onPressed: () {
                              backSpace();
                            }),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 55,
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                child: RawMaterialButton(
                  fillColor: Colors.black,
                  shape: CircleBorder(),
                  elevation: 0.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 80,
              ),
              Expanded(
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.green[700],
                  label: Text('Save'),
                  onPressed: () {
                    onSave();
                  },
                  icon: Icon(
                    Icons.thumb_up,
                    color: Colors.white24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
