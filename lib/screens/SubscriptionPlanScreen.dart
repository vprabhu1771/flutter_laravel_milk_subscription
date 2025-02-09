import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_laravel_milk_subscription/screens/ProductScreen.dart';
import 'package:http/http.dart' as http;

import '../models/SubscriptionPlan.dart';
import '../utils/Constants.dart';

class SubscriptionPlanScreen extends StatefulWidget {

  final String title;

  const SubscriptionPlanScreen({super.key ,required this.title});

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {

  // Initialize categories as an empty list
  late List<SubscriptionPlan> subscription_plan = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {

    try {

      final response = await http.get(Uri.parse(Constants.BASE_URL + Constants.SUBSCRIPTION_PLANS_ROUTE));

      if (response.statusCode == 200) {

        final List<dynamic> data = json.decode(response.body)['data'];

        setState(() {
          subscription_plan = data.map((row) => SubscriptionPlan.fromJson(row)).toList();
        });

      } else {

        throw Exception('Failed to load subscription plan ' + Constants.BASE_URL + Constants.SUBSCRIPTION_PLANS_ROUTE);

      }
    } catch (e) {
      print('Error: $e');
    }

  }

  Future<void> onRefresh() async {
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              fetchData();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: subscription_plan.isEmpty // Check if genres is empty before accessing its elements
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: subscription_plan.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(subscription_plan[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(title: 'Products',),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}