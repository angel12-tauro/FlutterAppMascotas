import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuBarPage extends StatelessWidget {
  final List<String> listaNames = [
    'Lifestyle',
    'Jordan',
    'Running',
    'Basketboall',
    'football',
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      builder: (context, child) {
        return Container(
         // color: Colors.blue,
          height: 50,
            child: ListView(
              physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: List.generate(
              listaNames.length,
              (index) => BarCategoryItem(
                    nameCategory: listaNames[index],
                    index: index,
                  )),
        ));
      },
    );
  }
}

class BarCategoryItem extends StatelessWidget {
  final String nameCategory;
  final double fontSize1;
  final double fontSize2;
  final Color colorText;

  final int index;

  const BarCategoryItem({
    this.nameCategory = 'name',
    this.fontSize1 = 20,
    this.colorText = Colors.black,
    this.index,
    this.fontSize2 = 16,
  });

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    double fontSize;
    bool bold;

    if (itemSeleccionado == index) {
      fontSize = fontSize1;
      bold = true;
    } else {
      fontSize = fontSize2;
      bold = false;
    }

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        child: Center(
          child: Text(
            nameCategory,
            style: TextStyle(
              fontSize: fontSize,
              color: colorText,
              fontWeight: (bold) ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuModel extends ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado(int item) {
    this._itemSeleccionado = item;
    notifyListeners();
  }
}
