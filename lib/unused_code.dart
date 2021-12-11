

// from main.dart//
//this code is for authentication research//
// class AnoniaAppState extends State<AnoniaApp> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<FireBaseUser>(
//         stream: FirebaseAuth.instance.onAuthStateChanged,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             FirebaseUser user = snapshot.data;
//             if (user == null) {
//               return const LoginPage();
//             }
//             return const Homescreen();
//           } else {
//             return const RegisterPage();
//           }
//           }
//         );
//   }
// }

//-------------------- end of main.dart --------------//

//themedata.dart//

//this code is for reconfiguring the theme data for its parents.//



// import 'dart:ui';
// import 'package:flutter/material.dart';

// final Color background = const Color(0xFFfafafac);
// final Color sliverBackground = Color(0xFFfafafac);
// final Color menu1Color = Color(0xFFf9d263);
// final Color menu2Color = Color(0xFFf2603d);
// final Color menu3Color = Color(0xFF04abe6);
// final Color tabVarViewColor = Color(0xFFfdfdfd);
// final Color starColor = Color(0xFFfdc746);
// final Color subsTitleText = Color(0xFFc5c4ca);
// final Color loveColor = Color(0xFF00ace6);
// final Color audioBluishBackground = Color(0xFfdee7fa);
// final Color audioBlueBackground = Color(0xFfdee7fa);
// final Color audioGreyBackground = Color(0xFFf2f2f2);

// // For internal usage only. Use values from theme itself.

// /// See [ChatTheme.userAvatarNameColors]
// const colors = [
//   Color(0xffff6767),
//   Color(0xff66e0da),
//   Color(0xfff5a2d9),
//   Color(0xfff0c722),
//   Color(0xff6a85e5),
//   Color(0xfffd9a6f),
//   Color(0xff92db6e),
//   Color(0xff73b8e5),
//   Color(0xfffd7590),
//   Color(0xffc78ae5),
// ];

// /// Dark
// const dark = Color(0xff1f1c38);

// /// Error
// const error = Color(0xffff6767);

// /// N0
// const neutral0 = Color(0xff1d1c21);

// /// N2
// const neutral2 = Color(0xff9e9cab);

// /// N7
// const neutral7 = Color(0xffffffff);

// /// N7 with opacity
// const neutral7WithOpacity = Color(0x80ffffff);

// /// Primary
// const primary = Color(0xff6f61e8);

// /// Secondary
// const secondary = Color(0xfff5f5f7);

// /// Secondary dark
// const secondaryDark = Color(0xff2b2250);

// /// Base chat theme containing all required properties to make a theme.
// /// Extend this class if you want to create a custom theme.
// @immutable
// abstract class ChatTheme {
//   /// Creates a new chat theme based on provided colors and text styles.
//   const ChatTheme({
//     required this.attachmentButtonIcon,
//     required this.backgroundColor,
//     required this.dateDividerMargin,
//     required this.dateDividerTextStyle,
//     required this.deliveredIcon,
//     required this.documentIcon,
//     required this.emptyChatPlaceholderTextStyle,
//     required this.errorColor,
//     required this.errorIcon,
//     required this.inputBackgroundColor,
//     required this.inputBorderRadius,
//     required this.inputPadding,
//     required this.inputTextColor,
//     this.inputTextCursorColor,
//     required this.inputTextDecoration,
//     required this.inputTextStyle,
//     required this.messageBorderRadius,
//     required this.messageInsetsHorizontal,
//     required this.messageInsetsVertical,
//     required this.primaryColor,
//     required this.receivedEmojiMessageTextStyle,
//     required this.receivedMessageBodyTextStyle,
//     required this.receivedMessageCaptionTextStyle,
//     required this.receivedMessageDocumentIconColor,
//     required this.receivedMessageLinkDescriptionTextStyle,
//     required this.receivedMessageLinkTitleTextStyle,
//     required this.secondaryColor,
//     required this.seenIcon,
//     required this.sendButtonIcon,
//     required this.sendingIcon,
//     required this.sentEmojiMessageTextStyle,
//     required this.sentMessageBodyTextStyle,
//     required this.sentMessageCaptionTextStyle,
//     required this.sentMessageDocumentIconColor,
//     required this.sentMessageLinkDescriptionTextStyle,
//     required this.sentMessageLinkTitleTextStyle,
//     required this.statusIconPadding,
//     required this.userAvatarImageBackgroundColor,
//     required this.userAvatarNameColors,
//     required this.userAvatarTextStyle,
//     required this.userNameTextStyle,
//   });

