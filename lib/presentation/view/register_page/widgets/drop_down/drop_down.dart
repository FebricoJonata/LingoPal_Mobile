// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:lingo_pal_mobile/core/color/color_constraint.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 600.w,
//           margin: const EdgeInsets.all(10),
//           child: Center(
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton2<String>(
//                 isExpanded: true,
//                 hint: Text(
//                   "Choose Departement",
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                     fontFamily: "Poppins",
//                     color: MyColors.secondaryYellow,
//                   ),
//                 ),
//                 items: deptDropdownItems?.map((item) {
//                   final splitItem = item.split('_'); // Pisahkan ID dan LevelAlias
//                   id = splitItem[1];
//                   levelAlias = splitItem[0];
//                   return DropdownMenuItem(
//                     child: Text(levelAlias),
//                     value: id,
//                   );
//                 }).toList(),
//                 value: _getDept,
//                 onChanged: (value) {
//                   setState(() {
//                     _getStaff = null;
//                     _getDept = value;
//                     storage.write(key: "dept_code_new", value: _getDept);
//                     getStaff();
//                     widget.onChanged!(value!);
//                   });
//                 },
//                 buttonStyleData: ButtonStyleData(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     height: 80.h,
//                     width: 600.w,
//                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFE2E6EE))),
//                 dropdownStyleData: DropdownStyleData(
//                   maxHeight: 300.h,
//                 ),
//                 menuItemStyleData: MenuItemStyleData(
//                   height: 80.h,
//                 ),
//                 dropdownSearchData: DropdownSearchData(
//                   searchController: textEditingDeptController,
//                   searchInnerWidgetHeight: 50,
//                   searchInnerWidget: Container(
//                     height: 50,
//                     padding: const EdgeInsets.only(
//                       top: 8,
//                       bottom: 4,
//                       right: 8,
//                       left: 8,
//                     ),
//                     child: SizedBox(
//                       child: TextFormField(
//                         expands: true,
//                         maxLines: null,
//                         controller: textEditingDeptController,
//                         decoration: InputDecoration(
//                           fillColor: const Color(0xFFE2E6EE),
//                           filled: true,
//                           isDense: true,
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 8,
//                           ),
//                           hintText: 'Search for an item...',
//                           hintStyle: const TextStyle(fontSize: 12),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   searchMatchFn: (item, searchValue) {
//                     final String itemText = (item).child.toString();
//                     return itemText.toLowerCase().contains(searchValue.toLowerCase());
//                     // return item.value.toString().toLowerCase().contains(searchValue.toLowerCase());
//                   },
//                 ),
//                 onMenuStateChange: (isOpen) {
//                   if (!isOpen) {
//                     textEditingDeptController.clear();
//                   }
//                 },
//               ),
//             ),
//           ),
//         ),
//         Container(
//           width: 600.w,
//           margin: const EdgeInsets.all(10),
//           child: Center(
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton2<String>(
//                 isExpanded: true,
//                 hint: Text(
//                   "Choose Departement",
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                     fontFamily: "Poppins",
//                     color: MyColors.disabledTxt,
//                   ),
//                 ),
//                 items: staffDropdownItems?.map((item) {
//                   final splitItem = item.split('_'); // Pisahkan ID dan LevelAlias
//                   id = splitItem[1];
//                   levelAlias = splitItem[0];
//                   return DropdownMenuItem(
//                     child: Text(levelAlias),
//                     value: id,
//                   );
//                 }).toList(),
//                 value: _getStaff,
//                 onChanged: (value) {
//                   setState(() {
//                     _getStaff = value;
//                     storage.write(key: "staff_code_new", value: _getStaff);
//                     widget.onChanged2!(value!);
//                   });
//                 },
//                 buttonStyleData: ButtonStyleData(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     height: 80.h,
//                     width: 600.w,
//                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFE2E6EE))),
//                 dropdownStyleData: DropdownStyleData(
//                   maxHeight: 300.h,
//                 ),
//                 menuItemStyleData: MenuItemStyleData(
//                   height: 80.h,
//                 ),
//                 dropdownSearchData: DropdownSearchData(
//                   searchController: textEditingDeptController,
//                   searchInnerWidgetHeight: 50,
//                   searchInnerWidget: Container(
//                     height: 50,
//                     padding: const EdgeInsets.only(
//                       top: 8,
//                       bottom: 4,
//                       right: 8,
//                       left: 8,
//                     ),
//                     child: SizedBox(
//                       child: TextFormField(
//                         expands: true,
//                         maxLines: null,
//                         controller: textEditingDeptController,
//                         decoration: InputDecoration(
//                           fillColor: const Color(0xFFE2E6EE),
//                           filled: true,
//                           isDense: true,
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 8,
//                           ),
//                           hintText: 'Search for an item...',
//                           hintStyle: const TextStyle(fontSize: 12),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   searchMatchFn: (item, searchValue) {
//                     final String itemText = (item).child.toString();
//                     return itemText.toLowerCase().contains(searchValue.toLowerCase());
//                   },
//                 ),
//                 onMenuStateChange: (isOpen) {
//                   if (!isOpen) {
//                     textEditingDeptController.clear();
//                   }
//                 },
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
