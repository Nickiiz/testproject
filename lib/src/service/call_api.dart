//ไฟล์นี้เป็นไฟล์ที่ใช้ในการเรียกใช้ api ต่างๆ

// ignore_for_file: prefer_interpolation_to_compose_strings, camel_case_types

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_flutter_fullstack/src/models/post.dart';
import 'package:learn_flutter_fullstack/src/utils/env.dart';

class callApi {
  //เมธอดเรียกใช้ API: getall ------------------------------------------
  static Future<List<Post>> callAPIGetAllDiaryfood() async {
    //เรียกใช้ API
    final response = await http.get(
      Uri.parse(Env.domainURL + '/mydiaryapi/getall'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      //เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอปฯ เก็บในตัวแปร
      final responseData = jsonDecode(response.body);

      //แปลงข้อมูลให้เป็น List และเก็บในตัวแปร List
      final diaryfoodDataList = await responseData.map<Post>((json) {
        return Post.fromJson(json);
      }).toList();

      //ส่งค่าข้อมูลที่เก็บในตัวแปร List กลับไป ณ จุดที่เรียกใช้เมธอดนี้ เพื่อนำข้อมูลไปใช้งาน
      return diaryfoodDataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  //เมธอดเรียกใช้ API: insert ------------------------------------------
  static Future<String> calAPIInserDiaryfood(Post diaryfood) async {
    //เรียกใช้ API
    final response = await http.post(
      Uri.parse(Env.domainURL + '/mydiaryapi/insert'),
      body: jsonEncode(diaryfood.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      //เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอปฯ เก็บในตัวแปร
      final responseData = jsonDecode(response.body);

      //ส่งค่าข้อมูลที่ส่งกลับมาไปที่จุดเรียกใช้เมธอด
      return responseData['message'];
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  //เมธอดเรียกใช้ API: update ------------------------------------------
  static Future<String> calAPIUpdateDiaryfood(Post diaryfood) async {
    //เรียกใช้ API
    final response = await http.post(
      Uri.parse(Env.domainURL + '/mydiaryapi/update'),
      body: jsonEncode(diaryfood.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      //เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอปฯ เก็บในตัวแปร
      final responseData = jsonDecode(response.body);

      //ส่งค่าข้อมูลที่ส่งกลับมาไปที่จุดเรียกใช้เมธอด
      return responseData['message'];
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  //เมธอดเรียกใช้ API: delete ------------------------------------------
  static Future<String> calAPIDeleteDiaryfood(Post diaryfood) async {
    //เรียกใช้ API
    final response = await http.post(
      Uri.parse(Env.domainURL + '/mydiaryapi/delete'),
      body: jsonEncode(diaryfood.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      //เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอปฯ เก็บในตัวแปร
      final responseData = jsonDecode(response.body);

      //ส่งค่าข้อมูลที่ส่งกลับมาไปที่จุดเรียกใช้เมธอด
      return responseData['message'];
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  //เมธอดเรียกใช้ API: checklogin ------------------------------------------
  // static Future<Member> callAPIChecklogin(Member member) async {
  //   //เรียกใช้ API
  //   final response = await http.post(
  //     Uri.parse(Env.domainURL + '/mydiaryapi/checklogin'),
  //     body: jsonEncode(member.toJson()),
  //     headers: {'Content-Type': 'application/json'},
  //   );

  //   if (response.statusCode == 200) {
  //     //เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอปฯ เก็บในตัวแปร
  //     final responseData = jsonDecode(response.body);

  //     //ส่งค่าข้อมูลที่ส่งกลับมาไปที่จุดเรียกใช้เมธอด
  //     return Member.fromJson(responseData);
  //   } else {
  //     throw Exception('Failed to fetch data');
  //   }
  // }
}
