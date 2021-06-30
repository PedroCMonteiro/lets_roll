import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Group.dart';
import 'Event.dart';
import 'Product.dart';

class Api {
  static final String root = 'https://service-lets-roll.herokuapp.com/api';

  static Future<List<Group>> getGroups() async {
    List<Group> groups = [];
    String route = '${Api.root}/groups';
    var response = await _getFunction(route);
    final data = jsonDecode(response);
    print(response);
    for (Map e in data['data']) groups.add(Group.fromJson(e));

    return groups;
  }

  static Future<Group> getGroupById(int id) async {
    String route = '${Api.root}/groups?Id=${id.toString()}';
    var body = await _getFunction(route);

    final data = jsonDecode(body);
    print(body);

    return Group.fromJson(data['data']);
  }

  static Future<List<Event>> getEvents() async {
    List<Event> events = [];
    String route = '${Api.root}/events';
    var body = await _getFunction(route);
    final data = jsonDecode(body);
    print(body);
    for (Map g in data['data']) events.add(Event.fromJson(g));

    return events;
  }

  static Future<List<Event>> getEventsByCategoryId(int categoryId) async {
    List<Event> events = [];
    String route = '${Api.root}/events?categoryIdIn=${categoryId.toString()}';
    var body = await _getFunction(route);
    final data = jsonDecode(body);
    print(body);
    for (Map g in data['data']) events.add(Event.fromJson(g));

    return events;
  }

  static Future<List<Product>> getProducts() async {
    List<Product> products = [];
    String route = '${Api.root}/products';
    var body = await _getFunction(route);
    final data = jsonDecode(body);
    print(body);
    for (Map p in data['data']) products.add(Product.fromJson(p));

    return products;
  }

  static Future<List<Product>> getProductsCategoryId(int categoryId) async {
    List<Product> products = [];
    String route = '${Api.root}/products?categoryId=${categoryId.toString()}';
    var body = await _getFunction(route);
    final data = jsonDecode(body);
    print(body);
    for (Map p in data['data']) products.add(Product.fromJson(p));

    return products;
  }

  static Future<String> _getFunction(String route) async {
    final http.Response response = await http.get(Uri.parse(route));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return response.body;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load events');
    }
  }

  static Future<String> _postFunction(String route, String data) async {
    final http.Response response = await http.post(
      Uri.parse(route),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data,
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return response.body;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load events');
    }
  }
}
