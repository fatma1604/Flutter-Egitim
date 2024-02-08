import 'package:chat/componts/chat_page.dart';
import 'package:chat/componts/user_title.dart';
import 'package:chat/page/setings/setinspage.dart';
import 'package:chat/service/auth/auth_service.dart';
import 'package:chat/service/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Row(
            children: [
              IconButton(onPressed: logout, icon: const Icon(Icons.logout)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Setinspage()),
                    );
                  },
                  icon: Icon(Icons.settings))
            ],
          )
        ],
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatService.getUsersStream(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }
        print("User Data: ${snapshot.data}");
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTitle(
        text: userData["email"],
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                        receiverEmail: userData["email"],
                        receiverId: userData["uid"],
                      )));
        },
      );
    } else {
      return Container();
    }
  }
}
