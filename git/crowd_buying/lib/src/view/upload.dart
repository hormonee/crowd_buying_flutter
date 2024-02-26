import 'dart:io';

import 'package:crowd_buying/src/controller/upload_controller.dart';
import 'package:crowd_buying/src/model/recruit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final UploadController uploadController = Get.put(UploadController());
  final _recruitMemberNumList = [2, 3, 4, 5, 6, 7, 8, 9, 10];
  var _selectedRecruitMemberNum = 2;
  final _recruitTypeList = ['공개', '익명'];
  var _selectedRecruitType = '공개';
  var productNameInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                uploadController.uploadRecruit(new Recruit());
              },
              icon: Icon(
                Icons.send,
                size: 30,
              )),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('대표 이미지를 첨부해주세요.',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          GetBuilder<UploadController>(builder: (_) {
            return Container(
              child: uploadController.imagePicked == null
                  ? Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 280,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: IconButton(
                          icon: Icon(
                            Icons.add_box_outlined,
                            size: 42,
                          ),
                          onPressed: () async {
                            print(uploadController.imagePicked);
                            var picker = ImagePicker();
                            var imagePicked = await picker.pickImage(
                              source: ImageSource.gallery,
                              maxWidth: 360,
                              maxHeight: 300,
                            );

                            if (imagePicked != null) {
                              uploadController.pickImage(imagePicked);
                            }
                          }),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.file(uploadController.imagePicked),
                    ),
            );
          }),
          GetBuilder<UploadController>(builder: (_) {
            return Container(
              child: uploadController.imagePicked == null
                  ? SizedBox(height: 12)
                  : Padding(
                      padding: EdgeInsets.fromLTRB(12, 24, 12, 24),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            side: BorderSide(color: Colors.black),
                            foregroundColor:
                                CupertinoColors.extraLightBackgroundGray),
                        child: Text(
                          '이미지 다시 선택하기',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                        // style: ButtonStyle(),
                        onPressed: () async {
                          print(uploadController.imagePicked);
                          var picker = ImagePicker();
                          var imagePicked = await picker.pickImage(
                            source: ImageSource.gallery,
                            maxWidth: 350,
                            maxHeight: 350,
                          );

                          if (imagePicked != null) {
                            uploadController.pickImage(imagePicked);
                          }
                        },
                      )),
            );
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: productNameInput,
                style: TextStyle(color: Colors.black87, fontSize: 20),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  label: Text(
                    '제품명',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  hintText: '제품명을 정확히 입력해주세요.',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Text(
                  '모집 인원   ',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton<int>(
                  value: _selectedRecruitMemberNum,
                  items: _recruitMemberNumList.map((val) {
                    return DropdownMenuItem(
                        value: val, child: Text(val.toString()));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedRecruitMemberNum = val!;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Text(
                  '모집 타입   ',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton<String>(
                  value: _selectedRecruitType,
                  items: _recruitTypeList.map((val) {
                    return DropdownMenuItem(
                        value: val, child: Text(val));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedRecruitType = val!;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
