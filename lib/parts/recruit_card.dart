import 'package:duel_matching/icons/battle_icons.dart';
import 'package:duel_matching/parts/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecruitCard extends StatelessWidget {
  const RecruitCard(
      {Key? key,
      required this.title,
      required this.playTitle,
      this.format,
      required this.place,
      required this.point,
      required this.start,
      this.end,
      required this.reqruitNumber,
      required this.memberCount})
      : super(key: key);

  final String title;
  final String playTitle;
  final String? format;
  final String place;
  final String point;
  final DateTime start;
  final DateTime? end;
  final int reqruitNumber;
  final int memberCount;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getOverflowEllipsis(title, 18.0, 2, 400, const Color(0xff2a2a2a)),
          const SizedBox(height: 8.0),
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: IntrinsicColumnWidth(),
              2: FlexColumnWidth(),
            },
            children: [
              TableRow(children: [
                const Icon(
                  Battle.battleLogo,
                  size: 16.0,
                  color: Color(0xffff8e3c),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(playTitle),
                ),
                getOverflowEllipsis(format ?? '', null, 1, 10, null),
              ]),
              TableRow(children: [
                const Icon(
                  Icons.place,
                  size: 22.0,
                  color: Color(0xffff8e3c),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(place),
                ),
                getOverflowEllipsis(point, null, 1, 10, null),
              ])
            ],
          ),
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              2: FlexColumnWidth(),
            },
            children: [
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.access_time_filled,
                    size: 18.0,
                    color: Color(0xffff8e3c),
                  ),
                ),
                Text(
                    '${DateFormat('yyyy/M/d hh:mm').format(start)} ~ ${end != null ? DateFormat('M/d hh:mm').format(end!) : '未定'}'),
              ]),
              TableRow(children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.supervised_user_circle,
                    size: 22.0,
                    color: Color(0xffff8e3c),
                  ),
                ),
                Text('$memberCount/$reqruitNumber'),
              ])
            ],
          ),
        ],
      ),
    );
  }
}
