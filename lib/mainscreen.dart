    
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const double _topSectionTopPadding = 38.0;
  static const double _topSectionBottomPadding = 20.0;
  static const double _topSectionHeight = 50.0;

  String _dataString = 'Generate with your own text';
  String _inputErrorText;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate QR'),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.scanner),
            onPressed:(){},
          ),
          IconButton(
            icon: Icon(Icons.people),
            onPressed:(){
              Navigator.of(context).pushNamed('/scanner');
            },
          )//IconButton
        ],
      ),
      body: _contentWidget(),
      resizeToAvoidBottomPadding: true,
    );
  }

  @override
  void didUpdateWidget(MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  Widget _contentWidget() {
    return Container(
      color: const Color(0xFFffffff),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(90.0),
                child: QrImage(
                  data: _dataString,
                  gapless: false,
                  version: 2,
                  foregroundColor: const Color(0xFF000000),
                  onError: (dynamic ex) {
                    print('Something wrong');
                    setState(() {
                      _inputErrorText =
                          'Enter limited text';
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: _topSectionTopPadding,
              left: 30.0,
              right: 20.0,
              bottom: _topSectionBottomPadding,
            ),
            child: Container(
              height: _topSectionHeight,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      controller: _textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: 'Enter some text to convert this to qr code',
                        errorText: _inputErrorText,
                      ),
                    ),
                  ),
                  Padding(

                    padding: const EdgeInsets.only(left: 10.0,),
                    child: RaisedButton(
                      color: Colors.red,

                      child: const Text('GENERATE'),
                      onPressed: () {
                        setState(() {
                          _dataString = _textController.text;
                          _inputErrorText = null;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
