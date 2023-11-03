

import 'package:flutter/material.dart';
import 'package:teko_test_app/config/styles.dart';
import 'package:teko_test_app/domain/entities/error_product.dart';

class ListEditedProducts extends StatelessWidget {
  final List<ErrorProduct> errorProducts;
  const ListEditedProducts({super.key, required this.errorProducts});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: errorProducts.length,
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
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.purple,),
                );
              }
            }),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}