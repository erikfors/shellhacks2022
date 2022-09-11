import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../../Data/Models/user.dart';

class SingleEvent extends StatelessWidget {
  // list of events with details

  final String? title;
  List<User>? participants;
  final DateTime? eventTime;
  final int? zipCode;
  final User? owner;

  SingleEvent(
      {this.eventTime,
      this.owner,
      this.participants,
      this.title,
      this.zipCode});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: SizedBox(
          height: 350,
          child: Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1503435980610-a51f3ddfee50?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    child: Text(
                      participants!.length.toString(),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Card(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              eventTime!.day.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              getMonthName(eventTime!.month),
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  title: Text(
                    title!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    zipCode.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // get name of month from int
  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Invalid Month';
    }
  }
}
