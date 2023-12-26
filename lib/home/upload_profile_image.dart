import 'dart:io';
import 'package:bondu/home/profile_controller.dart';
import 'package:bondu/home/response_model/profile_model.dart';
import 'package:bondu/signup/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';


class ProfileImageUpload extends StatefulWidget {
  ProfileInfoModel profileInfoModel ;
   ProfileImageUpload({Key? key,required this.profileInfoModel}) : super(key: key);

  @override
  State<ProfileImageUpload> createState() => _ProfileImageUploadState();
}

class _ProfileImageUploadState extends State<ProfileImageUpload> {

  File? image;
  @override
  Widget build(BuildContext context) {
    //RegisterController controller = RegisterController.to;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height/2-50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == null
                ? const Text('No image selected')
                : Image.file(
              image!,
              fit: BoxFit.cover,
              height: 160,
              width: 160,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final ImagePicker _picker = ImagePicker();
                final XFile? ximage =
                await _picker.pickImage(source: ImageSource.gallery);
                if (ximage != null) {
                  setState(() {
                    image = File(ximage.path);

                  });
                }
              },
              child: const Text('Select image'),
            ),
            const SizedBox(height: 16),
            Consumer<CustommerLoginController>(
              builder: (BuildContext context, provider,__) {
                return  ElevatedButton(
                  onPressed: () async {
                    EasyLoading.show(status: "Uploading..");
                   await provider.uploadImage( image, widget.profileInfoModel.data?.id).then((value) async {
                      if(value==true){
                        var data = {
                          "name":widget.profileInfoModel?.data?.name,
                          "phone":widget.profileInfoModel?.data?.phone,
                          "gender":widget.profileInfoModel.data?.gender,
                          "email":widget.profileInfoModel.data?.email,
                          "role":widget.profileInfoModel.data?.role,
                          "image_url":provider.updateProfileModel?.data?.imageUrl,
                        };

                       await provider.updateProfile(data, widget.profileInfoModel.data?.id);
                       EasyLoading.dismiss();
                       Navigator.pop(context);

                      }
                    });
                  },
                  child: const Text('Update Image'),
                );
              },

            ),
          ],
        ),
      ),
    );
  }
}