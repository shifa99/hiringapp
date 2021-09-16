import 'package:hiring_app/models/employer/emplyer_home_model.dart';
import 'package:hiring_app/shared/responsive_ui/device_information.dart';
import 'package:hiring_app/shared/style/style.dart';
import 'package:intl/intl.dart';

import '../components/colors.dart';
import '../components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultFormField({
  @required TextEditingController controller,
  @required FormFieldValidator<String> validator,
  VoidCallback onTap,
  @required TextInputType type,
  ValueChanged<String> onSubmit,
  ValueChanged<String> onChange,
  @required String hint,
  bool enabled = true,
  bool isPassword = false,
  String suffixText,
  Widget icon,
}) =>
    TextFormField(
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15, 6, 15, 6),
        enabled: enabled,
        hintText: hint,
        suffixText: suffixText,
        suffixIcon: icon,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderSide: BorderSide(
                //   color: Colors.white,
                //   style: BorderStyle.none
                ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );

Widget defaultFormField1({
  @required TextEditingController controller,
  @required FormFieldValidator<String> validator,
  VoidCallback onTap,
  @required TextInputType type,
  ValueChanged<String> onSubmit,
  ValueChanged<String> onChange,
  @required String label,
  String hint,
  Widget icon,
  bool enabled = true,
  bool isPassword = false,
}) =>
    TextFormField(
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 30, 5, 5),
        enabled: enabled,
        hintText: hint,
        suffixIcon: icon,
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );

Widget defaultButton({
  @required String text,
  @required VoidCallback onPressed,
  Color btnColor = Colors.blue,
  Color txtColor = Colors.white,
  bool isUpperCase = true,
  double radius = 5,
  var height = 45.0,
  var width = double.infinity,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
    ),
    child: MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: onPressed,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      color: btnColor,
      textColor: txtColor,
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    ),
  );
}

Widget borderButton(
    {@required Function onPressed,
    String text,
    double width = double.infinity,
    var fontSize = 18.00,
    double height = 45.0}) {
  return Container(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
        ),
        style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 1.0,
              color: Colors.blue,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ));
}

Widget borderButtonWithIcon({
  Widget socialLogo,
  @required Function onPressed,
  String text,
  double width = double.infinity,
  var txtColor = Colors.black,
  var borderColor = Colors.blue,
  double height = 40.0,
}) {
  return Container(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            socialLogo,
            Text(
              text,
              style: TextStyle(fontSize: 14, color: txtColor),
            ),
          ],
        ),
        style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 1.0,
              color: borderColor,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ));
}

Widget defaultTextButton({@required String text, Function onPressed}) {
  return TextButton(
    onPressed: () {
      onPressed();
    },
    child: Text(
      text,
      style: TextStyle(color: defaultColor),
    ),
  );
}

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateAndFinish(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );
}

Widget myDivider(context) {
  return Divider(
    color: defaultColor.withOpacity(0.5),
    indent: 10,
    thickness: 0.5,
    endIndent: 10,
  );
}

Widget buildCircularProgressIndicator() => Center(
      child: CircularProgressIndicator(),
    );

Widget defaultDrawerItem({
  @required String image,
  @required String text,
  @required GestureTapCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      children: [
        Image.asset(
          'assets/icons/$image',
          height: 50,
          width: 50,
          color: defaultColor,
        ),
        Text(
          text,
          style: TextStyle(color: defaultColor, fontSize: 20),
        ),
      ],
    ),
  );
}

BorderRadius buildBorderRadiusDrawer() {
  if (lang == 'en') {
    return BorderRadius.only(
      topRight: Radius.circular(25),
      bottomRight: Radius.circular(25),
    );
  } else {
    return BorderRadius.only(
      topLeft: Radius.circular(25),
      bottomLeft: Radius.circular(25),
    );
  }
}

AppBar defaultAppBar(BuildContext context, {String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: defaultColor, fontSize: 26
          // fontWeight: FontWeight.bold,
          ),
    ),
    centerTitle: true,
    backgroundColor: secondColor,
    elevation: 0.0,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: defaultColor,
      ),
      color: secondColor,
    ),
  );
}

AppBar defaultAppBar1(BuildContext context,
    {@required String title, Widget actionWidget}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        color: secondColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    backgroundColor: defaultColor,
    elevation: 0.0,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back_ios,
      ),
      color: secondColor,
    ),
    actions: [actionWidget],
    toolbarHeight: 75,
    shape: RoundedRectangleBorder(borderRadius: borderRadiusBottom()),
  );
}

