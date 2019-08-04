import 'package:flutter_provider/core/models/comment.dart';
import 'package:flutter_provider/core/services/api.dart';
import 'package:flutter_provider/core/viewmodels/base_model.dart';
import 'package:flutter_provider/locator.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();
  List<Comment> comments;
  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}