//   /// Icon for select attachment button
//   final Widget? attachmentButtonIcon;

//   /// Used as a background color of a chat widget
//   final Color backgroundColor;

//   /// Margin around date dividers
//   final EdgeInsetsGeometry dateDividerMargin;

//   /// Text style of the date dividers
//   final TextStyle dateDividerTextStyle;

//   /// Icon for message's `delivered` status. For the best look use size of 16.
//   final Widget? deliveredIcon;

//   /// Icon inside file message
//   final Widget? documentIcon;

//   /// Text style of the empty chat placeholder
//   final TextStyle emptyChatPlaceholderTextStyle;

//   /// Color to indicate something bad happened (usually - shades of red)
//   final Color errorColor;

//   /// Icon for message's `error` status. For the best look use size of 16.
//   final Widget? errorIcon;

//   /// Color of the bottom bar where text field is
//   final Color inputBackgroundColor;

//   /// Top border radius of the bottom bar where text field is
//   final BorderRadius inputBorderRadius;

//   /// Insets of the bottom bar where text field is
//   final EdgeInsetsGeometry inputPadding;

//   /// Color of the text field's text and attachment/send buttons
//   final Color inputTextColor;

//   /// Color of the text field's cursor
//   final Color? inputTextCursorColor;

//   /// Decoration of the input text field
//   final InputDecoration inputTextDecoration;

//   /// Text style of the message input. To change the color use [inputTextColor].
//   final TextStyle inputTextStyle;

//   /// Border radius of message container
//   final double messageBorderRadius;

//   /// Horizontal message bubble insets
//   final double messageInsetsHorizontal;

//   /// Vertical message bubble insets
//   final double messageInsetsVertical;

//   /// Primary color of the chat used as a background of sent messages
//   /// and statuses
//   final Color primaryColor;

//   /// Text style used for displaying emojis on text messages
//   final TextStyle receivedEmojiMessageTextStyle;

//   /// Body text style used for displaying text on different types
//   /// of received messages
//   final TextStyle receivedMessageBodyTextStyle;

//   /// Caption text style used for displaying secondary info (e.g. file size)
//   /// on different types of received messages
//   final TextStyle receivedMessageCaptionTextStyle;

//   /// Color of the document icon on received messages. Has no effect when
//   /// [documentIcon] is used.
//   final Color receivedMessageDocumentIconColor;

//   /// Text style used for displaying link description on received messages
//   final TextStyle receivedMessageLinkDescriptionTextStyle;

//   /// Text style used for displaying link title on received messages
//   final TextStyle receivedMessageLinkTitleTextStyle;

//   /// Secondary color, used as a background of received messages
//   final Color secondaryColor;

//   /// Icon for message's `seen` status. For the best look use size of 16.
//   final Widget? seenIcon;

//   /// Icon for send button
//   final Widget? sendButtonIcon;

//   /// Icon for message's `sending` status. For the best look use size of 10.
//   final Widget? sendingIcon;

//   /// Text style used for displaying emojis on text messages
//   final TextStyle sentEmojiMessageTextStyle;

//   /// Body text style used for displaying text on different types
//   /// of sent messages
//   final TextStyle sentMessageBodyTextStyle;

//   /// Caption text style used for displaying secondary info (e.g. file size)
//   /// on different types of sent messages
//   final TextStyle sentMessageCaptionTextStyle;

//   /// Color of the document icon on sent messages. Has no effect when
//   /// [documentIcon] is used.
//   final Color sentMessageDocumentIconColor;

//   /// Text style used for displaying link description on sent messages
//   final TextStyle sentMessageLinkDescriptionTextStyle;

//   /// Text style used for displaying link title on sent messages
//   final TextStyle sentMessageLinkTitleTextStyle;

//   /// Padding around status icons
//   final EdgeInsetsGeometry statusIconPadding;

