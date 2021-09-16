import 'dart:io';

// import 'package:audio_picker/audio_picker.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employee/accepted_job_screen.dart';
import 'package:hiring_app/modules/Employee/home/home_layout.dart';
import 'package:hiring_app/modules/register/cubit/cubit.dart';
import 'package:hiring_app/modules/register/cubit/states.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

class EmployeeJobDataScreen extends StatefulWidget {
  final fullName;
  final city;
  final country;
  final password;
  final email;

  const EmployeeJobDataScreen(
      {this.fullName, this.city, this.country, this.password, this.email});

  @override
  _EmployeeJobDataScreenState createState() => _EmployeeJobDataScreenState();
}

class _EmployeeJobDataScreenState extends State<EmployeeJobDataScreen> {
  String industryChoice;

  File cameraVideo;
  File videoFile;
  String fileVideoName;
  var dateController = TextEditingController();
  var industryController = TextEditingController();
  var titleController = TextEditingController();
  var qualificationController = TextEditingController();
  var universityController = TextEditingController(text: 'Ain Shams');
  var graduationYearController = TextEditingController();
  var studyFieldController = TextEditingController(text: 'Computer Science');
  var derivingLicenceController = TextEditingController(text: 'Yes');
  var skillsController = TextEditingController();
  var languagesController = TextEditingController();
  var expYearController = TextEditingController();
  ImagePicker picker = ImagePicker();
  FilePickerResult filePicker;
  File pdfFile;
  VideoPlayerController _videoPlayerController;
  VideoPlayerController _cameraVideoPlayerController;

  String _absolutePathOfAudio;
  AudioPlayer audioPlayer;
  String genderSelect;
  String genderSelected;

