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
  int _selectedEvent;
  int _selectedGroup;
  int _selectedPlace;
  int _selectedProduct;

  SubCategoriesProvider({categoryId}) {
    init(categoryId: categoryId);
  }

  init({categoryId}) async {
    _events = await Api.getEventsByCategoryId(categoryId);
    _groups = await Api.getGroups();
    _places = await Api.getPlaces();
    _products = await Api.getProducts();
  }

  List<Event> getEvents() {
    return _events;
  }

  Event getSelectedEvent() {
    return _events[_selectedEvent];
  }

  List<Group> getGroups() {
    return _groups;
  }

  Group getSelectedGroup() {
    return _groups[_selectedGroup];
  }

  List<Place> getPlaces() {
    return _places;
  }

  Place getSelectedPlace() {
    return _places[_selectedPlace];
  }

  List<Product> getProducts() {
    return _products;
  }

  Product getSelectedProduct() {
    return _products[_selectedProduct];
  }

  Future<void> addGroup(int groupId) async {
    Group group = await Api.getGroupById(groupId);
    _groups.add(group);
    notifyListeners();
  }
}
