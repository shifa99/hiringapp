import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/employer_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/states.dart';
import 'package:intl/intl.dart';
import 'package:hiring_app/modules/services/extentions/get_time_splited.dart';
import 'package:hiring_app/modules/services/extentions/time_of_day_extention.dart';

class CreateJobScreen extends StatefulWidget {
  @override
  _CreateJobScreenState createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {
  var titleController = TextEditingController();
  var jobFieldController = TextEditingController();
  var descriptionController = TextEditingController();
  var salaryController = TextEditingController();
  var genderController = TextEditingController();
  var experienceController = TextEditingController();
  var qualificationsController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var timeToController = TextEditingController();

  var nameEnterviewerController = TextEditingController();
  var roleEnterviwerController = TextEditingController();
  var meetingtimeController = TextEditingController();
  String genderSelect;
  String genderSelected;
  String selectBusiness;
  String selectedBusiness;
  String meetingTo;
  TimeOfDay timeMeeting;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppEmployerCubit, AppEmployerStates>(
      listener: (context, state) {
        if (state is ErrorCreateJobState)
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text('Error Happen When you Uploading New Job')));
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildHeadLine(title: 'About job Title'),
                  SizedBox(height: 10),
                  defaultFormField1(
                    controller: titleController,
                    validator: (title) {
                      if (title.isEmpty) return 'Please Enter title';
                      return null;
                    },
                    type: TextInputType.text,
                    label: 'Job title',
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: ListTile(
                      title: Text('Business'),
                      trailing: new DropdownButton<String>(
                          hint: Container(
                              width: MediaQuery.of(context).size.width * 0.28,
                              child: Text('choose')),
                          onChanged: (String changedValue) {
                            setState(() {
                              selectBusiness = changedValue;
                              switch (selectBusiness) {
                                case 'IT':
                                  selectedBusiness = '1';
                                  break;
                                case 'Medical':
                                  selectedBusiness = '2';
                                  break;
                              }
                            });
                          },
                          value: selectBusiness,
                          underline: Text(''),
                          items: <String>[
                            'IT',
                            'Medical',
                          ].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList()),
                    ),
                  ),
                  SizedBox(height: 10),
                  defaultFormField1(
                    controller: descriptionController,
                    validator: (description) {
                      if (description.isEmpty)
                        return 'Please Enter Description';
                      else if (description.length < 10)
                        return 'This Description is Short';
                      return null;
                    },
                    type: TextInputType.text,
                    label: 'Job description',
                  ),
                  SizedBox(height: 10),
                  defaultFormField1(
                    controller: salaryController,
                    validator: (salary) {
                      if (salary.isEmpty)
                        return 'Please Enter Salary';
                      else if (int.parse(salary) < 0)
                        return 'Please Enter valid Salary';
                      return null;
                    },
                    type: TextInputType.text,
                    label: 'Salary',
                  ),
                  SizedBox(height: 10),
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
                              width: MediaQuery.of(context).size.width * 0.28,
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
                  SizedBox(height: 10),
                  defaultFormField1(
                    controller: experienceController,
                    validator: (experience) {
                      if (experience.isEmpty) return 'Please Enter Experience';
                      return null;
                    },
                    type: TextInputType.text,
                    label: 'Experience',
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: DropdownButton(
                        value: 'Cs',
                        onChanged: (qualification) {},
                        items: [
                          DropdownMenuItem(
                            child: Text('Cs'),
                            value: 'Cs',
                          ),
                          DropdownMenuItem(
                            child: Text('CC'),
                            value: 'CC',
                          ),
                          DropdownMenuItem(
                            child: Text('CL'),
                            value: 'CL',
                          ),
                        ]),
                  ),
                  SizedBox(height: 10),
                  buildHeadLine(title: 'Date'),
                  SizedBox(height: 10),
                  defaultFormField1(
                    controller: dateController,
                    validator: (date) {
                      if (date.isEmpty) return 'Please Choose Date';
                      return null;
                    },
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 90)),
                      ).then((value) {
                        dateController.text =
                            DateFormat('yyyy-MM-dd').format(value);
                      });
                    },
                    type: TextInputType.datetime,
                    label: 'Date',
                    icon: Icon(Icons.date_range),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: defaultFormField1(
                            controller: timeController,
                            validator: (time) {
                              if (time.isEmpty) return 'Please Choose Time';
                              return null;
                            },
                            type: TextInputType.datetime,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                timeMeeting = value;
                                timeController.text = value.format(context);
                              });
                            },
                            label: 'Time From',
                            icon: Icon(Icons.watch_later_outlined)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: defaultFormField1(
                            controller: timeToController,
                            validator: (timeTo) {
                              if (timeTo.isEmpty)
                                return 'Please Choose End Time';
                              return null;
                            },
                            type: TextInputType.datetime,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                // timeMeeting = value;
                                timeToController.text = value.format(context);
                              });
                            },
                            label: 'Time To',
                            icon: Icon(Icons.watch_later_outlined)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  defaultFormField1(
                      controller: meetingtimeController,
                      validator: (meetingTime) {
                        print(meetingTime);
                        if (meetingTime.isEmpty)
                          return 'Please Enter Meeting Time';
                        else if (meetingTime is! int)
                          return 'Please Enter valid value';
                        return null;
                      },
                      type: TextInputType.number,
                      label: 'Meeting Time',
                      icon: Icon(Icons.timelapse_rounded)),
                  SizedBox(height: 10),
                  buildHeadLine(title: 'Interviewer'),
                  SizedBox(height: 10),
                  defaultFormField1(
                    controller: nameEnterviewerController,
                    validator: (nameInterviewer) {
                      if (nameInterviewer.isEmpty)
                        return 'Please Enter Interviewer name';
                      return null;
                    },
                    type: TextInputType.text,
                    label: 'Name',
                  ),
                  SizedBox(height: 10),
                  defaultFormField1(
                    controller: roleEnterviwerController,
                    validator: (value) {
                      if (value.isEmpty) return 'Please Enter role interviewer';
                      return null;
                    },
                    type: TextInputType.text,
                    label: 'Role',
                  ),
                  SizedBox(height: 30),
                  state is! LoadingCreateJobState
                      ? defaultButton(
                          text: 'PUBLISH',
                          onPressed: () async {
                            await AppEmployerCubit.get(context).createNewJob(
                                fieldJob: 1,
                                experience:
                                    int.parse(experienceController.text),
                                gender: int.parse(genderSelected),
                                interviewerName: nameEnterviewerController.text,
                                interviewerRole: roleEnterviwerController.text,
                                jobDetails: descriptionController.text,
                                meetingDate: dateController.text,
                                meetingTime:
                                    int.parse(meetingtimeController.text),
                                qualification: qualificationsController.text,
                                salary: int.parse(salaryController.text), //
                                titleJob: titleController.text,
                                numberOfApplicant: '12',
                                meetingFrom:
                                    getTimeSplited(timeController.text),
                                meetingTo:
                                    getTimeSplited(timeToController.text),
                                noteJob: 'hello');
                          })
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
