import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoes/src/pages/ListaMostrarContenido_page.dart';
import 'package:shoes/src/widgets/bar_category.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:after_layout/after_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
            backgroundColor: Colors.grey, body: SafeArea(child: _HomePage())));
  }
}

class _HomePage extends StatefulWidget {
  @override
  __HomePageState createState() => __HomePageState();
}

class __HomePageState extends State<_HomePage> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
              minheight: 130, maxheight: 130, child: _AppBarShoes()),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ListaContenidoPage(),
          _SeccionPopularidadText(),
          ItemShoesPopular(),
          ItemShoesPopular(),
          ItemShoesPopular(),
          ItemShoesPopular(),
          ItemShoesPopular(),
          ItemShoesPopular(),
          ItemShoesPopular(),
          ItemShoesPopular(),
          ItemShoesPopular(),
          ItemShoesPopular(),
        ]))
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    if (!isTablet) {
      //smartphone

      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp], //bloquear Orientacion
      );
    }
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {@required this.minheight,
      @required this.maxheight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class ItemShoesPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 10)
        ],
      ),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage('assets/shoe1.png'), fit: BoxFit.cover),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                'Nike Air Huarache For Womens',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10,),
              Text(
                'OFF To \$20',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              Container(
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
                    Container(
                      width: 100,
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(5, 5),
                              blurRadius: 5)
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
              )
            ],
          )
        ],
      ),
    );
  }
}

class _SeccionPopularidadText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      child: Row(
        children: [
          Text(
            'Popular',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'Shoes',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[350],
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
            'See All',
            style: TextStyle(
              fontSize: 18,
              color: Colors.redAccent[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarShoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5.0),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5, 5),
                          blurRadius: 5)
                    ],
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.bars,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    child: Image(
                      image: AssetImage('assets/nike.png'),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5, 5),
                          blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.search,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          MenuBarPage(),
        ],
      ),
    );
  }
}
