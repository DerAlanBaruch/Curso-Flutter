import 'package:flutter/material.dart';

import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BoxDecoration boxDecoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(0, 7), blurRadius: 10)
        ]);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          width: double.infinity,
          height: 400,
          decoration: boxDecoration,
          child: Stack(alignment: Alignment.bottomLeft, children: [
            _BackgroundImage(
              url: product.picture,
            ),
            _ProductDetails(name: product.name, id: product.id),
            Positioned(
                top: 0, right: 0, child: _PriceTag(price: product.price)),
            if (!product.available)
              const Positioned(top: 0, left: 0, child: _NotAvailable())
          ]),
          margin: const EdgeInsets.only(top: 20, bottom: 20)),
    );
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('No disponible',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
      width: 120,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final double price;
  const _PriceTag({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$$price',
              style: const TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
      width: 120,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String name;
  final String? id;
  const _ProductDetails({
    Key? key,
    required this.name,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const BoxDecoration boxDecoration = BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        decoration: boxDecoration,
        height: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              id ?? 'N/A',
              style: const TextStyle(fontSize: 15, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final String? url;
  const _BackgroundImage({
    Key? key,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: url == null
            ? const Image(
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                placeholder: const AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(url!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}