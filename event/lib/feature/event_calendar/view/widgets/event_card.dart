import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final VoidCallback onClick;

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
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    image: DecorationImage(
                        image: AssetImage('images/sample/sample_1.jpg'),
                        fit: BoxFit.fitHeight),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Konser Dokter Tompi Jazz',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
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
                          const Text(
                            'Jakarta, 20 Februari 2025',
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
