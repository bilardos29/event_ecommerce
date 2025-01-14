import 'package:event/feature/event/model/event_model.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  EventCard({
    required this.item,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  EventModel item;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    image: DecorationImage(
                        image: AssetImage('images/sample/${item.banner}'),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        '${item.title}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.place,
                            size: 12,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          Text(
                            '${item.location}, ${item.dateStart}',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Quota : 100',
                        style: TextStyle(fontSize: 10),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(
                top: 5,
                right: 5,
                child: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 24,
                ))
          ],
        ),
      ),
    );
  }
}
