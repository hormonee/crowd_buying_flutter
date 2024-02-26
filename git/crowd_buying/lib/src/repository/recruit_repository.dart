import 'dart:convert';

import 'package:crowd_buying/src/model/recruit.dart';
import 'package:http/http.dart' as http;

class RecruitRepository {
  static Future<List<Recruit>> getRecruitList() async {
    var recruitListData = await http
        .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    return jsonDecode(recruitListData.body);
  }

  static Future<void> createRecruit(Recruit recruitData) async {
    await http.post(Uri.parse('https://'));
  }

  static Future<void> updateRecruit(Recruit recruitData) async {
    await http.patch(Uri.parse('https://'));
  }

  static Future<void> deleteRecruit(Recruit recruitData) async {
    await http.delete(Uri.parse('https://'));
  }
}
