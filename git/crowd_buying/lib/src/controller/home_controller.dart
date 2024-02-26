import 'package:crowd_buying/src/repository/recruit_repository.dart';
import 'package:get/get.dart';

import 'package:crowd_buying/src/model/recruit.dart';

class HomeController extends GetxController {
  RxList<Recruit> recruitList = <Recruit>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadRecruitList();
  }

  void _loadRecruitList() async {
    var recruitListRes = await RecruitRepository.getRecruitList();
    recruitList.addAll(recruitListRes);
  }

}