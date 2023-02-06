import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_color.dart';
import '../../constants/app_text_style.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Iconsax.user,
                    size: 25,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    widget.label,
                    style: AppTextStyles.h3Black,
                  ),
                ],
              ),
              SizedBox(
                width: 60.w,
                height: 3.1.h,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.h3Black,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  onChanged: widget.onChanged,
                ),
              ),
              SizedBox(
                width: 1.w,
              ),
              const Icon(
                Icons.edit,
                size: 20,
              ),
            ],
          ),
          Divider(
            color: AppColor.grey,
            height: 2.h,
          ),
        ],
      );
}
// import 'package:flutter/material.dart';

// class TextFieldWidget extends StatefulWidget {
//   final int maxLines;
//   final String label;
//   final String text;
//   final ValueChanged<String> onChanged;

//   const TextFieldWidget({
//     Key? key,
//     this.maxLines = 1,
//     required this.label,
//     required this.text,
//     required this.onChanged,
//   }) : super(key: key);

//   @override
//   _TextFieldWidgetState createState() => _TextFieldWidgetState();
// }

// class _TextFieldWidgetState extends State<TextFieldWidget> {
//   late final TextEditingController controller;

//   @override
//   void initState() {
//     super.initState();

//     controller = TextEditingController(text: widget.text);
//   }

//   @override
//   void dispose() {
//     controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             widget.label,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//           const SizedBox(height: 8),
//           TextField(
//             controller: controller,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             maxLines: widget.maxLines,
//             onChanged: widget.onChanged,
//           ),
//         ],
//       );
// }
