import 'package:cloud_functions/cloud_functions.dart';
import 'package:duel_matching/freezed/notice/notice.dart';
import 'package:duel_matching/freezed/request/request.dart';
import 'package:duel_matching/parts/image.dart';
import 'package:duel_matching/viewmodel/subscriber_provider.dart';
import 'package:duel_matching/viewmodel/user_profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(
      {Key? key, required this.id, required this.notice, required this.nowTime})
      : super(key: key);
  final String id;
  final Notice notice;
  final DateTime nowTime;

  Widget selectCard() {
    switch (notice.type) {
      case 'newMessage':
        return NewMessageNotice(
            id: id,
            text: notice.text!,
            recId: notice.recId!,
            recName: notice.recName,
            recAvatar: notice.recAvatar,
            roomId: notice.roomId!,
            unReadCount: notice.unReadCount,
            updateAt: notice.updateAt!);
      case 'newGroupMessage':
        return NewGroupMessageNotice(
            id: id,
            text: notice.text!,
            recName: notice.recName,
            roomId: notice.roomId!,
            unReadCount: notice.unReadCount,
            updateAt: notice.updateAt!);
      default:
        return ErrorNotice(
          updateAt: notice.updateAt,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return selectCard();
  }
}

class NewMessageNotice extends StatelessWidget {
  const NewMessageNotice({
    Key? key,
    required this.id,
    required this.text,
    required this.recId,
    required this.recName,
    this.recAvatar,
    required this.roomId,
    required this.unReadCount,
    required this.updateAt,
  }) : super(key: key);

  final String id;
  final String text;
  final String recId;
  final String recName;
  final String? recAvatar;
  final String roomId;
  final int unReadCount;
  final DateTime updateAt;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push('/chatroom/$roomId'),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () => GoRouter.of(context).push('/user/$recId'),
              child: AvatarImage(avatar: recAvatar, radius: 25)),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (DateTime(
                      updateAt.year, updateAt.month, updateAt.day, 0, 0, 0) ==
                  DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 0, 0, 0))
                Text(
                  DateFormat('H:mm').format(updateAt),
                  style: const TextStyle(color: Colors.black54),
                )
              else
                Text(
                  DateFormat('M/d').format(updateAt),
                  style: const TextStyle(color: Colors.black54),
                ),
              Visibility(
                  visible: unReadCount > 0,
                  child: Chip(
                    label: Text(
                      unReadCount > 99 ? '99+' : unReadCount.toString(),
                      style: const TextStyle(fontSize: 15),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                    visualDensity:
                        const VisualDensity(horizontal: 0.0, vertical: -4),

                    // const
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class NewGroupMessageNotice extends StatelessWidget {
  const NewGroupMessageNotice({
    Key? key,
    required this.id,
    required this.text,
    required this.recName,
    required this.roomId,
    required this.unReadCount,
    required this.updateAt,
  }) : super(key: key);

  final String id;
  final String text;
  final String recName;
  final String roomId;
  final int unReadCount;
  final DateTime updateAt;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push('/group/$roomId'),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: Icon(
                    Icons.group,
                    size: 35.0,
                    color: Color(0xffff8e3c),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recName,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (DateTime(updateAt.year, updateAt.month, updateAt.day, 0,
                          0, 0) ==
                      DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day, 0, 0, 0))
                    Text(
                      DateFormat('H:mm').format(updateAt),
                      style: const TextStyle(color: Colors.black54),
                    )
                  else
                    Text(
                      DateFormat('M/d').format(updateAt),
                      style: const TextStyle(color: Colors.black54),
                    ),
                  Visibility(
                      visible: unReadCount > 0,
                      child: Chip(
                        label: Text(
                          unReadCount > 99 ? '99+' : unReadCount.toString(),
                          style: const TextStyle(fontSize: 15),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                        visualDensity:
                            const VisualDensity(horizontal: 0.0, vertical: -4),
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class ErrorNotice extends StatelessWidget {
  const ErrorNotice({Key? key, this.updateAt}) : super(key: key);

  final DateTime? updateAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
          width: 50,
          child: Center(
            child: Icon(
              Icons.error,
              size: 35.0,
              color: Color(0xffff8e3c),
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        const Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'バージョンが古い、またはエラーのためこの通知は表示できません',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Visibility(
            visible: updateAt != null,
            child: DateTime(updateAt!.year, updateAt!.month, updateAt!.day, 0,
                        0, 0) ==
                    DateTime(DateTime.now().year, DateTime.now().month,
                        DateTime.now().day, 0, 0, 0)
                ? Text(
                    DateFormat('H:mm').format(updateAt!),
                    style: const TextStyle(color: Colors.black54),
                  )
                : Text(
                    DateFormat('M/d').format(updateAt!),
                    style: const TextStyle(color: Colors.black54),
                  ))
      ],
    );
  }
}
