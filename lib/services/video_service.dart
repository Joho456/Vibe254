import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VideoService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadVideo(String filePath, String videoName) async {
    try {
      File videoFile = File(filePath);
      // Upload video to Firebase Storage
      UploadTask uploadTask = _storage.ref('videos/$videoName').putFile(videoFile);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      // Save video metadata to Firestore
      await _firestore.collection('videos').add({
        'name': videoName,
        'url': downloadUrl,
        'uploaded_at': Timestamp.now()
      });
      return downloadUrl;
    } catch (e) {
      print('Error uploading video: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> retrieveVideos() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('videos').get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error retrieving videos: $e');
      return [];
    }
  }
}
