import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//cards containing brief summary of the shows
class CustomCards extends StatefulWidget {
  CustomCards({
    super.key, 
    required this.heading, 
    required this.image, 
    required this.description, 
    required this.ontap, 
    this.isNetworkImage = false,
  });
  final String heading;
  final String image;
  final String description;
  final VoidCallback? ontap;
  final bool isNetworkImage;

  @override
  State<CustomCards> createState() => _CustomCardsState();
}

class _CustomCardsState extends State<CustomCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //ontap method
      onTap: widget.ontap,
      child: Card(
        elevation:10.0,
        child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //card heading 
              Text(widget.heading),
              AspectRatio(aspectRatio: 16/9,
              //card image
              child: widget.isNetworkImage
                    ? Image.network(
                        widget.image,
                        fit: BoxFit.fitHeight,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return Icon(Icons.error); 
                        })
                    : Image.asset(
                        widget.image,
                        fit: BoxFit.fitHeight,
                      ),
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //card description
                  Text(widget.description),
                  SizedBox(width: 30,),
                  IconButton(
                icon: Icon(Icons.bookmark_add_outlined), // Change the icon here
                onPressed: () {
                   // Handle bookmark/favorite action
                },
              ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}