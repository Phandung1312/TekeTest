import 'package:injectable/injectable.dart';
import 'package:teko_test_app/data/mappers/base_model_mapper.dart';
import 'package:teko_test_app/data/models/error_product_model.dart';
import 'package:teko_test_app/domain/entities/error_product.dart';

@injectable
class ErrorProductMapper
    extends BaseModelMapper<ErrorProductModel, ErrorProduct> {
  @override
  ErrorProduct maptoEntity(ErrorProductModel? model) {
    return ErrorProduct(
      id: model?.id ?? 0,
      errorDescription: model?.errorDescription ?? "",
      name: model?.name ?? "",
      sku: model?.sku ?? "",
      imageUrl: model?.image ?? "",
    );
  }

  ErrorProductModel maptoModel(ErrorProduct entity) {
    return ErrorProductModel(
      id: entity.id,
      errorDescription: entity.errorDescription,
      name: entity.errorDescription,
      sku: entity.sku,
      image: entity.imageUrl,
      color: entity.color?.id
      );
  }
}
