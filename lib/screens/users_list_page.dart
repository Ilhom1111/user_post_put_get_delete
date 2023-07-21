import 'dart:async';
import 'dart:developer';

import 'package:ip_addres_app/views/users_list_page/appbor.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter/material.dart';
import 'package:ip_addres_app/core/apis.dart';
import 'package:ip_addres_app/services/networcin_service.dart';

import '../models/users_models.dart';
import 'complete_information.dart';
import 'user_post_page.dart';
import 'user_put_page.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  List<User> users = [];
  bool isData = false;
  bool isLoding = false;
  int exit = 0;

  @override
  void initState() {
    getAllUsers();
    super.initState();
  }

  void getAllUsers() async {
    setState(() {
      isLoding = true;
    });
    final data = await Networc.methodGet(api: Apis.users);
    users = Networc.parseUserList(data!);
    isData = true;
    setState(() {
      isLoding = false;
    });
  }

  void addUser() async {
    final msg = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const UserPastPage(),
    ));
    if (msg == "Hammasi Joyda") {
      getAllUsers();
    }
  }

  void userDelete(String id) async {
    await Networc.methodDelete(api: Apis.users, id: id);
    getAllUsers();
  }

  void putUser(List<User> list, int index) async {
    final msg = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserPutPage(list: users, index: index)));

    if (msg == "Hammasi Joyda") {
      getAllUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width, 56),
        child: const Appbar(title: "Users"),
      ),
      body: isData == true
          ? Stack(
              children: [
                WillPopScope(
                  onWillPop: () async {
                    Timer(const Duration(milliseconds: 600), () {
                      exit = 0;
                    });
                    exit++;
                    log(exit.toString());
                    if (exit == 2) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return InkWell(
                          overlayColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CompleteInformation(
                                    list: users, index: index),
                              ),
                            );
                          },
                          onLongPress: () {
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.confirm,
                              animType: QuickAlertAnimType.scale,
                              titleColor: Colors.amber,
                              confirmBtnColor: Colors.amber,
                              onConfirmBtnTap: () {
                                userDelete("/${users[index].id}");
                                Navigator.pop(context);
                              },
                              text: 'Do you want to delete ${user.userName}',
                              confirmBtnText: 'Yes',
                              cancelBtnText: 'No',
                              backgroundColor: Colors.white,
                              barrierDismissible: true,
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(color: Colors.amber),
                            ),
                            child: ListTile(
                              title: Text(
                                user.userName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                user.email,
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                                softWrap: false,
                                maxLines: 1,
                              ),
                              leading: CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.amber,
                                child: Center(
                                  child: Text(
                                    user.userName[0].toString(),
                                    style: const TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              trailing: IconButton(
                                splashRadius: 30,
                                onPressed: () {
                                  putUser(users, index);
                                },
                                icon: const Icon(
                                  Icons.post_add_rounded,
                                  size: 30,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (isLoding)
                  const Center(child: CircularProgressIndicator.adaptive()),
              ],
            )
          : const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          addUser();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
