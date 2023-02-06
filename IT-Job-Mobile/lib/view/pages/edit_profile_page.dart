import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:it_job_mobile/constants/app_color.dart';
import 'package:it_job_mobile/constants/app_text_style.dart';
import 'package:it_job_mobile/widgets/button/button.dart';
import 'package:it_job_mobile/widgets/input/edit_field.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart';
import 'package:sizer/sizer.dart';

import '../../models/entity/user.dart';
import '../../widgets/appbar/appbar_widget.dart';
import '../../widgets/button/button_widget.dart';
import '../../widgets/dialog/dialog_date_picker.dart';
import '../../widgets/input/textfield_widget.dart';
import '../../widgets/profile/profile_widget.dart';
import '../profile/user_preferences.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;
  DateTime dateTime = DateTime.now();
  String dob = '01/01/2000';
  int sexIndex = 0;
  int sex = 0;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                isEdit: true,
                onClicked: () async {
                  final image =
                      await ImagePicker().getImage(source: ImageSource.gallery);

                  if (image == null) return;

                  final directory = await getApplicationDocumentsDirectory();
                  final name = basename(image.path);
                  final imageFile = File('${directory.path}/$name');
                  final newImage = await File(image.path).copy(imageFile.path);

                  setState(() => user = user.copy(imagePath: newImage.path));
                },
              ),
              Divider(
                color: AppColor.grey,
                height: 5.h,
              ),
              TextFieldWidget(
                label: 'Tên',
                text: user.name,
                onChanged: (name) => user = user.copy(name: name),
              ),
              SizedBox(
                height: 3.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            size: 25,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            'E-mail',
                            style: AppTextStyles.h3Black,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'sieutromkid@gmail.com',
                            style: AppTextStyles.h3Black,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Icon(
                            Iconsax.tick_circle,
                            color: AppColor.blue,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColor.grey,
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 3.h,
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Iconsax.call,
                            size: 25,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            'Điện thoại',
                            style: AppTextStyles.h3Black,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '+84 999999999',
                            style: AppTextStyles.h3Black,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Icon(
                            Iconsax.tick_circle,
                            color: AppColor.blue,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColor.grey,
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 3.h,
                  )
                ],
              ),
              EditField(
                onClicked: () => DialogDatePicker.showSheet(
                  context,
                  child: buildDatePicker(),
                  onClicked: () {
                    setState(() {
                      dob = DateFormat('dd/MM/yyyy').format(dateTime);
                      user = user.copy(dob: dob);
                    });
                    Navigator.pop(context);
                  },
                ),
                icon: Iconsax.calendar_1,
                hintText: 'Ngày sinh',
                text: user.dob,
              ),
              EditField(
                  onClicked: () => DialogDatePicker.showSheet(
                        context,
                        child: buildSexPicker(),
                        onClicked: () {
                          setState(() {
                            sex = sexIndex;
                            user = user.copy(gender: sex);
                          });
                          Navigator.pop(context);
                        },
                      ),
                  icon: Iconsax.man,
                  hintText: 'Giới tính',
                  text: ((() {
                    if (user.gender == 0) {
                      return 'Nam';
                    } else if (user.gender == 1) {
                      return 'Nữ';
                    }
                    return 'Khác';
                  })())),
              EditField(
                  onClicked: () {},
                  icon: Iconsax.location,
                  hintText: 'Địa chỉ',
                  text: 'Quận 9, TP. Hồ Chí Minh'),
              SizedBox(
                height: 3.h,
              ),
              ButtonDefault(
                width: 80.w,
                height: 7.h,
                content: 'Save',
                textStyle: AppTextStyles.h3White,
                backgroundBtn: AppColor.btnColor,
                voidCallBack: () async {
                  await UserPreferences.setUser(user);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );

  Widget buildDatePicker() => SizedBox(
        height: 30.h,
        child: CupertinoDatePicker(
          dateOrder: DatePickerDateOrder.dmy,
          minimumYear: 1970,
          maximumYear: DateTime.now().year,
          maximumDate: DateTime.now(),
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );

  List<Widget> sexList = [
    Text('Nam'),
    Text('Nữ'),
    Text('Khác'),
  ];

  Widget buildSexPicker() => SizedBox(
        height: 20.h,
        child: CupertinoPicker(
          children: sexList,
          onSelectedItemChanged: (value) {
            setState(() {
              sexIndex = value;
            });
          },
          scrollController: FixedExtentScrollController(
            initialItem: user.gender,
          ),
          itemExtent: 25,
          diameterRatio: 1,
          useMagnifier: true,
          magnification: 1.3,
        ),
      );
}
