import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HeroPage extends StatefulWidget {
  final String item;
  HeroPage({Key key, @required this.item}) : super(key: key);

  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  // final String item;

  // In the constructor, require a Todo.
  // _HeroPageState({Key key, @required this.item}) : super();

  bool _renderPanel = true;
  EdgeInsets _paneMargin;
  Size _screenSize;
  double _width;
  double _height;
  String _element;

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    _screenSize = MediaQuery.of(context).size;
    _width = _screenSize.width;
    _height = _screenSize.height;
    _element = widget.item;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Hero ${widget.item} .'),
      ),
      body: _getBody(radius),
    );
  }

  Widget _crearCheckbox() {
    return SwitchListTile(
      title: Text('Render pane', style: TextStyle(color: Colors.white)),
      value: _renderPanel,
      onChanged: (valor) {
        _renderPanel = valor;
        print('Valor de _renderPanel: $_renderPanel');
        _obtenerMarginPanel();
        setState(() {});
      },
    );
  }

  Widget _getBody(BorderRadiusGeometry radius) {
    return SlidingUpPanel(
      parallaxEnabled: true,
      borderRadius: radius,
      // minHeight: 100.0,
      maxHeight: (70 * _height / 100),
      renderPanelSheet: _renderPanel,
      collapsed: Container(
        decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: radius),
        child: Center(child: _crearCheckbox()),
      ),
      onPanelOpened: _panelChange,
      // defaultPanelState: PanelState.OPEN,
      // panel: _crearPanel(),
      panelBuilder: (ScrollController sc) => _scrollingList(sc),
      body: Hero(
        tag: 'card$_element',
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/galaxystock.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  _panelChange() {
    // print('_panelChange');
    // setState(() {
    //   _obtenerMarginPanel();
    // print('Valor del panel: $value');
    // EdgeInsets value;
    // if (_renderPanel) {
    //   _paneMargin = EdgeInsets.all(24.0);
    // } else {
    //   _paneMargin = null;
    // }
    // return value;
    // });
  }

  Widget _scrollingList(ScrollController sc) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.grey,
          ),
        ],
      ),
      margin: _paneMargin,
      child: Center(
        child: AnimatedList(
          controller: sc,
          initialItemCount: 50,
          itemBuilder: (BuildContext context, int i, Animation animation) {
            return Container(
              padding: const EdgeInsets.all(12.0),
              child: Text("$i test"),
            );
          },
        ),
      ),
    );
  }

  _obtenerMarginPanel() {
    // final duration = new Duration(seconds: 2);
    // new Timer(duration, () {

    // });

    if (_renderPanel) {
      _paneMargin = null;
      print('Valor de _panemargin: $_paneMargin');
    } else {
      _paneMargin = EdgeInsets.all(24.0);
      print('Valor de _panemargin: $_paneMargin');
    }

    // setState(() {});
  }

  Widget _crearPanel() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      children: <Widget>[
        _crearItem(),
        Divider(),
        _crearItem(),
        Divider(),
        _crearItem(),
        Divider(),
        _crearItem(),
        Divider(),
        _crearItem(),
        Divider(),
        _crearItem()
      ],
    );
  }

  Widget _crearItem() {
    return Text('Soy un item');
  }
}
