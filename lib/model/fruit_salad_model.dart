import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'fruit_salad_model.g.dart';

@HiveType(typeId: 0)
class FruitSalad {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final int price;
  @HiveField(3)
  final String productId;
  @HiveField(4)
  int quantity;
  @HiveField(5)
  final int color;
  @HiveField(6)
  List<String> categories;

  FruitSalad(
      {required this.productId,
      required this.color,
      required this.categories,
      required this.price,
      required this.name,
      required this.imageUrl,
      this.quantity = 1});

  static List<FruitSalad> samples = [
    FruitSalad(
        price: 2000,
        name: 'Quinoa fruit salad',
        imageUrl: 'fruit_salad1',
        categories: ['hottest', 'top'],
        color: getRandomColor(),
        productId: '001'),
    FruitSalad(
        price: 4000,
        name: 'Tropical fruit salad',
        imageUrl: 'fruit_salad2',
        categories: ['hottest', 'new', 'top'],
        color: getRandomColor(),
        productId: '002'),
    FruitSalad(
        price: 1500,
        name: 'Berry mango combo',
        imageUrl: 'fruit_salad3',
        categories: ['hottest', 'top', 'new'],
        color: getRandomColor(),
        productId: '003'),
    FruitSalad(
        price: 3000,
        name: 'Strawberry bash',
        imageUrl: 'fruit_salad4',
        categories: ['hottest', 'new'],
        color: getRandomColor(),
        productId: '004'),
    FruitSalad(
        price: 2500,
        name: 'Berry nuts combo',
        imageUrl: 'fruit_salad5',
        categories: ['hottest', 'top', 'new'],
        color: getRandomColor(),
        productId: '005'),
    FruitSalad(
        price: 2000,
        name: 'Assorted berry\'s',
        imageUrl: 'fruit_salad6',
        categories: ['top', 'new'],
        color: getRandomColor(),
        productId: '006'),
    FruitSalad(
        price: 3000,
        name: 'Chocolate fruit mix',
        imageUrl: 'fruit_salad7',
        categories: ['popular', 'new', 'top'],
        color: getRandomColor(),
        productId: '007'),
    FruitSalad(
        price: 2500,
        name: 'Banana berry\'s',
        imageUrl: 'fruit_salad8',
        categories: ['recommended', 'top'],
        color: getRandomColor(),
        productId: '008'),
    FruitSalad(
        price: 2000,
        name: 'Veggie fruit salad',
        imageUrl: 'fruit_salad9',
        categories: ['hottest', 'popular'],
        color: getRandomColor(),
        productId: '009'),
    FruitSalad(
        price: 2000,
        name: 'Special fruit mix',
        imageUrl: 'fruit_salad10',
        categories: ['top', 'new'],
        color: getRandomColor(),
        productId: '010'),
    FruitSalad(
        price: 2500,
        name: 'Kiwi coconut mix',
        imageUrl: 'fruit_salad11',
        categories: ['popular', 'top'],
        color: getRandomColor(),
        productId: '011'),
    FruitSalad(
        price: 2500,
        name: 'Banana delight',
        imageUrl: 'fruit_salad12',
        categories: ['new', 'top', 'popular'],
        color: getRandomColor(),
        productId: '012'),
    FruitSalad(
        price: 3500,
        name: 'Spring basket',
        imageUrl: 'fruit_salad13',
        categories: ['recommended', 'popular', 'new'],
        color: getRandomColor(),
        productId: '013'),
  ];
  static List<FruitSalad> recommended = samples
      .where(
        (element) => element.categories.contains('recommended'),
      )
      .toList();
  static List<FruitSalad> hottest = samples
      .where((element) => element.categories.contains('hottest'))
      .toList();
  static List<FruitSalad> top =
      samples.where((element) => element.categories.contains('top')).toList();
  static List<FruitSalad> popular = samples
      .where((element) => element.categories.contains('popular'))
      .toList();
  // ignore: non_constant_identifier_names
  static List<FruitSalad> New =
      samples.where((element) => element.categories.contains('new')).toList();
}

int getRandomColor() {
  List<int> _colors = [
    Colors.orange.shade100.value,
    Colors.red.shade100.value,
    Colors.yellowAccent.shade100.value,
    Colors.blue.shade100.value,
    Colors.green.shade100.value,
    Colors.grey.shade100.value,
    Colors.purple.shade100.value,
    Colors.cyan.shade100.value,
    Colors.pink.shade100.value,
    Colors.brown.shade100.value
  ];

  Random random = Random();

  return _colors[random.nextInt(_colors.length)];
}
