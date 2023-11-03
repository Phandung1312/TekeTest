import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teko_test_app/config/styles.dart';
import 'package:teko_test_app/domain/entities/error_product.dart';
import 'package:teko_test_app/presentation/screens/error_products/bloc/error_products_bloc.dart';
import 'package:teko_test_app/presentation/screens/error_products/sections/edit_error_product_dialog.dart';

class ListErrorProducts extends StatelessWidget {
  const ListErrorProducts({super.key, required this.errorProducts});
  final List<ErrorProduct> errorProducts;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ErrorProductsBloc, ErrorProductsState>(
        listener: (context, state) {
        },
        buildWhen: (previous, current) =>
            current is ErrorProductsLoadingMore ||
            current is ErrorProductsEditing ||
            current is ErrorProductsLoadError ||
            current is SaveEditedProductSucces,
        builder: (context, state) => ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state is ErrorProductsLoadingMore
                ? errorProducts.length + 1
                : errorProducts.length,
            controller: context.read<ErrorProductsBloc>().controller
              ..addListener(() {
                context.read<ErrorProductsBloc>().add(LoadMore());
              }),
            itemBuilder: (context, index) {
              if (index < errorProducts.length) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Image.network(
                            errorProducts[index].imageUrl,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null);
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error_outline_sharp);
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(errorProducts[index].name,
                                style: Styles.primaryText),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(errorProducts[index].errorDescription,
                                style: Styles.primaryText),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(errorProducts[index].sku,
                                style: Styles.primaryText),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(errorProducts[index].color?.name ?? "",
                                style: Styles.primaryText)
                          ],
                        )),
                        SizedBox(
                            width: 50,
                            child: state.isEditting 
                                ? InkWell(
                                    onTap: () {
                                      context.read<ErrorProductsBloc>().add(LoadColors());
                                      showDialog(context: context, builder: (context) => EditErrorProductDialog(errorProduct: errorProducts[index]));
                                    },
                                    child: const Icon(
                                      Icons.mode_edit_outlined,
                                      color: Colors.red,
                                    ),
                                  )
                                : null)
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.purple,),
                );
              }
            }));
  }
}
