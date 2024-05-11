// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs, unused_element

import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:lingo_pal_mobile/presentation/controllers/camera_controllers/picker_controller.dart';
import 'package:lingo_pal_mobile/presentation/controllers/profile_page/edit_API_controller.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:mime/mime.dart';
import 'package:video_player/video_player.dart';

class Camera2 extends StatefulWidget {
  const Camera2({super.key, this.title, this.id, this.id2});

  final String? title;
  final int? id;
  final int? id2;
  @override
  State<Camera2> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Camera2> {
  List<XFile>? _mediaFileList;

  void _setImageFileListFromFile(XFile? value) {
    _mediaFileList = value == null ? null : <XFile>[value];
  }

  dynamic _pickImageError;
  bool isVideo = false;

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  final TextEditingController limitController = TextEditingController();
  var controllerPicker = Get.find<ImagePickerController>();
  Future<void> _onImageButtonPressed(
    ImageSource source, {
    required BuildContext context,
    bool isMultiImage = false,
    bool isMedia = false,
  }) async {
    if (_controller != null) {
      await _controller!.setVolume(0.0);
    }
    if (context.mounted) {
      if (isMedia) {
        try {
          final List<XFile> pickedFileList = <XFile>[];

          final XFile? media = await _picker.pickMedia(
            maxWidth: 1920.w,
            maxHeight: 1200.h,
            imageQuality: 100,
          );
          String? photoName = media?.path.split(Platform.pathSeparator).last;
          String? filePath = media?.path;

          controllerPicker.setImageFile(media?.path);
          controllerPicker.imageName(photoName);
          controllerPicker.update();
          if (media != null) {
            pickedFileList.add(media);
            setState(() {
              _mediaFileList = pickedFileList;
            });
            // Call uploadImage function after picking an image
            String url = await EditAPIController().uploadImage(File(media.path), photoName);
            controllerPicker.setUrl(url);
            controllerPicker.update();
          }
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      } else {
        try {
          final XFile? pickedFile = await _picker.pickImage(
            source: source,
            maxWidth: 1920.w,
            maxHeight: 1200.h,
            imageQuality: 100,
          );
          String? photoName = pickedFile?.path.split(Platform.pathSeparator).last;
          String? filePath = pickedFile?.path;
          controllerPicker.setImageFile(pickedFile?.path);
          controllerPicker.imageName(photoName);
          controllerPicker.update();
          controllerPicker.update();
          setState(() {
            _setImageFileListFromFile(pickedFile);
          });
          if (pickedFile != null) {
            String url = await EditAPIController().uploadImage(File(pickedFile.path), photoName);
            controllerPicker.setUrl(url);
          }
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      }
    }
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller!.setVolume(0.0);
      _controller!.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_mediaFileList != null) {
      return Semantics(
        label: 'image_picker_example_picked_images',
        child: ListView.builder(
          key: UniqueKey(),
          itemBuilder: (BuildContext context, int index) {
            final String? mime = lookupMimeType(_mediaFileList![index].path);

            // Why network for web?
            // See https://pub.dev/packages/image_picker_for_web#limitations-on-the-web-platform
            return Semantics(
              label: 'image_picker_example_picked_image',
              child: kIsWeb
                  ? Image.network(_mediaFileList![index].path)
                  : (mime == null || mime.startsWith('image/')
                      ? Image.file(
                          File(_mediaFileList![index].path),
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return const Center(child: Text('This image type is not supported'));
                          },
                        )
                      : _buildInlineVideoPlayer(index)),
            );
          },
          itemCount: _mediaFileList!.length,
        ),
      );
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _buildInlineVideoPlayer(int index) {
    final VideoPlayerController controller = VideoPlayerController.file(File(_mediaFileList![index].path));
    const double volume = kIsWeb ? 0.0 : 1.0;
    controller.setVolume(volume);
    controller.initialize();
    controller.setLooping(true);
    controller.play();
    return Center(child: AspectRatioVideo(controller));
  }

  Widget _handlePreview() {
    // if (isVideo) {
    //   return _previewVideo();
    // } else {
    return _previewImages();
    // }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      // if (response.type == RetrieveType.video) {
      //   isVideo = true;
      //   await _playVideo(response.file);
      // }
      if (response.type == RetrieveType.media) {
        isVideo = false;
        setState(() {
          if (response.files == null) {
            _setImageFileListFromFile(response.file);
          } else {
            _mediaFileList = response.files;
          }
        });
      }
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    // var controllerCam = Get.find<UpdateDocAPIController>();
    // var id = Get.arguments;

    return InkWell(
      onTap: () {
        showDialog(
            // barrierColor: Colors.transparent ,
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: SizedBox(
                  width: 500.w,
                  height: 300.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 450.w,
                        height: 100.h,
                        child: FloatingActionButton(
                          onPressed: () {
                            isVideo = false;
                            _onImageButtonPressed(
                              ImageSource.gallery,
                              context: context,
                              isMedia: true,
                            );
                          },
                          heroTag: 'media',
                          tooltip: 'Pick Single Media from gallery',
                          child: const Icon(Icons.photo_library),
                        ),
                      ),
                      if (_picker.supportsImageSource(ImageSource.camera))
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: SizedBox(
                            width: 450.w,
                            height: 100.h,
                            child: FloatingActionButton(
                              onPressed: () {
                                isVideo = false;
                                _onImageButtonPressed(ImageSource.camera, context: context);
                              },
                              heroTag: 'image2',
                              tooltip: 'Take a Photo',
                              child: const Icon(Icons.camera_alt),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            });
      },
      child: CircleAvatar(
        radius: 60.sp,
        backgroundColor: MyColors.primaryYellow,
        child: const Icon(
          Icons.edit,
          color: MyColors.primaryGreen,
        ),
      ),
    );
  }
  //     icon: const Icon(
  //       Icons.camera_alt,
  //       // color: MyColors.primaryBlue,
  //     ),
  //     onPressed: () {

  //     },
  //   );

  //   //  InkWell(
  //   //           onTap: () {

  //   //           },
  //   //           child: Container(
  //   //             width: 500.w,
  //   //             height: 400.h,
  //   //             decoration: BoxDecoration(
  //   //               borderRadius: BorderRadius.circular(20),
  //   //               border: Border.all(color: MyColors.disabledTxt),
  //   //             ),
  //   //             child: Icon(
  //   //               Icons.add_photo_alternate,
  //   //               color: MyColors.disabledTxt,
  //   //               size: 150.w,
  //   //             ),
  //   //           ),
  //   //         );
  // }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }
}

typedef OnPickImageCallback = void Function(double? maxWidth, double? maxHeight, int? quality, int? limit);

class AspectRatioVideo extends StatefulWidget {
  const AspectRatioVideo(this.controller, {super.key});

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return Container();
    }
  }
}
