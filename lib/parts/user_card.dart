import 'package:duel_matching/parts/image.dart';
import 'package:flutter/material.dart';
import 'package:duel_matching/extension/string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {Key? key,
      this.avatar,
      this.adress,
      this.favorite,
      this.comment,
      required this.name})
      : super(key: key);

  final String? avatar;
  final String? adress;
  final String? favorite;
  final String? comment;
  final String name;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width * 0.4,
      child: Center(
        child: Column(
          children: [
            AvatarImage(
              avatar: avatar,
              radius: 50,
            ),
            ...adress.isNotNullAndNotEmpty ||
                    favorite.isNotNullAndNotEmpty ||
                    comment.isNotNullAndNotEmpty
                ? [
                    Visibility(
                      visible: adress.isNotNullAndNotEmpty,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_city_rounded,
                            color: Color(0xffff8e3c),
                            size: 15.0,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: _screenSize.width * 0.4),
                            child: Text(
                              adress ?? '',
                              style: const TextStyle(color: Colors.black54),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: favorite.isNotNullAndNotEmpty,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Color(0xffff8e3c),
                            size: 15.0,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: _screenSize.width * 0.4),
                            child: Text(
                              favorite ?? '',
                              style: const TextStyle(color: Colors.black54),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: comment.isNotNullAndNotEmpty,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.commentDots,
                            color: Color(0xffff8e3c),
                            size: 15.0,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: _screenSize.width * 0.4),
                            child: Text(
                              comment ?? '',
                              style: const TextStyle(color: Colors.black54),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                : [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.user,
                          color: Color(0xffff8e3c),
                          size: 15.0,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: _screenSize.width * 0.4),
                          child: Text(
                            name,
                            style: const TextStyle(color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ]
          ],
        ),
      ),
    );
  }
}
