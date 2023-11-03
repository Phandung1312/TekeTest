import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teko_test_app/presentation/screens/error_products/bloc/error_products_bloc.dart';
import 'package:teko_test_app/presentation/screens/error_products/sections/list_edited_products.dart';
import 'package:teko_test_app/presentation/screens/error_products/sections/list_error_products.dart';

class ErrorProductsScreen extends StatefulWidget {
  const ErrorProductsScreen({super.key});

  @override
  State<ErrorProductsScreen> createState() => _ErrorProductsScreenState();
}

class _ErrorProductsScreenState extends State<ErrorProductsScreen> {
  bool isEditing = false;
  @override
  void initState() {
    super.initState();
    context.read<ErrorProductsBloc>().add(Load());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ErrorProductsBloc, ErrorProductsState>(
      listener: (context, state) {
        if (state is SaveEditedProductSucces) {
          showDialog(
              context: context,
              builder: (context) =>
                  ListEditedProducts(errorProducts: state.editedProducts));
        }
      },
      buildWhen: (previous, current) => current is ErrorProductsLoadSuccess,
      builder: (context, state) => SafeArea(
          child: Scaffold(
        body: Container(
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (state is ErrorProductsLoadSuccess)
                Expanded(
                    child:
                        ListErrorProducts(errorProducts: state.errorProducts)),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: () {
                        isEditing
                            ? context
                                .read<ErrorProductsBloc>()
                                .add(SaveEditedProduct())
                            : context
                                .read<ErrorProductsBloc>()
                                .add(StartEditProduct());
                        setState(() {
                          isEditing = !isEditing;
                        });
                      },
                      child: Text(
                        isEditing ? "SUBMIT" : "EDIT",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
