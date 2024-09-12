import 'package:diseases_checker/models/user_model.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

// YOU - current user
final User currentUser =
    User(id: 0, name: 'Current User'.tr, imageUrl: 'images/greg.jpg');

// USERS
final User greg = User(id: 1, name: 'Dr:Greg', imageUrl: 'images/greg.jpg');
final User james = User(id: 2, name: 'Dr:James', imageUrl: 'images/james.jpg');
final User john = User(id: 3, name: 'Dr:John', imageUrl: 'images/john.jpg');
final User olivia =
    User(id: 4, name: 'Dr:Olivia', imageUrl: 'images/olivia.jpg');
final User sam = User(id: 5, name: 'Dr:Emma', imageUrl: 'images/sam.jpg');
final User sophia =
    User(id: 6, name: 'Dr:Sophia', imageUrl: 'images/sophia.jpg');
final User steven =
    User(id: 7, name: 'Dr:Steven', imageUrl: 'images/steven.jpg');

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text:
        'Of course, let\'s get those tests done as soon as possible. We want to make sure that we catch any potential issues early.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text:
        'Of course, let\'s get those tests done as soon as possible. We want to make sure that we catch any potential issues early.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Thank you, Doctor. I appreciate your help.',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text:
        'Okay, we need to take this seriously. I recommend that we do an ECG and a chest X-ray to see if there are any issues with your heart or lungs. We may also need to schedule you for a stress test. In the meantime, I suggest that you rest and avoid any strenuous activity.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'No, this is the first time.',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'I see. Have you experienced this before?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'I\'ve been having some chest pain and shortness of breath.',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text:
        'Of course, lets get those tests done as soon as possible. We want to make sure that we catch any potential issues early.',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Thank you, Doctor. I appreciate your help.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text:
        'Okay, we need to take this seriously. I recommend that we do an ECG and a chest X-ray to see if there are any issues with your heart or lungs. We may also need to schedule you for a stress test. In the meantime, I suggest that you rest and avoid any strenuous activity.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '3:15 PM',
    text: ' No, this is the first time.',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:30 PM',
    text: 'I see. Have you experienced this before?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:00 PM',
    text: ' I\'ve been having some chest pain and shortness of breath.',
    isLiked: false,
    unread: true,
  ),
];