  String derivingLicenceSelect;
  int derivingLicenceSelected;

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _videoPlayerController.dispose();
  }

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Loading"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void dismissLoading() {
    Navigator.pop(context);
  }

  void openAudioPicker() async {
    // showLoading();
    //  var path = await AudioPicker.pickAudio();
    // dismissLoading();
    // setState(() {
    //   // _absolutePathOfAudio = path;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppRegisterCubit()..getCategory(),
      child: BlocConsumer<AppRegisterCubit, AppRegisterStates>(
        listener: (context, state) {
          if (state is RegisterEmployerSuccessState) {
            navigateAndFinish(context, HomeLayout());
          } else if (state is RegisterEmployerErrorState) {
            print('error');
          }
        },
        builder: (context, state) {
          var cubit = AppRegisterCubit.get(context);
          // var cat = (cubit.categoryModel.name);
          // for (int i = 0; i < cat.length??1; i++) {
          //   print('num $cat $i');
          // }
          // var ll = ['df', 'dfd'];
          // ll.forEach((element) {
          //   print(element);
          // });

          return Scaffold(
            appBar: defaultAppBar1(context,
                title: 'Title', actionWidget: Container()),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                cubit.chooseProfileImage();
                              },
                              child: CircleAvatar(
                                backgroundImage: cubit.profileFile == null
                                    ? AssetImage('assets/icons/add2.png')
                                    : FileImage(cubit.profileFile),
                                radius: 50,
                              ),
                            ),
                            Text(
                              widget.fullName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            Text(
                              '${widget.country}, ${widget.city}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          defaultFormField1(
                            controller: dateController,
                            validator: (birthDate) {
                              if (birthDate.isEmpty)
                                return 'Please Enter Your BirthDate';
                              return 'null';
                            },
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.parse('1950-01-01'),
                                lastDate: DateTime.now(),
                              ).then((value) {
                                dateController.text = value.toString();
                                dateController.text =
                                    DateFormat('dd-MM-yyyy').format(value);
                              });
                            },
                            type: TextInputType.datetime,
                            label: 'BirthDate',
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: defaultDropdownButton(
                                value: industryChoice,
                                label: 'Industry',
                                onChanged: (industry) {},
                                items: <String>[
                                  'IT',
                                  'Medical',
                                  'Engineering',
                                ].map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList()),
                          ),
                          const SizedBox(height: 10),
                          defaultFormField1(
                              controller: titleController,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Invalid Data';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.text,
                              label: 'Title'),
                          const SizedBox(height: 10),
                          defaultFormField1(
                              controller: qualificationController,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Invalid Data';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.text,
                              label: 'Qualification'),
                          const SizedBox(height: 10),
                          defaultDropdownButton(
                              value: 'Ain Shams',
                              label: 'University',
                              onChanged: (univeristy) {
                                universityController.text = univeristy;
                              },
                              items: <String>[
                                'Ain Shams',
                                'Cairo',
                                'Banha',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                          const SizedBox(height: 10),
                          defaultFormField1(
                              controller: graduationYearController,
                              validator: (val) {
                                if (val.isEmpty)
                                  return 'Please Enter Graduation Year';
                                return null;
                              },
                              type: TextInputType.number,
                              label: 'Graduation year'),
                          const SizedBox(height: 10),
                          defaultDropdownButton(
                              value: 'Computer Science',
                              label: 'Study Field',
                              onChanged: (studyField) {
                                universityController.text = studyField;
                              },
                              items: <String>[
                                'Computer Science',
                                'Enginnering',
                                'Arts',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                          const SizedBox(height: 10),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: defaultDropdownButton(
                                value: 'Yes',
                                label: 'Driving Licance',
                                onChanged: (changedValue) {
                                  setState(() {
                                    derivingLicenceSelect = changedValue;
                                    switch (derivingLicenceSelect) {
                                      case 'Yes':
                                        derivingLicenceSelected = 1;
                                        break;
                                      case 'No':
                                        derivingLicenceSelected = 0;
                                        break;
                                      default:
                                        derivingLicenceSelected = 0;
                                    }
                                    print('derivingLicenceSelect : ' +
                                        derivingLicenceSelect);
                                  });
                                },
                                items: <String>[
                                  'Yes',
                                  'No',
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList()),
                          ),
                          const SizedBox(height: 10),
                          defaultFormField1(
                              controller: expYearController,
                              validator: (val) {
                                if (val.isEmpty) return 'Invalid Data';
                                return null;
                              },
                              type: TextInputType.number,
                              label: 'Experience Year'),
                          const SizedBox(height: 10),
                          defaultFormField1(
                              controller: languagesController,
                              icon: TextButton(
                                  onPressed: () {}, child: Text('Add')),
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Invalid Data';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.text,
                              label: 'Languages'),
                          const SizedBox(height: 10),
                          defaultFormField1(
                              controller: skillsController,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'Invalid Data';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.text,
                              label: 'Skills'),
                          const SizedBox(height: 10),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: ListTile(
                              title: Text('Gender'),
                              trailing: new DropdownButton<String>(
                                  hint: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: Text('choose')),
                                  onChanged: (String changedValue) {
                                    setState(() {
                                      genderSelect = changedValue;
                                      switch (genderSelect) {
                                        case 'Male':
                                          genderSelected = '0';
                                          break;
                                        case 'Female':
                                          genderSelected = '1';
                                          break;
                                        default:
                                          genderSelected = '2';
                                      }
                                      print('genderSelected : ' + genderSelect);
                                    });
                                  },
                                  value: genderSelect,
                                  underline: Text(''),
                                  items: <String>[
                                    'Male',
                                    'Female',
                                  ].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList()),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 180,
                          child: TextButton(
                              onPressed: () async {
                                // cubit.chooseVideo();
                                final getVideo = await picker.pickVideo(
                                    source: ImageSource.gallery);
                                print(getVideo.path);
                                if (getVideo != null) {
                                  videoFile = File(getVideo.path);
                                  setState(() {
                                    _videoPlayerController =
                                        VideoPlayerController.file(videoFile)
                                          ..initialize().then((_) {
                                            // setState(() {
                                            //   _videoPlayerController.play();
                                            // });
                                          });
                                  });
                                  fileVideoName =
                                      videoFile.path.split('/').last;
                                  print('videoFile : $videoFile');
                                  print('fileVideoName : $fileVideoName');
                                } else
                                  print('No Video Selected ...');
                              },
                              child: videoFile == null
                                  ? Image.asset('assets/images/btn1.png')
                                  : Container(
                                      padding: EdgeInsets.only(left: 10),
                                      width: 180,
                                      height: 100,
                                      child:
                                          VideoPlayer(_videoPlayerController))),
                        ),
                        Container(
                          width: 180,
                          child: TextButton(
                            onPressed: () async {
                              openAudioPicker();
                            },
                            child: _absolutePathOfAudio == null
                                ? Image.asset('assets/images/btn2.png')
                                : Text(
                                    "Absolute path",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () async {
                          print('Pdf IS Prepare');
                          filePicker = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                          );
                          if (filePicker != null) {
                            pdfFile = File(filePicker.files.single.path);
                            print('Pdf');
                          } else {
                            // User canceled the picker
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.lightBlue)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.add),
                            Text(
                              'Add your cv',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ConditionalBuilder(
                        condition: state is! RegisterEmployerLoadingState,
                        fallback: (context) => buildCircularProgressIndicator(),
                        builder: (context) => defaultButton(
                            text: 'Done',
                            onPressed: () async {
                              print(
                                  'city :${widget.city} , ${genderSelected} ,${qualificationController.text} , ');
                              print(formKey.currentState.validate());
                              print(cubit.profileFile.path);
                              if (cubit.profileFile != null) {
                                print('Enter');
                                await cubit
                                    .registerEmployee(
                                  fullName: widget.fullName,
                                  email: widget.email,
                                  password: widget.password,
                                  confirmPassword: widget.password,
                                  country: widget.country,
                                  city: widget.city,
                                  title: titleController.text,
                                  gender: genderSelected,
                                  qualification: qualificationController.text,
                                  birth: dateController.text,
                                  deriving_licence: 1,
                                  graduation_year:
                                      graduationYearController.text,
                                  languages: languagesController.text,
                                  skills: skillsController.text,
                                  industry: '1',
                                  study_field: 'CS',
                                  university: 'Ain Shams',
                                  audio: null,
                                  cv: pdfFile.path,
                                  video: null,
                                )
                                    .then((value) 
                                 {
                                  if (value)
                                    return navigateTo(context, HomeLayout());
                                  else
                                    print('Error');
                                });
                              }
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
