import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/api/api_settings.dart';
import 'package:movies_app/api/models/api_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.apiModel,
  }) : super(key: key);

  final ApiModel apiModel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            SizedBox(
              height: 280,
              width: double.infinity,
              child: Image.network(
                ApiSettings.imagePath + widget.apiModel.backdropPath,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                const SizedBox(
                height: 54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Back',
                        style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset('images/Share_icon.svg'),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Row(
                children: [
                  Container(
                    height: 180,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(
                      ApiSettings.imagePath + widget.apiModel.posterPath,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    height: 182,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery
                          .sizeOf(context)
                          .width - 188,
                      child: Text(
                        widget.apiModel.title,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      '${widget.apiModel.voteCount} People Reviews',
                      style: GoogleFonts.cairo(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      widget.apiModel.releaseDate,
                      style: GoogleFonts.cairo(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                      Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.apiModel.voteAverage
                              .toInt()
                              .toString(),
                          style: GoogleFonts.cairo(
                              color: const Color(0xffD6182A),
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Text(
                                  '.',
                                  style: GoogleFonts.cairo(
                                      color: const Color(0xffD6182A),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                Text(
                                  ((((widget.apiModel.voteAverage * 100)
                                      .toInt() %
                                      100) /
                                      10)
                                      .round())
                                      .toStringAsFixed(0),
                                  style: GoogleFonts.cairo(
                                      color: const Color(0xffD6182A),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 15,),
                    Stack(
                      children: [
                        Container(
                          color: Colors.grey,
                        ),
                        RatingBar(
                          onRatingUpdate: (rating) {},
                          ignoreGestures: true,
                          initialRating: widget.apiModel.voteAverage.toInt()/2,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                          ratingWidget: RatingWidget(
                            full: SvgPicture.asset('images/Star.svg', height: 5, width: 5,),
                            half: SvgPicture.asset('images/Star.svg', height: 10, width: 10,),
                            empty: SvgPicture.asset('images/Star Copy 4.svg', height: 10, width: 10,),
                          ),

                         ),

                      ],
                    )

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          widget.apiModel.overview,
          style: GoogleFonts.cairo(
              fontSize: 20, color: const Color(0xff666666)),
        )
        ],
      ),
    )],
    )
    ,
    )
    ,
    );
  }
}
