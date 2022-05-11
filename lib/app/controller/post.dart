import 'package:get/get.dart';

import 'package:enft/app/controller/user.dart';

import 'package:enft/app/data/model/post.dart';
import 'package:enft/app/data/repository/post.dart';

class PostController extends GetxController {
  final PostRepository repository;

  PostController({required this.repository});

  // post는 들어갈 때마다 새로 초기화 해줘야 되니까 재생성 되어야한다.
  // PostList는 새로 초기화 안해줘도 된다.

  @override
  onInit() {}

  RxList<Post> _postList = List<Post>.empty(growable: true).obs;
  RxString _title = "".obs;
  RxString _content = "".obs;
  RxDouble _cost = 0.0.obs;
  RxList<String> _images = List<String>.empty(growable: true).obs;

  get postList => _postList.value;

  set postList(value) => _postList.value = value;

  get title => _title.value;

  set title(value) => _title.value = value;

  get content => _content.value;

  set content(value) => _content.value = value;

  get cost => _cost.value;

  set cost(value) => _cost.value = value;

  get images => _images.value;

  set images(value) => _images.value;

  writePost() async {
    Map<String, dynamic> data = {
      'title': title,
      'content': content,
      'cost': cost.toString(),
      'image': images,
      'location': UserController.to.user.location,
    };

    await repository.writePost(data, UserController.to.user.access_token);
  }

  getPost() async => postList = repository.getPost();
}