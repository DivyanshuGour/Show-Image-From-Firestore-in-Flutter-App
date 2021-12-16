import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Show extends StatefulWidget {
  const Show({Key? key}) : super(key: key);

  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {


  @override
  void initState() {
    getFirebaseImageFolder();
    super.initState();
  }

  void getFirebaseImageFolder() {
    final storageRef = FirebaseStorage.instance.ref();
    storageRef.listAll().then((result) {
      result.items.forEach((imageRef) {
          // And finally display them
          imageRef.getDownloadURL().then((url) =>
          _imageProviders.add(Image.network(url).image));
    });
    });
  }


  final List<ImageProvider> _imageProviders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE6F8FF),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
              onLongPress: () {
                MultiImageProvider multiImageProvider =
                MultiImageProvider(_imageProviders);
                showImageViewerPager(context, multiImageProvider);
                },
                child: Container(
                  color: const Color(0xffE6F8FF),
                  height: 150,
                  width: 150,
                ),
              )
            ],
          )),
    );
  }
}

class CustomImageProvider extends EasyImageProvider {
  @override
  final int initialIndex;
  final List<String> imageUrls;

  CustomImageProvider({required this.imageUrls, this.initialIndex = 0})
      : super();

  @override
  ImageProvider<Object> imageBuilder(BuildContext context, int index) {
    return NetworkImage(imageUrls[index]);
  }

  @override
  int get imageCount => imageUrls.length;
}

