import 'package:flutter/material.dart';

class PortfolioView extends StatefulWidget {
  final double sizeOK;

  const PortfolioView({this.sizeOK = 500, Key? key}) : super(key: key);

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.sizeOK,
      height: widget.sizeOK,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: _buildPhoto(),
                ),
                Flexible(
                  flex: 2,
                  child: _buildName(),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              children: <Widget>[
                Flexible(
                  child: _buildMotivationDescription(),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: _buildKiteWord(),
                            ),
                            Flexible(
                              child: _buildKitePhoto(),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: _buildSwimWord(),
                            ),
                            Flexible(
                              child: _buildSwimPhoto(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildPhoto() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/photos/idPhoto.jpg'), fit: BoxFit.fill),
    ),
  );
}

Widget _buildName() {
  return Container(
    color: Colors.yellow,
    child: const Center(
      child: Text(
        'Name',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}

Widget _buildMotivationDescription() {
  return Container(
    color: Colors.pink,
    child: const Center(
      child: Text(
        'Motivation',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}

Widget _buildKiteWord() {
  return Container(
    color: Colors.orange,
    child: const Center(
      child: Text(
        'Kite',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}

Widget _buildKitePhoto() {
  return Container(
    color: Colors.cyan,
    child: const Center(
      child: Text(
        'Kite photo',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}

Widget _buildSwimWord() {
  return Container(
    color: Colors.green,
    child: const Center(
      child: Text(
        'Swimming',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}

Widget _buildSwimPhoto() {
  return Container(
    color: Colors.black,
    child: const Center(
      child: Text(
        'Swimming photo',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}
