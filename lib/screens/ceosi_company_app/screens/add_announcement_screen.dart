import 'dart:io';
import 'package:ceosi_app/constants/colors.dart';
import 'package:ceosi_app/screens/ceosi_company_app/widgets/addbutton_widget.dart';
import 'package:ceosi_app/screens/ceosi_company_app/widgets/addtextformfield_widget.dart';
import 'package:ceosi_app/screens/ceosi_company_app/widgets/dialog_widget.dart';
import 'package:ceosi_app/screens/ceosi_company_app/widgets/drawer_widget.dart';
import 'package:ceosi_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddAnnouncementscreen extends StatefulWidget {
  const AddAnnouncementscreen({super.key});

  @override
  State<AddAnnouncementscreen> createState() => _AddAnnouncementscreenState();
}

class _AddAnnouncementscreenState extends State<AddAnnouncementscreen> {
  final GlobalKey<FormState> _addAnnouncementFormKey = GlobalKey<FormState>();
  final _announcementController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final bool _isProcessing = false;
  File? _pickedImage;

  @override
  void dispose() {
    _announcementController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _pickDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2050));

    if (pickedDate != null) {
      String formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);

      setState(() {
        _dateController.text = formattedDate;
      });
    } else {
      return null;
    }
  }

  void _pickTimePicker() async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      DateTime parsedTime =
          DateFormat.jm().parse(parseTime(pickedTime).toString());

      String formattedTime = DateFormat('HH:mm a').format(parsedTime);

      setState(() {
        _timeController.text = formattedTime;
      });
    } else {
      return null;
    }
  }

  String parseTime(TimeOfDay pickedTime) => pickedTime.format(context);

  displayEmployeePhoto() {
    if (_pickedImage == null) {
      return const AssetImage('assets/images/image.png');
    } else {
      return FileImage(_pickedImage!);
    }
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => DialogWidget(
            imageFromGallery: handleImageFromGallery,
            imageFromCamera: handleImageFromCamera));
  }

  handleImageFromGallery() async {
    final XFile? pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
        Navigator.of(context).pop();
      });
    }
  }

  handleImageFromCamera() async {
    final XFile? pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 80);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: CustomColors.greyAccent,
      ),
      body: Form(
        key: _addAnnouncementFormKey,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  _showSelectionDialog(context);
                },
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Stack(children: [
                      Container(
                          height: 160,
                          width: 150,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: displayEmployeePhoto(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.add_photo_alternate,
                                  size: 35,
                                )
                              ]))
                    ]))),
            const SizedBox(
              height: 10,
            ),
            AddtextformfieldWidget(
              textFieldController: _announcementController,
              label: 'Announcement/Event Name',
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  child: AddtextformfieldWidget(
                    textFieldController: _dateController,
                    label: 'Date',
                    readOnly: true,
                    onTap: () {
                      _pickDatePicker();
                    },
                  ),
                ),
                Flexible(
                  child: AddtextformfieldWidget(
                    textFieldController: _timeController,
                    label: 'Time',
                    readOnly: true,
                    onTap: () {
                      _pickTimePicker();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            AddtextformfieldWidget(
              textFieldController: _locationController,
              label: 'Location',
            ),
            const SizedBox(
              height: 10,
            ),
            AddtextformfieldWidget(
              textFieldController: _descriptionController,
              label: 'Description',
            ),
            const SizedBox(
              height: 30,
            ),
            AddButtonWidget(
              borderRadius: 100,
              buttonHeight: 50,
              buttonWidth: 300,
              textWidget: const BoldTextWidget(
                  color: Colors.white, fontSize: 18, text: 'Post'),
              formKey: _addAnnouncementFormKey,
              isProcessing: _isProcessing,
              validated: () {
                if (_addAnnouncementFormKey.currentState!.validate()) {
                  print('Validated');
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}