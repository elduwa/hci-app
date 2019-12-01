import 'dart:core';
import 'package:flutter/material.dart';
import 'package:hci_app/patients_page.dart';

/*
const artsAndCrafts = ['Knitting', 'Painting'];
const culture = [
  'Listening to music',
  'Listening to stories',
  'Visiting a museum'
];
const openAir = ['Going for a Walk', 'Zoo excursion'];
const exercise = ['Dancing', 'Gymnastics', 'Yoga'];

const groupedActivities = {
  'Arts and Crafts': artsAndCrafts,
  'Culture': culture,
  'Open Air': openAir,
  'Exercise': exercise,
};
 */

class Activity {
  final String name;
  final String description;
  Set<Patient> participants;

  Activity({
    this.name,
    this.description,
    this.participants,
  });
}

final List<Activity> allActivities = [
  Activity(
    name: 'Singing',
    description: 'Group Activity lead by a music instructor.',
    participants: patients.getRange(0, 2).toSet(),
  ),
  Activity(
    name: 'Story Telling',
    description: 'A nurse reads stories to a group of patients',
    participants: patients.getRange(2, 4).toSet(),
  ),
  Activity(
    name: 'Walking',
    description: 'A nurse goes on a walk with one patient.',
    participants: patients.getRange(4, 6).toSet(),
  ),
  Activity(
    name: 'Movies',
    description: 'Group activity: Watching a movie together.',
    participants: patients.getRange(6, 8).toSet(),
  ),
];
