import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/api/models/api_model.dart';
import 'package:movies_app/screens/details_screen.dart';
import 'package:movies_app/screens/more_movies_screen.dart';
import '../api/api_settings.dart';

class MoviesScreenList extends StatefulWidget {
  MoviesScreenList({
    super.key,
    required this.title,
    required this.future,
    required this.onTap,
  });

  String title;
  Future<List<dynamic>> future;
  VoidCallback onTap;
  late ApiModel apiModel;

  @override
  State<MoviesScreenList> createState() => _MoviesScreenListState();
}

class _MoviesScreenListState extends State<MoviesScreenList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.cairo(
            color: const Color(0xff666666),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 17,
        ),
        Container(
          height: 300,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                    future: widget.future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            widget.apiModel = snapshot.data![index];
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsScreen(
                                                  apiModel:
                                                      snapshot.data![index],
                                                )));
                                  },
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 210,
                                            width: 140,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0xff000000),
                                                    spreadRadius: 0,
                                                    blurRadius: 10,
                                                    offset: Offset(0, 10),
                                                  )
                                                ]),
                                            child: Image.network(
                                                ApiSettings.imagePath +
                                                    snapshot.data![index]
                                                        .posterPath),
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xffF99F00),
                                                      Color(0xffDB3069),
                                                    ],
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        snapshot.data![index]
                                                            .voteAverage
                                                            .toInt()
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.cairo(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 18),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                '.',
                                                                style: GoogleFonts.cairo(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                              Text(
                                                                ((((snapshot.data![index].voteAverage * 100).toInt() %
                                                                                100) /
                                                                            10)
                                                                        .round())
                                                                    .toStringAsFixed(
                                                                        0),
                                                                style: GoogleFonts.cairo(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        10,
                                                                    height:
                                                                        1.5),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 140,
                                        child: Text(
                                          snapshot.data![index].title,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                          style: GoogleFonts.cairo(
                                            height: 1,
                                            color: const Color(0xff222222),
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text('No Data'),
                        );
                      }
                    }),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoreMovies(
                          apiModel: widget.apiModel,
                          title: widget.title,
                          future: widget.future,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFECB2F),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: 210,
                    width: 140,
                    child: Center(
                      child: Text(
                        'MORE',
                        style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
