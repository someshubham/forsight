import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forsight/src/bloc/update_provider.dart';
import 'package:rxdart/rxdart.dart';

class GenericInputWidget extends StatefulWidget {
  const GenericInputWidget({
    this.hintText,
    this.labelText,
    this.stream,
    this.onChange,
    this.initialText,
    this.keyboardType,
    this.icon,
    this.controller,
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final UpdateBloc bloc;
  final String hintText;
  final String labelText;
  final Observable<String> stream;
  final Function(String) onChange;
  final String initialText;
  final Icon icon;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  _GenericInputWidgetState createState() => _GenericInputWidgetState();
}

class _GenericInputWidgetState extends State<GenericInputWidget> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: widget.initialText);
    widget.onChange(widget.initialText);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: StreamBuilder(
        stream: widget.stream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: widget.onChange,
            //obscureText: true,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              labelText: widget.labelText,
              hintStyle: TextStyle(
                  //color: Colors.blue[50]
                  ),
              prefixIcon: widget.icon,
              border: OutlineInputBorder(),
              errorText: snapshot.error,
            ),
          );
        },
      ),
    );
  }
}