//   /// Color used as a background for user avatar if an image is provided.
//   /// Visible if the image has some transparent parts.
//   final Color userAvatarImageBackgroundColor;

//   /// Colors used as backgrounds for user avatars with no image and so,
//   /// corresponding user names.
//   /// Calculated based on a user ID, so unique across the whole app.
//   final List<Color> userAvatarNameColors;

//   /// Text style used for displaying initials on user avatar if no
//   /// image is provided
//   final TextStyle userAvatarTextStyle;

//   /// User names text style. Color will be overwritten with [userAvatarNameColors].
//   final TextStyle userNameTextStyle;
// }

// /// Default chat theme which extends [ChatTheme]
// @immutable
// class DefaultChatTheme extends ChatTheme {
  /// Creates a default chat theme. Use this constructor if you want to
  /// override only a couple of properties, otherwise create a new class
  /// which extends [ChatTheme]
//   const DefaultChatTheme({
//     Widget? attachmentButtonIcon,
//     Color backgroundColor = neutral7,
//     EdgeInsetsGeometry dateDividerMargin = const EdgeInsets.only(
//       bottom: 32,
//       top: 16,
//     ),
//     TextStyle dateDividerTextStyle = const TextStyle(
//       color: neutral2,
//       fontSize: 12,
//       fontWeight: FontWeight.w800,
//       height: 1.333,
//     ),
//     Widget? deliveredIcon,
//     Widget? documentIcon,
//     TextStyle emptyChatPlaceholderTextStyle = const TextStyle(
//       color: neutral2,
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       height: 1.5,
//     ),
//     Color errorColor = error,
//     Widget? errorIcon,
//     Color inputBackgroundColor = neutral0,
//     BorderRadius inputBorderRadius = const BorderRadius.vertical(
//       top: Radius.circular(20),
//     ),
//     EdgeInsetsGeometry inputPadding = EdgeInsets.zero,
//     Color inputTextColor = neutral7,
//     Color? inputTextCursorColor,
//     InputDecoration inputTextDecoration = const InputDecoration(
//       border: InputBorder.none,
//       contentPadding: EdgeInsets.zero,
//       isCollapsed: true,
//     ),
//     TextStyle inputTextStyle = const TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       height: 1.5,
//     ),
//     double messageBorderRadius = 20,
//     double messageInsetsHorizontal = 20,
//     double messageInsetsVertical = 16,
//     Color primaryColor = primary,
//     TextStyle receivedEmojiMessageTextStyle = const TextStyle(fontSize: 40),
//     TextStyle receivedMessageBodyTextStyle = const TextStyle(
//       color: neutral0,
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       height: 1.5,
//     ),
//     TextStyle receivedMessageCaptionTextStyle = const TextStyle(
//       color: neutral2,
//       fontSize: 12,
//       fontWeight: FontWeight.w500,
//       height: 1.333,
//     ),
//     Color receivedMessageDocumentIconColor = primary,
//     TextStyle receivedMessageLinkDescriptionTextStyle = const TextStyle(
//       color: neutral0,
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       height: 1.428,
//     ),
//     TextStyle receivedMessageLinkTitleTextStyle = const TextStyle(
//       color: neutral0,
//       fontSize: 16,
//       fontWeight: FontWeight.w800,
//       height: 1.375,
//     ),
//     Color secondaryColor = secondary,
//     Widget? seenIcon,
//     Widget? sendButtonIcon,
//     Widget? sendingIcon,
//     TextStyle sentEmojiMessageTextStyle = const TextStyle(fontSize: 40),
//     TextStyle sentMessageBodyTextStyle = const TextStyle(
//       color: neutral7,
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       height: 1.5,
//     ),
//     TextStyle sentMessageCaptionTextStyle = const TextStyle(
//       color: neutral7WithOpacity,
//       fontSize: 12,
//       fontWeight: FontWeight.w500,
//       height: 1.333,
//     ),
//     Color sentMessageDocumentIconColor = neutral7,
//     TextStyle sentMessageLinkDescriptionTextStyle = const TextStyle(
//       color: neutral7,
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       height: 1.428,
//     ),
//     TextStyle sentMessageLinkTitleTextStyle = const TextStyle(
//       color: neutral7,
//       fontSize: 16,
//       fontWeight: FontWeight.w800,
//       height: 1.375,
//     ),
//     EdgeInsetsGeometry statusIconPadding =
//         const EdgeInsets.symmetric(horizontal: 4),
//     Color userAvatarImageBackgroundColor = Colors.transparent,
//     List<Color> userAvatarNameColors = colors,
//     TextStyle userAvatarTextStyle = const TextStyle(
//       color: neutral7,
//       fontSize: 12,
//       fontWeight: FontWeight.w800,
//       height: 1.333,
//     ),
//     TextStyle userNameTextStyle = const TextStyle(
//       fontSize: 12,
//       fontWeight: FontWeight.w800,
//       height: 1.333,
//     ),
//   }) : super(
//           attachmentButtonIcon: attachmentButtonIcon,
//           backgroundColor: backgroundColor,
//           dateDividerMargin: dateDividerMargin,
//           dateDividerTextStyle: dateDividerTextStyle,
//           deliveredIcon: deliveredIcon,
//           documentIcon: documentIcon,
//           emptyChatPlaceholderTextStyle: emptyChatPlaceholderTextStyle,
//           errorColor: errorColor,
//           errorIcon: errorIcon,
//           inputBackgroundColor: inputBackgroundColor,
//           inputBorderRadius: inputBorderRadius,
//           inputPadding: inputPadding,
//           inputTextColor: inputTextColor,
//           inputTextCursorColor: inputTextCursorColor,
//           inputTextDecoration: inputTextDecoration,
//           inputTextStyle: inputTextStyle,
//           messageBorderRadius: messageBorderRadius,
//           messageInsetsHorizontal: messageInsetsHorizontal,
//           messageInsetsVertical: messageInsetsVertical,
//           primaryColor: primaryColor,
//           receivedEmojiMessageTextStyle: receivedEmojiMessageTextStyle,
//           receivedMessageBodyTextStyle: receivedMessageBodyTextStyle,
//           receivedMessageCaptionTextStyle: receivedMessageCaptionTextStyle,
//           receivedMessageDocumentIconColor: receivedMessageDocumentIconColor,
//           receivedMessageLinkDescriptionTextStyle:
//               receivedMessageLinkDescriptionTextStyle,
//           receivedMessageLinkTitleTextStyle: receivedMessageLinkTitleTextStyle,
//           secondaryColor: secondaryColor,
//           seenIcon: seenIcon,
//           sendButtonIcon: sendButtonIcon,
//           sendingIcon: sendingIcon,
//           sentEmojiMessageTextStyle: sentEmojiMessageTextStyle,
//           sentMessageBodyTextStyle: sentMessageBodyTextStyle,
//           sentMessageCaptionTextStyle: sentMessageCaptionTextStyle,
//           sentMessageDocumentIconColor: sentMessageDocumentIconColor,
//           sentMessageLinkDescriptionTextStyle:
//               sentMessageLinkDescriptionTextStyle,
//           sentMessageLinkTitleTextStyle: sentMessageLinkTitleTextStyle,
//           statusIconPadding: statusIconPadding,
//           userAvatarImageBackgroundColor: userAvatarImageBackgroundColor,
//           userAvatarNameColors: userAvatarNameColors,
//           userAvatarTextStyle: userAvatarTextStyle,
//           userNameTextStyle: userNameTextStyle,
//         );
// }

