import 'package:cloud_firestore/cloud_firestore.dart';

class Mesage {
  final String senderID;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Mesage({
    required this.senderID,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderID': this.senderID,
      'senderEmail': this.senderEmail,
      'receiverId': this.receiverId,
      'message': this.message,
      'timestamp': this.timestamp,
    };
  }
}