BorderRadius borderRadiusTop({var radius = 12.0}) {
  return BorderRadius.only(
      topRight: Radius.circular(radius), topLeft: Radius.circular(radius));
}

BorderRadius borderRadiusBottom() {
  return BorderRadius.only(
      bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12));
}

BorderRadius borderRadiusAll() {
  return BorderRadius.all(Radius.circular(12));
}

Widget buildRowJobDetailsEmployer(BuildContext context,
    {String title, String job}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Text(
          title,
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        flex: 2,
        child: Text(
          job,
          style: TextStyle(
            color: defaultColor,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    ],
  );
}

Text buildHeadLine({String title}) {
  return Text(
    title,
    style: TextStyle(
        fontWeight: FontWeight.bold, color: defaultColor, fontSize: 16),
  );
}

Widget buildRowJobDetails(BuildContext context,
    {String title, String job, DeviceInformation deviceInfo}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Text(
          title,
          style: secondaryTextStyle(deviceInfo),
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        flex: 2,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(
            job,
            style: secondaryTextStyle(deviceInfo).copyWith(
              color: defaultColor,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    ],
  );
}

Container buildSkill({String text}) {
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: defaultColor.withOpacity(0.5))),
    child: Text(text),
  );
}

Container buildSkill1({String text}) {
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: defaultColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: defaultColor.withOpacity(0.5))),
    child: Text(text),
  );
}

SnackBar customSnackBar({String content}) {
  return SnackBar(
    backgroundColor: Colors.black,
    content: Text(
      content,
      style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
    ),
  );
}

Widget imageNetworkHandling(
    imageUrl, BuildContext context, DeviceInformation deviceInfo) {
  return Image.network(
    imageUrl,
    fit: BoxFit.cover,
    errorBuilder: (context, _, trace) => Center(
        child: Text(
      'NO Image Here',
      style: secondaryTextStyle(deviceInfo).copyWith(
        color: Colors.red,
      ),
    )),
  );
}

//build widget Jobs
Card buildWidgetAuthorJob(
    {@required BuildContext context,
    @required DeviceInformation deviceInfo,
    @required dynamic authorJob}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius:borderRadiusAll(),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: deviceInfo.screenHeight*0.14,
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
          height: deviceInfo.screenHeight*0.14,
              ),
              Container(
          height: deviceInfo.screenHeight*0.13,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: borderRadiusTop(),
                  border: Border.all(color: Colors.black38)),
              child: imageNetworkHandling(
                  '${authorJob.employer.image}', context, deviceInfo),
              width: double.infinity,
              ),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 3),
                  child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                            child: Text(authorJob.employer.companyName,style: secondaryTextStyle(deviceInfo),),
                            decoration: containerDecoration.copyWith(borderRadius: BorderRadius.circular(5)),
                          ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 2,top: 2),
                child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.7), borderRadius: BorderRadius.circular(3)),
                          child: Text(
                'NEW',
                style: secondaryTextStyle(deviceInfo).copyWith(color: secondColor),
                          ),
                        ),
              ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: borderRadiusBottom()),
                child: Icon(
                  Icons.circle,
                  color: authorJob.status == '1' ? Colors.green : Colors.red,
                  size: 15,
                ),
              ),
            ),
          ),



            ],
          )),
          SizedBox(height: 5,),
           Padding(
             padding: const EdgeInsets.only(left: 4),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisSize: MainAxisSize.min,
               children: [
                 Text(
                            '${authorJob.employer.title}',
                            style: secondaryTextStyle(deviceInfo),
                          ),
                         
                          Text(
                            '${DateFormat('yyyy-MM-dd').format(DateTime.parse(authorJob.meetingDate))}',
                            style: thirdTextStyle(deviceInfo),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                           Text(
                            '${authorJob.employer.website}',
                            style: thirdTextStyle(deviceInfo).copyWith(color: Colors.grey),
                          ),
               ],
             ),
           ),
        
      ],
    ),
  );
}

Center loadingProgress() {
  return Center(child: CircularProgressIndicator());
}

DropdownButtonFormField defaultDropdownButton(
    {@required String label,
    @required String value,
    @required Function onChanged,
    @required List<DropdownMenuItem<String>> items}) 
    {
  return DropdownButtonFormField<String>(
      value:value,
      onChanged: onChanged,
      hint: Text(label),
      items: items);
}