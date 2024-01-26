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
      body: Padding(
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
                  height: 100,
                ),
                Text('ID Card'),
                Text('NickName'),
                Text('BirthDate'),
                Text('Sex'),
                Text('Blood Group'),
                Text('Religion'),
                Text('Contact Information'),
                Text('Email'),
                Text('Tel.'),
                Text('Emergency Contacts'),
                Text('Current Address'),
                Text('Address to house registration'),
                Text('Passport'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
