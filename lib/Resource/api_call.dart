import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quiz/Models/category.dart';
import 'package:quiz/Models/question.dart';

const String baseUrl = "https://opentdb.com/api.php";
Future<List<Question>> getQuestions(
    Category category, int total, String difficulty) async {
  String url = "$baseUrl?amount=$total&category=${category.id}";
  if (difficulty != null) {
    url = "$url&difficulty=$difficulty";
    print(url);
  }
  http.Response res = await http.get(url);
  List<Map<String, dynamic>> questions =
      List<Map<String, dynamic>>.from(json.decode(res.body)["results"]);
  print(res.body);
  return Question.fromData(questions);
}
