import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListaContenidoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          _ItemShoes(),
          _ItemShoes(),
          _ItemShoes(),
          _ItemShoes(),
          _ItemShoes(),
          _ItemShoes(),
          _ItemShoes(),
          _ItemShoes(),
        ],
      ),
    );
  }
}

/*

*/

class _ItemShoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.all(10.0),
      width: 150,
      // height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(2, 2), blurRadius: 10)
        ],
      ),
      child: Stack(
        children: [
          Column(children: [
            Spacer(),
            _ImagenShoes(
              aspectRatio: 2 / 1.75,
            ),
            Spacer(),
            _NombreShoes(),
            _PrecioCartShoes(),
          ]),
          _NumeroShoes(),
        ],
      ),
    );
  }
}

class _NumeroShoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Text(
        '01',
        style: TextStyle(
          fontSize: 25,
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _PrecioCartShoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          Text(
              '\$168',
              style: TextStyle(
                fontSize: 14,
                color: Colors.redAccent[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          Spacer(),
          Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, offset: Offset(5, 5), blurRadius: 5)
              ],
            ),
            child: FaIcon(
              FontAwesomeIcons.cartPlus,
              color: Colors.white,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _NombreShoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        'Nike Air Huarache For Womens',
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _ImagenShoes extends StatelessWidget {
  final double aspectRatio;

  const _ImagenShoes({@required this.aspectRatio});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: AssetImage('assets/shoe1.png'), fit: BoxFit.cover),
          ),
        ));
  }
}