/// Dark chat theme which extends [ChatTheme]
// @immutable
// class DarkChatTheme extends ChatTheme {
  /// Creates a dark chat theme. Use this constructor if you want to
  /// override only a couple of properties, otherwise create a new class
  /// which extends [ChatTheme]
//   const DarkChatTheme({
//     Widget? attachmentButtonIcon,
//     Color backgroundColor = dark,
//     EdgeInsetsGeometry dateDividerMargin = const EdgeInsets.only(
//       bottom: 32,
//       top: 16,
//     ),
//     TextStyle dateDividerTextStyle = const TextStyle(
//       color: neutral7,
//       fontSize: 12,
//       fontWeight: FontWeight.w800,
//       height: 1.333,
//     ),
//     Widget? deliveredIcon,
//     Widget? documentIcon,
//     TextStyle emptyChatPlaceholderTextStyle = const TextStyle(
//       color: neutral2,
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       height: 1.5,
//     ),
//     Color errorColor = error,
//     Widget? errorIcon,
//     Color inputBackgroundColor = secondaryDark,
//     BorderRadius inputBorderRadius = const BorderRadius.vertical(
//       top: Radius.circular(20),
//     ),
//     EdgeInsetsGeometry inputPadding = EdgeInsets.zero,
//     Color inputTextColor = neutral7,
//     Color? inputTextCursorColor,
//     InputDecoration inputTextDecoration = const InputDecoration(
//       border: InputBorder.none,
//       contentPadding: EdgeInsets.zero,
//       isCollapsed: true,
//     ),
//     TextStyle inputTextStyle = const TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       height: 1.5,
//     ),
//     double messageBorderRadius = 20,
//     double messageInsetsHorizontal = 20,
//     double messageInsetsVertical = 16,
//     Color primaryColor = primary,
//     TextStyle receivedEmojiMessageTextStyle = const TextStyle(fontSize: 40),
//     TextStyle receivedMessageBodyTextStyle = const TextStyle(
//       color: neutral7,
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       height: 1.5,
//     ),
//     TextStyle receivedMessageCaptionTextStyle = const TextStyle(
//       color: neutral7WithOpacity,
//       fontSize: 12,
//       fontWeight: FontWeight.w500,
//       height: 1.333,
//     ),
//     Color receivedMessageDocumentIconColor = primary,
//     TextStyle receivedMessageLinkDescriptionTextStyle = const TextStyle(
//       color: neutral7,
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       height: 1.428,
//     ),
//     TextStyle receivedMessageLinkTitleTextStyle = const TextStyle(
//       color: neutral7,
//       fontSize: 16,
//       fontWeight: FontWeight.w800,
//       height: 1.375,
//     ),
//     Color secondaryColor = secondaryDark,
//     Widget? seenIcon,
//     Widget? sendButtonIcon,
//     Widget? sendingIcon,
//     TextStyle sentEmojiMessageTextStyle = const TextStyle(fontSize: 40),
//     TextStyle sentMessageBodyTextStyle = const TextStyle(
//       color: neutral7,
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       height: 1.5,
//     ),
//     TextStyle sentMessageCaptionTextStyle = const TextStyle(
//       color: neutral7WithOpacity,
//       fontSize: 12,
//       fontWeight: FontWeight.w500,
//       height: 1.333,
//     ),
//     Color sentMessageDocumentIconColor = neutral7,
//     TextStyle sentMessageLinkDescriptionTextStyle = const TextStyle(
//       color: neutral7,
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       height: 1.428,
//     ),
//     TextStyle sentMessageLinkTitleTextStyle = const TextStyle(
//       color: neutral7,
//       fontSize: 16,
//       fontWeight: FontWeight.w800,
//       height: 1.375,
//     ),
//     EdgeInsetsGeometry statusIconPadding =
//         const EdgeInsets.symmetric(horizontal: 4),
//     Color userAvatarImageBackgroundColor = Colors.transparent,
//     List<Color> userAvatarNameColors = colors,
//     TextStyle userAvatarTextStyle = const TextStyle(
//       color: neutral7,
//       fontSize: 12,
//       fontWeight: FontWeight.w800,
//       height: 1.333,
//     ),
//     TextStyle userNameTextStyle = const TextStyle(
//       fontSize: 12,
//       fontWeight: FontWeight.w800,
//       height: 1.333,
//     ),
//   }) : super(
//           attachmentButtonIcon: attachmentButtonIcon,
//           backgroundColor: backgroundColor,
//           dateDividerMargin: dateDividerMargin,
//           dateDividerTextStyle: dateDividerTextStyle,
//           deliveredIcon: deliveredIcon,
//           documentIcon: documentIcon,
//           emptyChatPlaceholderTextStyle: emptyChatPlaceholderTextStyle,
//           errorColor: errorColor,
//           errorIcon: errorIcon,
//           inputBackgroundColor: inputBackgroundColor,
//           inputBorderRadius: inputBorderRadius,
//           messageInsetsHorizontal: messageInsetsHorizontal,
//           messageInsetsVertical: messageInsetsVertical,
//           inputPadding: inputPadding,
//           inputTextColor: inputTextColor,
//           inputTextCursorColor: inputTextCursorColor,
//           inputTextDecoration: inputTextDecoration,
//           inputTextStyle: inputTextStyle,
//           messageBorderRadius: messageBorderRadius,
//           primaryColor: primaryColor,
//           receivedEmojiMessageTextStyle: receivedEmojiMessageTextStyle,
//           receivedMessageBodyTextStyle: receivedMessageBodyTextStyle,
//           receivedMessageCaptionTextStyle: receivedMessageCaptionTextStyle,
//           receivedMessageDocumentIconColor: receivedMessageDocumentIconColor,
//           receivedMessageLinkDescriptionTextStyle:
//               receivedMessageLinkDescriptionTextStyle,
//           receivedMessageLinkTitleTextStyle: receivedMessageLinkTitleTextStyle,
//           secondaryColor: secondaryColor,
//           seenIcon: seenIcon,
//           sendButtonIcon: sendButtonIcon,
//           sendingIcon: sendingIcon,
//           sentEmojiMessageTextStyle: sentEmojiMessageTextStyle,
//           sentMessageBodyTextStyle: sentMessageBodyTextStyle,
//           sentMessageCaptionTextStyle: sentMessageCaptionTextStyle,
//           sentMessageDocumentIconColor: sentMessageDocumentIconColor,
//           sentMessageLinkDescriptionTextStyle:
//               sentMessageLinkDescriptionTextStyle,
//           sentMessageLinkTitleTextStyle: sentMessageLinkTitleTextStyle,
//           statusIconPadding: statusIconPadding,
//           userAvatarImageBackgroundColor: userAvatarImageBackgroundColor,
//           userAvatarNameColors: userAvatarNameColors,
//           userAvatarTextStyle: userAvatarTextStyle,
//           userNameTextStyle: userNameTextStyle,
//         );
// }

