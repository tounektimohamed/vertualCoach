import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohamed/components/language_constants.dart';
import 'package:mohamed/screens2/select_photo_options.dart';

import '../components/constants.dart';

class SetPhotoScreen extends StatefulWidget {
  const SetPhotoScreen({Key? key});

  static const id = 'set_photo_screen';

  @override
  State<SetPhotoScreen> createState() => _SetPhotoScreenState();
}

class _SetPhotoScreenState extends State<SetPhotoScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final storageRef = FirebaseStorage.instance
      .ref()
      .child('${FirebaseAuth.instance.currentUser!.email}/Prescription');

  String? url;
  File? _image;
  String? _selectedImageUrl;
  String _saveBtnText = 'Upload';
  IconData _saveBtnIcon = Icons.upload_file_outlined;

  @override
  void initState() {
    super.initState();
    getPhotoUrl();
    if (_selectedImageUrl != null) {
      setState(() {
        _image = null;
      });
    }
  }

  Future<String?> getPhotoUrl() async {
    try {
      url = await storageRef.getDownloadURL();
      print(url);
      return url;
    } catch (e) {
      if (e is FirebaseException && e.code == 'object-not-found') {
        print('No object exists at the desired reference.');
      } else {
        rethrow;
      }
    }
    return null;
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);

      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  Future<void> _saveImageToFirebase() async {
    if (_image != null) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromRGBO(7, 82, 96, 1),
            ),
          );
        },
      );

      await storageRef.putFile(_image!);
      if (!mounted) {
        return;
      }
      Navigator.of(context).pop();

      final imageUrl = await storageRef.getDownloadURL();
      print('Image url: $imageUrl');
      setState(() {
        _saveBtnText = 'Done uploading';
        _saveBtnIcon = Icons.done_outline_rounded;
        _image = null;
        _selectedImageUrl = null;
        getPhotoUrl();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromARGB(255, 7, 83, 96),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          content: Text(
            translation(context).pSAI,
          ),
        ),
      );
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted) {
          setState(() {
            _saveBtnText = 'Upload';
            _saveBtnIcon = Icons.upload_file_outlined;
          });
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromARGB(255, 7, 83, 96),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
          content: Text(
            translation(context).pSAI,
          ),
        ),
      );
    }
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.28,
        maxChildSize: 0.4,
        minChildSize: 0.28,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: SelectPhotoOptionsScreen(
              onTap: _pickImage,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translation(context).presImg,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        elevation: 5.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.info_outline_rounded),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            translation(context).photoText1,
                            style: kHeadSubtitleTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Center(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        _showSelectPhotoOptions(context);
                      },
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1.5,
                          height: MediaQuery.of(context).size.width * 1.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: _image == null
                                ? (_selectedImageUrl == null
                                    ? FutureBuilder(
                                        future: getPhotoUrl(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            if (snapshot.hasData) {
                                              return Image.network(
                                                url!,
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              return Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: Image.asset(
                                                        'lib/assets/icons/image-.gif',
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 241, 250, 251),
                                                        colorBlendMode:
                                                            BlendMode.darken,
                                                        height: 100.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      'Your prescription image\n will be displayed here',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    FilledButton(
                                                      onPressed: () =>
                                                          _showSelectPhotoOptions(
                                                              context),
                                                      style: const ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                Color.fromARGB(
                                                                    255,
                                                                    217,
                                                                    237,
                                                                    239)),
                                                        foregroundColor:
                                                            MaterialStatePropertyAll(
                                                                Color.fromRGBO(
                                                                    7,
                                                                    82,
                                                                    96,
                                                                    1)),
                                                        shape:
                                                            MaterialStatePropertyAll(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  20),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'Add an image',
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          } else if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          } else {
                                            return const Text('Error');
                                          }
                                        },
                                      )
                                    : Text(
                                        translation(context).nIS,
                                        style: const TextStyle(fontSize: 20),
                                      ))
                                : Image.file(
                                    _image!,
                                    width:
                                        MediaQuery.of(context).size.width * 1.5,
                                    height:
                                        MediaQuery.of(context).size.width * 1.0,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.add_photo_alternate_outlined),
                    onPressed: () => _showSelectPhotoOptions(context),
                    style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(6),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    label: Text(
                      translation(context).photoBtn1,
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _saveImageToFirebase();
                    },
                    style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(2),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    label: Text(
                      _saveBtnText,
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    icon: Icon(_saveBtnIcon),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
