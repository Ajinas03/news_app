import 'package:flutter/material.dart';
import 'package:news_app/config/utils.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/widgets/text_widget.dart';

class NewsCard extends StatelessWidget {
  final Article? item;
  const NewsCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: size.height / 2,
          width: size.width,
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: (item?.urlToImage?.isEmpty ?? true)
                          ? const Center(child: Icon(Icons.image))
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            item?.urlToImage ?? ""))),
                              ),
                            )),
                  TextWidget(
                    text: item?.title ?? "",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(text: item?.description ?? ""),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      onTap: () {
                        Utils().launchURL(item?.url ?? "");
                      },
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextWidget(
                              text: "Source",
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.web,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
