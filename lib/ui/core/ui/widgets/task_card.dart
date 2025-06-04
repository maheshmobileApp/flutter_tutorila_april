import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.timings,
    required this.onPressed,
  });

  final String title;
  final String description;
  final String timings;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          const    SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                description,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            const  SizedBox(height: 10),
            const  Divider(color: Colors.grey, height: 2),
            const  SizedBox(height: 5),
              Row(
                children: [
                const  Icon(Icons.access_time, size: 16, color: Color(0xFF4B7BE5)),
                  const SizedBox(width: 5),
                  Text(
                    timings,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF363942),
                    ),
                  ),
                 const SizedBox(width: 100),
                  TextButton(
                    onPressed: onPressed,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF4B7BE5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "On Progress",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
