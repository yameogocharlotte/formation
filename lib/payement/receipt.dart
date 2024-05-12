// import 'dart:io';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:formation/payement/payement.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Receipt extends StatefulWidget {
//   final int price;
//   final String subject;
//   Receipt({super.key, required this.price, required this.subject});

//   @override
//   State<Receipt> createState() => _MyWidgetState();
//   // Inside your PayementScreen class
//  /* getUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String userId = prefs.getString('Id') ?? '';
//     if (userId.isNotEmpty) {
//       DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
//           .collection('utilisateurs')
//           .doc(userId)
//           .get();
//       print(userId);
//       if (docSnapshot.exists) {
//         return docSnapshot.data() as Map<String, dynamic>;
//       }
//     }
//     return null;
//   }*/

//   Future<void> generateReceipt(BuildContext context) async {
//     try {
//       // Create PDF document
//       final pdf = pw.Document();
//       Map<String, dynamic>? userData = await getUserData();
//       if (userData != null) {
//         String userFirstName = userData['firstName'];
//         String userLastName = userData['lastName'];
//         String userPhone = userData['whatsapp'];
//         // Add content to the PDF
//         pdf.addPage(
//           pw.Page(
//             build: (pw.Context context) {
//               return pw.Center(
//                 child: pw.Column(
//                   mainAxisAlignment: pw.MainAxisAlignment.start,
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text('Nom et prénom(s) : $userFirstName $userLastName',
//                         style: pw.TextStyle(fontSize: 20, fontBold: pw.Font())),
//                     pw.SizedBox(height: 12),
//                     pw.Text('Numéro de téléphone whatsapp : $userPhone',
//                         style: pw.TextStyle(fontSize: 20)),
//                     pw.SizedBox(height: 12),
//                     pw.Text('Montant payé : $price CFA',
//                         style: pw.TextStyle(fontSize: 20)),
//                     pw.SizedBox(height: 12),
//                     pw.Text('Formation : $subject',
//                         style: pw.TextStyle(fontSize: 20)),
//                     pw.SizedBox(height: 12),
//                     pw.Text(
//                         'Numéro de téléphone servi au paiement : ${phone.text}',
//                         style: pw.TextStyle(fontSize: 20)),
//                     pw.SizedBox(height: 12),
//                     pw.Text('Date : ${DateTime.now()}',
//                         style: pw.TextStyle(fontSize: 18)),
//                     // You can add more details to the receipt as needed
//                   ],
//                 ),
//               );
//             },
//           ),
//         );

//         // Save the PDF to a file
//         final directory = await getTemporaryDirectory();
//         var file = File('${directory.path}/receipt.pdf');
//         await file.writeAsBytes(await pdf.save());
//         print('File saved to: ${file.path}');

//         // Upload the PDF to Firebase Storage
//         final Reference storageReference = FirebaseStorage.instanceFor(
//                 bucket: "gs://formation-b730e.appspot.com")
//             .ref()
//             .child('recus')
//             .child('recu_$userFirstName$userLastName.pdf');
//         final UploadTask uploadTask = storageReference.putFile(file);
//         await uploadTask
//             .whenComplete(() => print('File uploaded to Firebase Storage'));

//         // Get the download URL of the uploaded PDF
//         final String downloadURL = await storageReference.getDownloadURL();

//         // Show dialog box with PDF preview
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text(
//                 'Recu de paiement',
//                 textAlign: TextAlign.center,
//                 style: boldLargeTextStyle,
//               ),
//               content: Container(
//                 width: double.maxFinite,
//                 height: 400,
//                 child: PDFView(
//                   filePath: file.path,
//                   enableSwipe: true,
//                   swipeHorizontal: true,
//                   autoSpacing: false,
//                   pageSnap: true,
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     file.delete();
//                   },
//                   child: Text('Close'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     // Open the PDF file for download
//                     //OpenFile.open(file.path);
//                     //   downloadFile(downloadURL, 'recu_paiement.pdf');
//                   },
//                   child: Text('Download'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     } catch (e) {
//       print('Error generating receipt: $e');
//       // Handle error while generating receipt
//     }
//   }

//   /*Future<void> downloadFile(String fileUrl, String fileName) async {
//     try {
//       // Get the external storage directory
//       final directory = await DownloadsPathProvider.downloadsDirectory;
//       if (directory != null) {
//         final downloadDir = '${directory.path}/Download';

//         // Ensure the Download folder exists
//         final dir = Directory(downloadDir);
//         if (!await dir.exists()) {
//           await dir.create(recursive: true);
//         }

//         // Start the download task
//         await FlutterDownloader.enqueue(
//           url: fileUrl,
//           savedDir: downloadDir,
//           fileName: fileName,
//           showNotification: true,
//           openFileFromNotification: true,
//         );

//         // Listen for download progress
//         FlutterDownloader.registerCallback((id, status, progress) {
//           // Handle download progress
//         });
//       } else {
//         print('Error: External storage directory not found.');
//       }
//     } catch (e) {
//       print('Error downloading file: $e');
//     }
//   }*/

//   Future<void> saveFileToDevice(String fileName, List<int> fileBytes) async {
//     try {
//       var directory = await getExternalStorageDirectory();
//       if (directory != null) {
//         File file = File('${directory.path}/$fileName');
//         await file.writeAsBytes(fileBytes);
//         print('File saved to: ${file.path}');
//       } else {
//         print('Error: External storage directory not found.');
//       }
//     } catch (e) {
//       print('Error saving file: $e');
//     }
//   }
// }

// class _MyWidgetState extends State<Receipt> {
//   final pdf = pw.Document();
//   Map<String, dynamic>? userData = await getUserData();
//   if (userData)
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
//   getUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String userId = prefs.getString('Id') ?? '';
//     if (userId.isNotEmpty) {
//       DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
//           .collection('utilisateurs')
//           .doc(userId)
//           .get();
//       print(userId);
//       if (docSnapshot.exists) {
//         return docSnapshot.data() as Map<String, dynamic>;
//       }
//     }
//     return null;
//   }
// }
