import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/api/api_settings.dart';
import 'package:movies_app/api/models/api_model.dart';

class MoreMovies extends StatefulWidget {
  MoreMovies({
    Key? key,
    this.apiModel,
    required this.title,
    this.future,
  }) : super(key: key);
  final ApiModel? apiModel;
  String title;
  Future<List<dynamic>>? future;

  @override
  State<MoreMovies> createState() => _MoreMoviesState();
}

class _MoreMoviesState extends State<MoreMovies> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 55,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Back',
                  style: GoogleFonts.cairo(
                    color: const Color(0xff222222),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${widget.title} Movies',
              style: GoogleFonts.cairo(
                color: const Color(0xff666666),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            FutureBuilder(
                future: widget.future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return Expanded(
                      child: GridView.builder(
                          controller: scrollController,
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          itemCount: snapshot.data!.length + 1,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1 / 1.5,
                          ),
                          itemBuilder: (context, index) {
                            if (snapshot.data!.length == index) {
                              return LinearProgressIndicator(
                                backgroundColor: Colors.grey,
                                color: Colors.grey.shade300,
                              );
                            } else {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  ApiSettings.imagePath +
                                      snapshot.data![index].posterPath,
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                ),
                              );
                            }
                          }),
                    );
                  } else {
                    return const Center(
                      child: Text('No Data'),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
