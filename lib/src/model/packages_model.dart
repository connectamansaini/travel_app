class Packages {
  final int id;
  final String image, title, description, location, price;
  final double rating;

  const Packages({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.location,
    required this.rating,
    required this.price,
  });
}

//List of packages
const List<Packages> packages = [
  Packages(
    id: 1,
    title: "Kuta Beach",
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim',
    image: "assets/images/kuta_beach.png",
    location: 'Goa, India',
    rating: 4.8,
    price: '20,000',
  ),
  Packages(
    id: 2,
    title: "Baga Beach",
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim',
    image: "assets/images/baga_beach.png",
    location: 'Goa, India',
    rating: 4.8,
    price: '15,000',
  ),
];
