import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:happydormapp/data/dormitory_response.dart';
import 'package:http/http.dart' as http;

class DormitoryProviders with ChangeNotifier {
  List<DormitoryMeals> _meals = [];
  List<DormitoryMeals> get orders => _meals;

  var isLoading = true;
  var service;

  Future<void> getMealList() async {
    try {
      List<String> mealsKey = [
        'morningNonBread',
        'morningBread',
        'lunch',
        'dinner'
      ];

      if (isLoading) {
        isLoading = false;
        service = await http.get('http://localhost:8000/');
      }

      if (service != null) {
        final meals = utf8.decode(service.bodyBytes);

        List decodeMeals = json.decode(meals);
        // print(test);
        final List<DormitoryMeals> loadedMealsItems = [];

        for (var i = 0; i < decodeMeals.length; i++) {
          loadedMealsItems.add(
            DormitoryMeals(
              decodeMeals[i][mealsKey[i]],
            ),
          );
        }
        isLoading = true;
        _meals = loadedMealsItems;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
