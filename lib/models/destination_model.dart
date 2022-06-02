import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imgUrl;
  final double rating;
  final int price;
  final String about;

  DestinationModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.imgUrl = '',
    this.rating = 0.0,
    this.price = 0,
    this.about = '',
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) => DestinationModel(
    id: id,
    name: json['name'],
    city: json['city'],
    imgUrl: json['imgUrl'],
    rating: json['rating'].toDouble(),
    price: json['price'],
    about: json['about'],
  );

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'city' : city,
    'imgUrl' : imgUrl,
    'rating' : rating,
    'price' : price,
    'about' : about,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, city, imgUrl, rating, price, about];
}