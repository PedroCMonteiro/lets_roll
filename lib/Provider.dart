import 'dart:core';

import 'package:flutter/cupertino.dart';

import 'models/Api.dart';
import 'models/Event.dart';
import 'models/Group.dart';
import 'models/Place.dart';
import 'models/Product.dart';

class SubCategoriesProvider extends ChangeNotifier {
  int categoryId;
  List<Event> _events = [];
  List<Group> _groups = [];
  List<Place> _places = [];
  List<Product> _products = [];

  SubCategoriesProvider({categoryId}) {
    init(categoryId: categoryId);
  }
  init({categoryId}) async {
    _events = await Api.getEventsByCategoryId(categoryId);
    _groups = await Api.getGroups();
    _events = await Api.getEventsByCategoryId(categoryId);
    _events = await Api.getEventsByCategoryId(categoryId);
  }

  List<Event> getEvents() {
    return _events;
  }

  List<Group> getGroups() {
    return _groups;
  }

  List<Place> getPlaces() {
    return _places;
  }

  List<Product> getProducts() {
    return _products;
  }

  Future<void> addGroup(int groupId) async {
    Group group = await Api.getGroupById(groupId);
    _groups.add(group);
    notifyListeners();
  }
}
