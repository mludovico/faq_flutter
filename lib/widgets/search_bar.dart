
import 'package:faq_flutter/bloc/questions_bloc.dart';
import 'package:faq_flutter/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  final _bloc = QuestionBloc.getInstance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DEEP_BLUE,
      height: 35,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      padding: EdgeInsets.only(left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.search,
            size: 22,
            color: SEARCH_BAR_GRAY,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Procurar perguntas',
                  hintStyle: TextStyle(
                    color: SEARCH_BAR_GRAY,
                    fontSize: 13
                  ),
                  border: InputBorder.none
                ),
                maxLines: 1,
                textAlignVertical: TextAlignVertical.center,
                onChanged: _bloc.filterResults,
                style: TextStyle(
                  color: SEARCH_BAR_GRAY,
                  fontSize: 13
                ),
              ),
            ),
          ),
          VerticalDivider(
            color: SEARCH_BAR_GRAY.withAlpha(70),
            thickness: 2,
            width: 2,
            indent: 7,
            endIndent: 7,
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.clear_thick,
              size: 20,
              color: SEARCH_BAR_GRAY,
            ),
            onPressed: _bloc.deactivateSearchMode,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