//----------------end of themedata.dart contents-----------------------//

//---------------show_dialog.dart-------------------------------//
//this source code is to show a dialog pop up for its parent's actions//

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// showConfirmDialog(
//   BuildContext context,
//   String title,
//   String description,
//   String confirmBtnTxt,
//   String cancelBtnTxt,
//   Function onConfirmClicked,
// ) {
//   // set up the buttons
//   Widget cancelButton = TextButton(
//     child: Text(cancelBtnTxt),
//     onPressed: () {
//       Navigator.of(context).pop(); // dismiss dialog
//     },
//   );
//   Widget confirmButton = TextButton(
//     child: Text(confirmBtnTxt),
//     onPressed: () {
//       onConfirmClicked.call();
//       Navigator.of(context).pop(); // dismiss dialog
//     },
//   );
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text(title),
//     content: Text(description),
//     actions: [
//       cancelButton,
//       confirmButton,
//     ],
//   );
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

// showInfoDialog(BuildContext context, String title, String description, String confirmBtnTxt) {
//   // set up the buttons

//   Widget confirmButton = TextButton(
//     child: Text(confirmBtnTxt),
//     onPressed: () {
//       Navigator.of(context).pop(); // dismiss dialog
//     },
//   );
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text(title),
//     content: Text(description),
//     actions: [
//       confirmButton,
//     ],
//   );
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }


