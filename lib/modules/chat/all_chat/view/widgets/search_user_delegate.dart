// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:jkb_sept/modules/auth/model/user_model.dart';
import 'package:jkb_sept/modules/chat/all_chat/view/widgets/search_user_list_builder.dart';
import 'package:jkb_sept/modules/chat/all_chat/view_model/all_chat_view_model.dart';

class SearchUserDelegate extends SearchDelegate<UserModel> {
  SearchUserDelegate({
    required this.viewModel,
  });

  final AllChatViewModel viewModel;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    viewModel.onSearchQueryChangeEvent(query);
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: const SearchUserListBuilder(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    viewModel.onSearchQueryChangeEvent(query);
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: const SearchUserListBuilder(),
    );
  }
}
