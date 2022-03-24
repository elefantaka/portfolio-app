import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/views/displayed_image_view.dart';

class PortfolioView extends StatefulWidget {
  final double sizeOK;

  const PortfolioView({this.sizeOK = 500, Key? key}) : super(key: key);

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  late OverlayEntry _popupDialog;
  bool _boldFont = false;
  bool _changeBackgroundColor = true;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.indigo[600],
      body: Center(
        child: Container(
          width: widget.sizeOK,
          height: widget.sizeOK,
          constraints: BoxConstraints(
            maxWidth: orientation == Orientation.portrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height,
            maxHeight: orientation == Orientation.portrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: _buildImage(context, Strings.idImagePath),
                    ),
                    Flexible(
                      flex: 2,
                      child: _buildNameText(),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: _buildExpectationText(),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          Flexible(
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  child: _buildWavyText(Strings.kiteText),
                                ),
                                Flexible(
                                  child: _buildImage(context, Strings.kiteImagePath),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  child: _buildImage(context, Strings.swimmingImagePath),
                                ),
                                Flexible(
                                  child: _buildWavyText(Strings.swimmingText),
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
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, String path) {
    return GestureDetector(
      onLongPress: () {
        _popupDialog = _createPopupImage(
          context,
          path,
        );
        Overlay.of(context)?.insert(_popupDialog);
      },
      onLongPressEnd: (LongPressEndDetails details) => _popupDialog.remove(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.fill),
        ),
      ),
    );
  }

  OverlayEntry _createPopupImage(BuildContext context, String path) {
    return OverlayEntry(
      builder: (BuildContext context) => DisplayedImage(
        child: _createPopupImageContent(context, path),
      ),
    );
  }

  Widget _createPopupImageContent(BuildContext context, String path) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      constraints: BoxConstraints(
        maxWidth: orientation == Orientation.portrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height,
        maxHeight: orientation == Orientation.portrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image(
          image: AssetImage(path),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildNameText() {
    return InkWell(
      onTap: () {
        setState(
          () {
            _boldFont = !_boldFont;
          },
        );
      },
      child: Container(
        color: Colors.indigo[900],
        child: Center(
          child: Text(
            Strings.nameText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.indigo[50], fontSize: 20, fontWeight: _boldFont == true ? FontWeight.w900 : FontWeight.w400),
          ),
        ),
      ),
    );
  }

  Widget _buildExpectationText() {
    return InkWell(
      onTap: () {
        setState(
          () {
            _changeBackgroundColor = !_changeBackgroundColor;
          },
        );
      },
      child: Container(
        color: _changeBackgroundColor == true ? Colors.indigo[900] : Colors.indigo[800],
        child: Center(
          child: Text(
            Strings.expectationText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.indigo[50],
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWavyText(String string) {
    return Container(
      color: Colors.indigo[400],
      child: Center(
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.indigo[50],
            fontSize: 18,
          ),
          child: AnimatedTextKit(
            animatedTexts: <WavyAnimatedText>[
              WavyAnimatedText(
                string,
                textAlign: TextAlign.center,
                speed: const Duration(milliseconds: 300),
              ),
            ],
            totalRepeatCount: 1,
            isRepeatingAnimation: true,
            repeatForever: false,
          ),
        ),
      ),
    );
  }
}