//-------------------------- end of show_dialog.dart-----------------//

//-----------------searchscreen.dart-------------------------//

// testing code//
// Container(
//         margin: const EdgeInsets.all(10.0),
//         ref https://daily-dev-tips.com/posts/flutter-scrollable-horizontal-avatar-list/
//         child: ListView.separated(
//           itemBuilder: (context, index) => const AvatarFormat(),
//           scrollDirection: Axis.horizontal,
//           itemCount: 16,
//           separatorBuilder: (BuildContext context, int index) {
//             return const SizedBox(
//               width: 10,
//             );
//           },
//         ),
//         if the implementation fail, put it here #12
        
//       ),

// builder: (context) {
//   return Scaffold(
//     appBar: AppBar(
//       // toolbarHeight: 65,
//       flexibleSpace: Container(
//         color: Colors.amber,
//         child: TextField(
//           textAlign: TextAlign.start,
//           controller: _searchController,
//           decoration: InputDecoration(
//               // contentPadding: const EdgeInsets.symmetric(
//               //     vertical: 10, horizontal: 10),
//               filled: true,
//               fillColor: Colors.amber[100],
//               prefixIcon: const Icon(Icons.search, color: Colors.amber),
//               // border: const OutlineInputBorder(
//               //   borderRadius: BorderRadius.all(
//               //     Radius.circular(5),
//               //   ),
//               // ),
//               hintStyle: const TextStyle(color: Colors.black38),
//               hintText: "Search"),
//         ),
//       ),
//     ),
//   );
// },

