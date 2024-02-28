import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/mediaquery/media_query.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../common/common_sizebox.dart';

class CustomDrawerForHome extends StatefulWidget {
  const CustomDrawerForHome({super.key});

  @override
  State<CustomDrawerForHome> createState() => _CustomDrawerForHomeState();
}

class _CustomDrawerForHomeState extends State<CustomDrawerForHome> {
  ImagePicker picker = ImagePicker();

  File? imageFile;

  Future<void> getImage() async {
    var tempFile = await picker.pickImage(source: ImageSource.gallery);

    if (tempFile != null) {
      var file = File(tempFile.path);

      setState(() {
        imageFile = file;
        saveImage(imageFile!);
      });
    }
  }

  Future<void> saveImage(File imageFile) async {
    Directory root = await getApplicationSupportDirectory();

    String fileName = '${DateTime.now().microsecondsSinceEpoch}.image';

    if (kDebugMode) {
      print(root);
      print(fileName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber.shade100,
      child: ListView(
        children: [
          CommonSizeBox(height: MediaQueryHelper.height * 30),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: Container(
              height: MediaQueryHelper.height * 180,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(130),
              ),
              child: InkWell(
                onTap: () {
                  getImage();
                },
                child: imageFile == null
                    ? Image.asset(
                        'assets/images/splash_done.png',
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      )
                    : Image.file(imageFile!),
              ),
            ),
          ),
          CommonSizeBox(height: MediaQueryHelper.height * 30),
          ListTile(
            title: const Text(
              'Trueline Institute',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w700),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'TruelineInstitute@gmail.com',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w300),
            ),
            onTap: () {},
          ),
          CommonSizeBox(height: MediaQueryHelper.height * 20),
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Manage Category'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Manage Product'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
