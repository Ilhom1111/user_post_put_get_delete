import 'package:flutter/material.dart';
import 'package:ip_addres_app/services/networcin_service.dart';

import '../core/apis.dart';
import '../models/users_models.dart';
import '../views/users_list_page/appbor.dart';

// ignore: must_be_immutable
class UserPutPage extends StatefulWidget {
  List<User> list;
  int index;
  UserPutPage({super.key, required this.list, required this.index});

  @override
  State<UserPutPage> createState() => _UserPutPageState();
}

class _UserPutPageState extends State<UserPutPage> {
  final nameConttroler = TextEditingController();

  final emailConttroler = TextEditingController();

  final userNameConttroler = TextEditingController();

  final phoneNumberConttroler = TextEditingController();

  void changeUser() async {
    String name = nameConttroler.value.text.trim();
    String userName = userNameConttroler.value.text.trim();
    String email = emailConttroler.value.text.trim();
    String phoneNumber = phoneNumberConttroler.value.text.trim();

    if (name == "") {
      name = widget.list[widget.index].name;
    }
    if (userName == "") {
      userName = widget.list[widget.index].userName;
    }
    if (email == "") {
      email = widget.list[widget.index].email;
    }
    if (phoneNumber == "") {
      phoneNumber = widget.list[widget.index].phoneNumber;
    }

    final data = {
      "name": name,
      "userName": userName,
      "email": email,
      "phoneNumber": phoneNumber,
    };

    await Networc.methodPut(
      api: Apis.users,
      id: "/${widget.list[widget.index].id}",
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
        child: const Appbar(title: "Change information"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: TextField(
                controller: nameConttroler,
                decoration: InputDecoration(
                  labelText: "Name: ${widget.list[widget.index].name}",
                  filled: true,
                  fillColor: Colors.transparent,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
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
              child: TextField(
                controller: userNameConttroler,
                decoration: InputDecoration(
                  labelText: "User name: ${widget.list[widget.index].userName}",
                  filled: true,
                  fillColor: Colors.transparent,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
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
              child: TextField(
                controller: emailConttroler,
                decoration: InputDecoration(
                  labelText: "Email: ${widget.list[widget.index].email}",
                  filled: true,
                  fillColor: Colors.transparent,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
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
              child: TextField(
                controller: phoneNumberConttroler,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText:
                      "Phone number: ${widget.list[widget.index].phoneNumber}",
                  filled: true,
                  fillColor: Colors.transparent,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          changeUser();
        },
        child: const Icon(
          Icons.autorenew,
          size: 28,
        ),
      ),
    );
  }
}
