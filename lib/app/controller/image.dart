import 'package:get/get.dart';

import 'package:enft/app/data/repository/image.dart';

class ImageController extends GetxController {
  final ImageRepository repository;

  ImageController({required this.repository});

  @override
  onInit() async {
    await pickOriginProfile();
    super.onInit();
  }

  RxString _img = "".obs;
  List<dynamic> _imgList = List.empty(growable: true).obs;

  get img => _img.value;

  set img(value) => _img.value = value;

  get imgList => _imgList;

  set imgList(value) => _imgList = value;

  pickImgFromGallery() async => img = await repository.pickImgFromGallery();

  pickImgFromCamera() async => img = await repository.pickImgFromCamera();

  pickMultiImg() async => imgList = await repository.pickMultiImg();

  pickOriginProfile() async => img = await repository.pickOriginProfile();
}