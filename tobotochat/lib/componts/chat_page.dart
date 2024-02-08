import 'package:chat/componts/chat_bubbla.dart';
import 'package:chat/componts/my_textfild.dart';
import 'package:chat/service/auth/auth_service.dart';
import 'package:chat/service/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatelessWidget {
  final String receiverEmail;

  final String receiverId;

  ChatPage({Key? key, required this.receiverEmail, required this.receiverId})
      : super(key: key);

  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthService _autService = AuthService();
  void sendMessage() async {
    _chatService.sendMessage(
        receiverId, _messageController.text, _messageController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _autService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverId, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading...");
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text("No messages yet.");
        }

        // Mesajları oluşturmak için gerekli kodu ekleyin

        return ListView(
          children: (snapshot.data!.docs.map((doc) => _buildMessageItem(doc)))
              .toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderID'] == _autService.getCurrentUser()!.uid;

    var alignment =
        isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          ChatBubble(message: data["message"], isCurrentUser: isCurrentUser)
        ],
      ),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Row(
        children: [
          Expanded(
              child: MyTexfild(
                  text: "MESAJ",
                  obscurText: false,
                  controller: _messageController)),
          Container(
              decoration:
                  BoxDecoration(color: const Color.fromARGB(255, 32, 20, 49)),
              margin: EdgeInsets.only(right: 25),
              child: IconButton(
                  onPressed: sendMessage,
                  icon: Icon(
                    Icons.arrow_left_sharp,
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
