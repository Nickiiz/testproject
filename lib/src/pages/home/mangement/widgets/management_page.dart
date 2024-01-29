// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learn_flutter_fullstack/src/models/product.dart';
//import 'package:learn_flutter_fullstack/src/pages/management/widgets/product_image.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({super.key});

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  late bool _isEdit;
  final _spacing = 12;
  late Product _product;
  final _form = GlobalKey<FormState>();
  @override
  void initState() {
    _isEdit = false;
    _product = Product();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Object? arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is Product) {
      _isEdit = true;
      _product = arguments;
    }
    return Scaffold(
      appBar: _buildAppbar(),
      body: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                _buildNameInput(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Flexible(
                      child: _buildPriceInput(),
                      fit: FlexFit.tight,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: _buildStockInput(),
                      fit: FlexFit.tight,
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text(_isEdit ? 'Edit Product' : 'Approve Leave'),
      actions: [
        TextButton(
          onPressed: () {
            _form.currentState?.save();
            print(_product.name);
            print(_product.price);
            print(_product.stock);
          },
          child: Text('submit'),
        ),
      ],
    );
  }

  InputDecoration inputStyle(label) => InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        labelText: label,
      );

  TextFormField _buildNameInput() => TextFormField(
        decoration: inputStyle('name'),
        onSaved: (value) {
          _product.name = (value!.isEmpty ? '_' : value);
        },
      );

  TextFormField _buildPriceInput() => TextFormField(
        decoration: inputStyle('price'),
        keyboardType: TextInputType.number,
        onSaved: (value) {
          _product.price = (value!.isEmpty ? 0 : int.parse(value));
        },
      );

  TextFormField _buildStockInput() => TextFormField(
        decoration: inputStyle('stock'),
        keyboardType: TextInputType.number,
        onSaved: (value) {
          _product.stock = (value!.isEmpty ? 0 : int.parse(value));
        },
      );
}
