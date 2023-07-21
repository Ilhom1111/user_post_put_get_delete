import 'package:flutter/material.dart';
import 'package:ip_addres_app/core/apis.dart';
import 'package:ip_addres_app/services/networcin_service.dart';

import '../views/users_list_page/appbor.dart';

class UserPastPage extends StatefulWidget {
  const UserPastPage({super.key});

  @override
  State<UserPastPage> createState() => _UserPastPageState();
}

class _UserPastPageState extends State<UserPastPage> {
  String isAWoman = "false";
  String isMale = "false";

  final nameConttroler = TextEditingController();
  final userNameConttroler = TextEditingController();
  final emailConttroler = TextEditingController();
  final passwordConttroler = TextEditingController();
  final phoneNumberConttroler = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode userNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();

  void addUser() async {
    String name = nameConttroler.value.text.trim();
    String userName = userNameConttroler.value.text.trim();
    String email = emailConttroler.value.text.trim();
    String password = passwordConttroler.value.text.trim();
    String phoneNumber = phoneNumberConttroler.value.text.trim();

    if (name.isEmpty ||
        userName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        phoneNumber.isEmpty) {
      return;
    }
    final data = {
      "name": name,
      "userName": userName,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "male": isMale
    };

    await Networc.methodPost(
      api: Apis.users,
      data: data,
    );

    // ignore: use_build_context_synchronously
    Navigator.pop(context, "Hammasi Joyda");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width, 56),
        child: const Appbar(title: "Add User"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextFormField(
                controller: nameConttroler,
                focusNode: nameFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(userNameFocusNode);
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Name",
                  filled: true,
                  fillColor: Colors.transparent,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextFormField(
                controller: userNameConttroler,
                focusNode: userNameFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(emailFocusNode);
                },
                decoration: const InputDecoration(
                  labelText: "User name",
                  filled: true,
                  fillColor: Colors.transparent,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextFormField(
                controller: emailConttroler,
                focusNode: emailFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(passwordFocusNode);
                },
                decoration: const InputDecoration(
                  labelText: "Email",
                  filled: true,
                  fillColor: Colors.transparent,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextFormField(
                controller: passwordConttroler,
                focusNode: passwordFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(phoneNumberFocusNode);
                },
                decoration: const InputDecoration(
                  labelText: "Password",
                  filled: true,
                  fillColor: Colors.transparent,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextFormField(
                controller: phoneNumberConttroler,
                keyboardType: TextInputType.phone,
                focusNode: phoneNumberFocusNode,
                decoration: const InputDecoration(
                  labelText: "Phone number",
                  filled: true,
                  fillColor: Colors.transparent,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    isAWoman = "false";
                    isMale = "true";
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 110,
                    height: 54,
                    decoration: BoxDecoration(
                        color: isMale == "true"
                            ? Colors.transparent
                            : Colors.amber,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.amber)),
                    child: const Text(
                      "Male",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {
                    isAWoman = "true";
                    isMale = "false";
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 110,
                    height: 54,
                    decoration: BoxDecoration(
                        color: isAWoman == "true"
                            ? Colors.transparent
                            : Colors.amber,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.amber)),
                    child: const Text(
                      "A woman",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addUser();
        },
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.add_task,
          size: 28,
        ),
      ),
    );
  }
}
