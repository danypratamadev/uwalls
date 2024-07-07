import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uwalls/models/photo_model.dart';
import 'package:uwalls/shared/utils/stateid.dart';

class FirestoreController extends GetxController {

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  String userReferences = '-';

  int currentLastIndex = 10;

  List<PhotoModel> listSaved = <PhotoModel>[];
  List<PhotoModel> listLiked = <PhotoModel>[];

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 500), () => 
      getCurrentUser()
    );
  }

  void getCurrentUser() async {
    if(auth.currentUser != null) {
      final User user = auth.currentUser!;
      if(userReferences == '-'){
        userReferences = 'users/${user.uid}';
      }
      await getSavedPhotos();
      await getLikedPhotos();
    }
  }

  Future<void> getSavedPhotos() async {
    String savedReferences = '$userReferences/saved';
    await firestore.collection(savedReferences).orderBy('saved_at', descending: true).get().then((value) {
      if(value.docs.isNotEmpty){
        listSaved = List<PhotoModel>.from(value.docs.map((doc) => PhotoModel.fromJson(json: doc.data())));
      }
    });
    update([AppStateId.saved]);
  }

  bool checkSavedPhoto({required String id}) {
    List<PhotoModel> find = listSaved.where((photo) => photo.id == id).toList();
    return find.isNotEmpty ? true : false;
  }

  void addToSavedPhotos({required PhotoModel photo}) async {
    String savedReferences = '$userReferences/saved/${photo.id}';
    bool saved = checkSavedPhoto(id: photo.id);
    if(!saved){
      photo.saved = DateTime.now();
      await firestore.doc(savedReferences).set(photo.toJson()).then((value) {
        listSaved.insert(0,photo);
      });
    } else {
       await firestore.doc(savedReferences).delete().then((value) {
        listSaved.remove(photo);
       });
    }
    update([AppStateId.saved]);
  }

  Future<void> getLikedPhotos() async {
    String likedReferences = '$userReferences/liked';
    await firestore.collection(likedReferences).orderBy('liked_at', descending: true).get().then((value) {
      if(value.docs.isNotEmpty){
        listLiked = List<PhotoModel>.from(value.docs.map((doc) => PhotoModel.fromJson(json: doc.data())));
      }
    });
    update([AppStateId.liked]);
  }

  bool checkLikedPhoto({required String id}) {
    List<PhotoModel> find = listLiked.where((photo) => photo.id == id).toList();
    return find.isNotEmpty ? true : false;
  }

  void addToLikedPhotos({required PhotoModel photo}) async {
    String likedReferences = '$userReferences/liked/${photo.id}';
    photo.liked = DateTime.now();
    await firestore.doc(likedReferences).set(photo.toJson()).then((value) {
      listLiked.insert(0,photo);
    });
    update([AppStateId.liked]);
  }
  
}