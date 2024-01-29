// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_flutter_fullstack/src/utils/env.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
//ตัวแปรที่ใช้กับการเลือกรูป จากแกลอรี่ หรือกล้องใช้ชื่อว่า foodImageSelected
  XFile? foodImageSelected;

  //ตัวแปรเก็บรูปภาพที่แปลงเป็น basse64 เพื่อส่งไปที่ server
  String? foodImageBasse64 = '';

  //เมธอดที่ใช้ในการเปิดกล้อง หรือ เปิดแกลอรี่
  openGalleryAndSelectImage() async {
    final photo = await ImagePicker().pickImage(
      source: ImageSource.gallery, //******
      imageQuality: 75,
    );
    if (photo == null) return;
    foodImageBasse64 = base64Encode(File(photo.path).readAsBytesSync());
    setState(() {
      foodImageSelected = photo;
    });
  }

  openCameraAndSelectImage() async {
    final photo = await ImagePicker().pickImage(
      source: ImageSource.camera, //********
      imageQuality: 75,
    );
    if (photo == null) return;
    foodImageBasse64 = base64Encode(File(photo.path).readAsBytesSync());
    setState(() {
      foodImageSelected = photo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.only(
            left: 50,
            right: 50,
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: Colors.black),
                            image: DecorationImage(
                                image: AssetImage('assets/images/image3.jpeg'),
                                fit: BoxFit.cover),
                            // image: DecorationImage(image: foodImageSelected == null?
                            // NetworkImage(Env.domainURL +''+widget.))
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.camera),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        _buildID_CardInput(),
                        SizedBox(
                          height: 10,
                        ),
                        _buildNameInput(),
                        _buildNameInput(),
                        _buildNameInput(),
                        _buildNameInput(),
                        _buildNameInput(),
                        _buildNameInput(),
                        _buildNameInput(),
                        _buildNameInput(),
                        _buildNameInput(),
                        _buildNameInput(),
                      ],
                    ),
                  ),
                  TextFieldWidget('ID Card', idCardController),
                  TextFieldWidget('NickName', nicknameController),
                  TextFieldWidget('BirthDate', birthdateController),
                  TextFieldWidget('Sex', sexController),
                  TextFieldWidget('Blood Group', bloodgroupController),
                  TextFieldWidget('Religion', religionController),
                  TextFieldWidget(
                      'Contact Information', contactinformationController),
                  TextFieldWidget('Email', emailController),
                  TextFieldWidget('Tel.', telController),
                  TextFieldWidget(
                      'Emergency Contacts', emergencycontactController),
                  TextFieldWidget('Current Address', currentaddressController),
                  TextFieldWidget('Address to house registration',
                      addressToHouseRegistrationController),
                  TextFieldWidget('Passport', passportController),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 130, right: 130, bottom: 30),
        child: ElevatedButton(
          onPressed: () {
            // ทำสิ่งที่คุณต้องการเมื่อกดปุ่มแก้ไข
            idCardValue = idCardController.text;
            nicknameValue = nicknameController.text;
            birthdateValue = birthdateController.text;
            sexValue = sexController.text;
            bloodgroupValue = bloodgroupController.text;
            contactinformationValue = contactinformationController.text;
            emailValue = emailController.text;
            telValue = telController.text;
            emergencycontactValue = emergencycontactController.text;
            currentaddressValue = currentaddressController.text;
            addressToHouseRegistrationValue =
                addressToHouseRegistrationController.text;
            passportValue = passportController.text;

            // ตรวจสอบค่าที่ถูกบันทึก
            print('ID Card: $idCardValue');
            print('NickName: $nicknameValue');

            // บันทึกข้อมูลหรือประมวลผลต่อไปตามความต้องการของคุณ
            // ...

            // เมื่อบันทึกข้อมูลเสร็จสิ้น, คุณสามารถล้างข้อมูลใน TextField
            idCardController.clear();
            nicknameController.clear();
            birthdateController.clear();
            sexController.clear();
            bloodgroupController.clear();
            religionController.clear();
            contactinformationController.clear();
            emailController.clear();
            telController.clear();
            emergencycontactController.clear();
            addressToHouseRegistrationController.clear();
            passportController.clear();
            // ล้าง TextEditingControllers สำหรับ TextFieldWidget อื่น ๆ
          },
          child: Text(
            'แก้ไขข้อมูล',
            style: TextStyle(fontSize: 18),
          ),
        ),
        // child: ElevatedButton(
        //   onPressed: () {
        //     // ทำสิ่งที่คุณต้องการเมื่อกดปุ่มแก้ไข
        //     idCardValue = idCardController.text;
        //     print('NickName: ${nicknameController.text}');
        //     print('Birthdate: ${birthdateController.text}');
        //     print('NickName: ${nicknameController.text}');
        //     print('NickName: ${nicknameController.text}');
        //     print('NickName: ${nicknameController.text}');
        //     print('NickName: ${nicknameController.text}');
        //     print('NickName: ${nicknameController.text}');
        //     print('NickName: ${nicknameController.text}');
        //     print('NickName: ${nicknameController.text}');
        //     print('NickName: ${nicknameController.text}');
        //     print('NickName: ${nicknameController.text}');
        //     print('NickName: ${nicknameController.text}');
        //     print('NickName: ${nicknameController.text}');
        //     // ประมวลผลข้อมูลต่อไป
        //   },
        //   child: Text('แก้ไข'),
        //   style: ButtonStyle(
        //       backgroundColor: MaterialStatePropertyAll(Colors.amber)),
        // ),
      ),
    );
  }

  InputDecoration inputStyle(label) => InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        labelText: label,
      );
  TextFormField _buildNameInput() => TextFormField(
        controller: nicknameController,
        decoration: InputDecoration(labelText: 'Name'),
      );
  TextFormField _buildID_CardInput() => TextFormField(
        controller: idCardController,
        decoration: InputDecoration(labelText: 'ID Card'),
        validator: (value) {
          if (value!.isEmpty) {
            return 'sfgddsfg';
          }
          return null;
        },
      );
}

class TextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const TextFieldWidget(this.label, this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final _formKey = GlobalKey<FormState>();
TextEditingController idCardController = TextEditingController();
TextEditingController nicknameController = TextEditingController();
TextEditingController birthdateController = TextEditingController();
TextEditingController sexController = TextEditingController();
TextEditingController bloodgroupController = TextEditingController();
TextEditingController religionController = TextEditingController();
TextEditingController contactinformationController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController telController = TextEditingController();
TextEditingController emergencycontactController = TextEditingController();
TextEditingController currentaddressController = TextEditingController();
TextEditingController addressToHouseRegistrationController =
    TextEditingController();
TextEditingController passportController = TextEditingController();

String idCardValue = idCardValue;
String nicknameValue = nicknameValue;
String birthdateValue = '';
String sexValue = '';
String bloodgroupValue = '';
String religionValue = '';
String contactinformationValue = '';
String emailValue = '';
String telValue = '';
String emergencycontactValue = '';
String currentaddressValue = '';
String addressToHouseRegistrationValue = '';
String passportValue = '';