// if the implementation fails, back it up to its code #12
// child: Column(
//           children: [
//             const Text('Header Box'),
//             Row(
//               //TODO: Stylize circle avatar so it can be swiped horizontally.
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: const [
//                 ///reference: https://www.codegrepper.com/code-examples/whatever/how+to+add+space+between+circle+avatar+in+flutter
//                 CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   radius: 30,
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   radius: 30,
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   radius: 30,
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   radius: 30,
//                 ),
//                 CircleAvatar(),
//                 CircleAvatar(),
//                 CircleAvatar(),
//                 CircleAvatar(),
//               ],
//             ),
//           ],
//         ),

// ------------------------- end of searchscreen.dart's content--------//



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// export 'messaging.dart';

// class ChatMessage{
//   String messageText;
//   String imageURL;
//   String time;
//   ChatUsers({@required this.name,@required this.messageText,@required this.imageURL,@required this.time});
// }


// List<ChatUsers> chatUsers = [
//     ChatUsers(text: "Jane Russel", secondaryText: "Awesome Setup", image: "images/userImage1.jpeg", time: "Now"),
//     ChatUsers(text: "Glady's Murphy", secondaryText: "That's Great", image: "images/userImage2.jpeg", time: "Yesterday"),
//     ChatUsers(text: "Jorge Henry", secondaryText: "Hey where are you?", image: "images/userImage3.jpeg", time: "31 Mar"),
//     ChatUsers(text: "Philip Fox", secondaryText: "Busy! Call me in 20 mins", image: "images/userImage4.jpeg", time: "28 Mar"),
//     ChatUsers(text: "Debra Hawkins", secondaryText: "Thankyou, It's awesome", image: "images/userImage5.jpeg", time: "23 Mar"),
//     ChatUsers(text: "Jacob Pena", secondaryText: "will update you in evening", image: "images/userImage6.jpeg", time: "17 Mar"),
//     ChatUsers(text: "Andrey Jones", secondaryText: "Can you please share the file?", image: "images/userImage7.jpeg", time: "24 Feb"),
//     ChatUsers(text: "John Wick", secondaryText: "How are you?", image: "images/userImage8.jpeg", time: "18 Feb"),
// ];



  
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // export 'messaging.dart';

// // class ChatMessage{
// //   String name;
// //   String messageText;
// //   String imageURL;
// //   String time;
// //   ChatUsers({@required this.name,@required this.messageText,@required this.imageURL,@required this.time});
// // }


// // List<ChatUsers> chatUsers = [
// //     ChatUsers(text: "Jane Russel", secondaryText: "Awesome Setup", image: "images/userImage1.jpeg", time: "Now"),
// //     ChatUsers(text: "Glady's Murphy", secondaryText: "That's Great", image: "images/userImage2.jpeg", time: "Yesterday"),
// //     ChatUsers(text: "Jorge Henry", secondaryText: "Hey where are you?", image: "images/userImage3.jpeg", time: "31 Mar"),
// //     ChatUsers(text: "Philip Fox", secondaryText: "Busy! Call me in 20 mins", image: "images/userImage4.jpeg", time: "28 Mar"),
// //     ChatUsers(text: "Debra Hawkins", secondaryText: "Thankyou, It's awesome", image: "images/userImage5.jpeg", time: "23 Mar"),
// //     ChatUsers(text: "Jacob Pena", secondaryText: "will update you in evening", image: "images/userImage6.jpeg", time: "17 Mar"),
// //     ChatUsers(text: "Andrey Jones", secondaryText: "Can you please share the file?", image: "images/userImage7.jpeg", time: "24 Feb"),
// //     ChatUsers(text: "John Wick", secondaryText: "How are you?", image: "images/userImage8.jpeg", time: "18 Feb"),
// //   ];

//------------------------------person_data'slist.dart---------------//



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// export 'messaging.dart';

// class ChatMessage{
//   String messageText;
//   String imageURL;
//   String time;
//   ChatUsers({@required this.name,@required this.messageText,@required this.imageURL,@required this.time});
// }


// List<ChatUsers> chatUsers = [
//     ChatUsers(text: "Jane Russel", secondaryText: "Awesome Setup", image: "images/userImage1.jpeg", time: "Now"),
//     ChatUsers(text: "Glady's Murphy", secondaryText: "That's Great", image: "images/userImage2.jpeg", time: "Yesterday"),
//     ChatUsers(text: "Jorge Henry", secondaryText: "Hey where are you?", image: "images/userImage3.jpeg", time: "31 Mar"),
//     ChatUsers(text: "Philip Fox", secondaryText: "Busy! Call me in 20 mins", image: "images/userImage4.jpeg", time: "28 Mar"),
//     ChatUsers(text: "Debra Hawkins", secondaryText: "Thankyou, It's awesome", image: "images/userImage5.jpeg", time: "23 Mar"),
//     ChatUsers(text: "Jacob Pena", secondaryText: "will update you in evening", image: "images/userImage6.jpeg", time: "17 Mar"),
//     ChatUsers(text: "Andrey Jones", secondaryText: "Can you please share the file?", image: "images/userImage7.jpeg", time: "24 Feb"),
//     ChatUsers(text: "John Wick", secondaryText: "How are you?", image: "images/userImage8.jpeg", time: "18 Feb"),
// ];



  
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // export 'messaging.dart';

// // class ChatMessage{
// //   String name;
// //   String messageText;
// //   String imageURL;
// //   String time;
// //   ChatUsers({@required this.name,@required this.messageText,@required this.imageURL,@required this.time});
// // }


// // List<ChatUsers> chatUsers = [
// //     ChatUsers(text: "Jane Russel", secondaryText: "Awesome Setup", image: "images/userImage1.jpeg", time: "Now"),
// //     ChatUsers(text: "Glady's Murphy", secondaryText: "That's Great", image: "images/userImage2.jpeg", time: "Yesterday"),
// //     ChatUsers(text: "Jorge Henry", secondaryText: "Hey where are you?", image: "images/userImage3.jpeg", time: "31 Mar"),
// //     ChatUsers(text: "Philip Fox", secondaryText: "Busy! Call me in 20 mins", image: "images/userImage4.jpeg", time: "28 Mar"),
// //     ChatUsers(text: "Debra Hawkins", secondaryText: "Thankyou, It's awesome", image: "images/userImage5.jpeg", time: "23 Mar"),
// //     ChatUsers(text: "Jacob Pena", secondaryText: "will update you in evening", image: "images/userImage6.jpeg", time: "17 Mar"),
// //     ChatUsers(text: "Andrey Jones", secondaryText: "Can you please share the file?", image: "images/userImage7.jpeg", time: "24 Feb"),
// //     ChatUsers(text: "John Wick", secondaryText: "How are you?", image: "images/userImage8.jpeg", time: "18 Feb"),
// //   ];

//------------------------- end of person data list.dart---------------//

//-------------------listview_builder.dart---------------------------//
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BelajarListView(),
//     );
//   }
// }

// class BelajarListView extends StatelessWidget {
//   final List bulan = [
//     "Januari",
//     "Fabruari",
//     "Maret",
//     "April",
//     "Mei",
//     "Juni",
//     "Juli",
//     "Agustus",
//     "September",
//     "Oktober",
//     "November",
//     "Desember"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("belajarFlutter.com"),
//       ),
//       body: ListView.builder(
//         itemCount: bulan.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Text(bulan[index], style: TextStyle(fontSize: 30)),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// ----------------------- end of listview.dart ----------------------//

