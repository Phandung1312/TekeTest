import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teko_test_app/config/styles.dart';
import 'package:teko_test_app/domain/entities/color.dart';
import 'package:teko_test_app/domain/entities/error_product.dart';
import 'package:teko_test_app/presentation/screens/error_products/bloc/error_products_bloc.dart';

class EditErrorProductDialog extends StatefulWidget {
  final ErrorProduct errorProduct;
  const EditErrorProductDialog({super.key, required this.errorProduct});

  @override
  State<EditErrorProductDialog> createState() => _EditErrorProductDialogState();
}

class _EditErrorProductDialogState extends State<EditErrorProductDialog> {
  List<ColorEntity> colors = [];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _skuController = TextEditingController();
  ColorEntity? selectedColor;
  @override
  void initState() {
    super.initState();
    final state = BlocProvider.of<ErrorProductsBloc>(context).state;
    if (state is LoadColorsSuccess) {
      colors = state.colors;
    }
    selectedColor = widget.errorProduct.color;
    _productNameController.text = widget.errorProduct.name;
    _skuController.text = widget.errorProduct.sku;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit"),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _productNameController,
                      decoration: const InputDecoration(
                        labelText: "Product Name",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Product Name cannot empty";
                        if (value.length > 50)
                          return "Product names cannot be longer than 50 characters";
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _skuController,
                      decoration: const InputDecoration(
                        labelText: "SKU",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "SKU cannot empty";
                        if (value.length > 20)
                          return "SKU cannot be longer than 20 characters";
                        return null;
                      },
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Color", style: Styles.primaryText),
                DropdownButton<ColorEntity>(
                    value: selectedColor,
                    items: colors.map((e) {
                      return DropdownMenuItem<ColorEntity>(
                        value: e,
                        child: Text(e.name),
                      );
                    }).toList(),
                    onChanged: (color) {
                      setState(() {
                        selectedColor = color;
                      });
                    })
              ],
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              var oldProduct = widget.errorProduct;
              var editedProduct = oldProduct.copyWith(
                name: _productNameController.text,
                sku: _skuController.text,
                color: selectedColor
              );
               context.read<ErrorProductsBloc>().add(EditedProduct(product: editedProduct));
              Navigator.of(context).pop();
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
