

import 'package:injectable/injectable.dart';
import 'package:teko_test_app/data/mappers/base_model_mapper.dart';
import 'package:teko_test_app/data/models/color_model.dart';
import 'package:teko_test_app/domain/entities/color.dart';

@injectable
class ColorMapper extends BaseModelMapper<ColorModel, ColorEntity>{
  @override
  ColorEntity maptoEntity(ColorModel? model) {
    return ColorEntity(
      id: model?.id ?? 0,
      name: model?.name ?? ""
    );
  }

}