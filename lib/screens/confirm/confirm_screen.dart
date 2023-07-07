import 'package:binder_application/screens/auth/client/base_client.dart';
import 'package:flutter/material.dart';

class ConfirmProfileScreen extends StatefulWidget {
  final String userID;

  const ConfirmProfileScreen({Key? key, required this.userID})
      : super(key: key);

  @override
  State<ConfirmProfileScreen> createState() => _ConfirmProfileScreenState();
}

class _ConfirmProfileScreenState extends State<ConfirmProfileScreen> {
  final _dOBController = TextEditingController();
  final _genderController = TextEditingController();
  final _baseClient = AuthService();
  final _phoneNumbersController = TextEditingController();
  String? _eDoB, _eGender, _ePhoneNumber;
  late DateTime selectedDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDate = DateTime.now();
  }

  void _validateForm() async {
    setState(() {
      _eDoB = _dOBController.text.isEmpty ? "Vui lòng chọn ngày sinh" : null;
      _eGender =
          _genderController.text.isEmpty ? "Vui lòng chọn giới tính" : null;
      _ePhoneNumber = _phoneNumbersController.text.isEmpty
          ? "Vui lòng nhập số điện thoại"
          : null;
    });
    if (_eDoB == null && _eGender == null && _ePhoneNumber == null) {
      final phone = "+84 ${_phoneNumbersController.text.trim()}";
      await _baseClient.updateUserData(widget.userID,
          _genderController.text, _dOBController.text, phone);
      Navigator.pop(context, "render");
    }

  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dOBController.text = picked.toString().substring(0, 10);
      });
    }
  }

  void _showDialogGender() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Choose your gender'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      _genderController.text = "Male";
                    });
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Male",
                    style: TextStyle(color: Colors.purple),
                  )),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _genderController.text = "Female";
                    });
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Female",
                    style: TextStyle(color: Colors.purple),
                  )),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Confirm your\nprofile to use",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                const SizedBox(
                  height: 30,
                ),

                TextField(
                  readOnly: true,
                  onChanged: (value) {},
                  controller: _genderController,
                  decoration: InputDecoration(
                    errorText: _eGender,
                    hintText: "Gender",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Theme.of(context).hintColor.withOpacity(0.03),
                    filled: true,
                    prefixIconColor: Colors.grey,
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.transgender),
                      onPressed: _showDialogGender,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  readOnly: true,
                  onChanged: (value) {},
                  controller: _dOBController,
                  decoration: InputDecoration(
                    errorText: _eDoB,
                    hintText: "DoB",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Theme.of(context).hintColor.withOpacity(0.03),
                    filled: true,
                    prefixIconColor: Colors.grey,
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.calendar_month),
                      onPressed: _selectDate,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  onChanged: (value) {},
                  controller: _phoneNumbersController,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    errorText: _ePhoneNumber,
                    hintText: "Phone number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Theme.of(context).hintColor.withOpacity(0.03),
                    filled: true,
                    prefixIconColor: Colors.grey,
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onPressed: _validateForm,
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("Continue"),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
