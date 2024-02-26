import 'dart:io';

import 'package:crowd_buying/src/app.dart';
import 'package:crowd_buying/src/component/popup_message.dart';
import 'package:crowd_buying/src/model/recruit.dart';
import 'package:crowd_buying/src/repository/recruit_repository.dart';
import 'package:crowd_buying/src/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  var imagePicked;

  void pickImage(image) {
    this.imagePicked = File(image.path);
    update();
  }

  void uploadRecruit(Recruit recruitData) async {
    // await RecruitRepository.createRecruit(recruitData);
    showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
              title: 'Recruit',
              message: '모집 공고가 등록되었습니다.',
              okCallback: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              cancelCallback: () {
                Get.back();
              },
            ));
  }
}
