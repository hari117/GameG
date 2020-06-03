import 'dart:convert';

ListOfGamesPage gameFromJson(String str) =>
    ListOfGamesPage.fromJson(json.decode(str));

String gameToJson(ListOfGamesPage data) => json.encode(data.toJson());

class ListOfGamesPage {
  int count;
  String next;
  String previous;
  List<Result> results;
  String seoTitle;
  String seoDescription;
  String seoKeywords;
  String seoH1;
  bool noindex;
  bool nofollow;
  String description;
  Filters filters;
  List<String> nofollowCollections;

  ListOfGamesPage({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.seoTitle,
    this.seoDescription,
    this.seoKeywords,
    this.seoH1,
    this.noindex,
    this.nofollow,
    this.description,
    this.filters,
    this.nofollowCollections,
  });

  factory ListOfGamesPage.fromJson(Map<String, dynamic> json) =>
      ListOfGamesPage(
//        count: json["count"],
//        next: json["next"],
//        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//        seoTitle: json["seo_title"],
//        seoDescription: json["seo_description"],
//        seoKeywords: json["seo_keywords"],
//        seoH1: json["seo_h1"],
//        noindex: json["noindex"],
//        nofollow: json["nofollow"],
//        description: json["description"],
//        filters: Filters.fromJson(json["filters"]),
//        nofollowCollections:
//            List<String>.from(json["nofollow_collections"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "seo_title": seoTitle,
        "seo_description": seoDescription,
        "seo_keywords": seoKeywords,
        "seo_h1": seoH1,
        "noindex": noindex,
        "nofollow": nofollow,
        "description": description,
        "filters": filters.toJson(),
        "nofollow_collections":
            List<dynamic>.from(nofollowCollections.map((x) => x)),
      };
}

class Filters {
  List<FiltersYear> years;

  Filters({
    this.years,
  });

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        years: List<FiltersYear>.from(
            json["years"].map((x) => FiltersYear.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "years": List<dynamic>.from(years.map((x) => x.toJson())),
      };
}

class FiltersYear {
  int from;
  int to;
  String filter;
  int decade;
  List<YearYear> years;
  bool nofollow;
  int count;

  FiltersYear({
    this.from,
    this.to,
    this.filter,
    this.decade,
    this.years,
    this.nofollow,
    this.count,
  });

  factory FiltersYear.fromJson(Map<String, dynamic> json) => FiltersYear(
        from: json["from"],
        to: json["to"],
        filter: json["filter"],
        decade: json["decade"],
        years:
            List<YearYear>.from(json["years"].map((x) => YearYear.fromJson(x))),
        nofollow: json["nofollow"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "filter": filter,
        "decade": decade,
        "years": List<dynamic>.from(years.map((x) => x.toJson())),
        "nofollow": nofollow,
        "count": count,
      };
}

class YearYear {
  int year;
  int count;
  bool nofollow;

  YearYear({
    this.year,
    this.count,
    this.nofollow,
  });

  factory YearYear.fromJson(Map<String, dynamic> json) => YearYear(
        year: json["year"],
        count: json["count"],
        nofollow: json["nofollow"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "count": count,
        "nofollow": nofollow,
      };
}

class Result {
  int id;
  String slug;
  String name;
  DateTime released;
  bool tba;
  String backgroundImage;
  double rating;
  int ratingTop;
  List<Rating> ratings;
  int ratingsCount;
  int reviewsTextCount;
  int added;
  AddedByStatus addedByStatus;
  int metacritic;
  int playtime;
  int suggestionsCount;
  dynamic userGame;
  int reviewsCount;
  Color saturatedColor;
  Color dominantColor;
  List<PlatformElement> platforms;
  List<ParentPlatform> parentPlatforms;
  List<Genre> genres;
  List<Store> stores;
  Clip clip;
  List<Genre> tags;
  List<ShortScreenshot> shortScreenshots;

  Result({
    this.id,
    this.slug,
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.metacritic,
    this.playtime,
    this.suggestionsCount,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.platforms,
    this.parentPlatforms,
    this.genres,
    this.stores,
    this.clip,
    this.tags,
    this.shortScreenshots,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    //  print("Parsing result of ${json["id"]}");
    return Result(
      id: json["id"],
//      slug: json["slug"],
      name: json["name"],
//      released: DateTime.parse(json["released"]),
//      tba: json["tba"],
      backgroundImage: json["background_image"],
//      rating: json["rating"].toDouble(),
//      ratingTop: json["rating_top"],
      ratings:
          List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
//      ratingsCount: json["ratings_count"],
//      reviewsTextCount: json["reviews_text_count"],
//      added: json["added"],
//      addedByStatus: AddedByStatus.fromJson(json["added_by_status"]),
//      metacritic: json["metacritic"],
//      playtime: json["playtime"],
//      suggestionsCount: json["suggestions_count"],
//      userGame: json["user_game"],
//      reviewsCount: json["reviews_count"],
//      saturatedColor: colorValues.map[json["saturated_color"]],
//      dominantColor: colorValues.map[json["dominant_color"]],
      platforms: List<PlatformElement>.from(
          json["platforms"].map((x) => PlatformElement.fromJson(x))),
      parentPlatforms: List<ParentPlatform>.from(
          json["parent_platforms"].map((x) => ParentPlatform.fromJson(x))),
      genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
      clip: Clip.fromJson(json["clip"]),
      tags: List<Genre>.from(json["tags"].map((x) => Genre.fromJson(x))),
      shortScreenshots: List<ShortScreenshot>.from(
          json["short_screenshots"].map((x) => ShortScreenshot.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "released":
            "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "added_by_status": addedByStatus.toJson(),
        "metacritic": metacritic,
        "playtime": playtime,
        "suggestions_count": suggestionsCount,
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": colorValues.reverse[saturatedColor],
        "dominant_color": colorValues.reverse[dominantColor],
        "platforms": List<dynamic>.from(platforms.map((x) => x.toJson())),
        "parent_platforms":
            List<dynamic>.from(parentPlatforms.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
        "clip": clip.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "short_screenshots":
            List<dynamic>.from(shortScreenshots.map((x) => x.toJson())),
      };
}

class AddedByStatus {
  int yet;
  int owned;
  int beaten;
  int toplay;
  int dropped;
  int playing;

  AddedByStatus({
    this.yet,
    this.owned,
    this.beaten,
    this.toplay,
    this.dropped,
    this.playing,
  });

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"],
        owned: json["owned"],
        beaten: json["beaten"],
        toplay: json["toplay"],
        dropped: json["dropped"],
        playing: json["playing"],
      );

  Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
        "playing": playing,
      };
}

class Clip {
  String clip;
  Clips clips;
  String video;
  String preview;

  Clip({
    this.clip,
    this.clips,
    this.video,
    this.preview,
  });

  factory Clip.fromJson(Map<String, dynamic> json) => Clip(
        clip: json["clip"],
        clips: Clips.fromJson(json["clips"]),
        video: json["video"],
        preview: json["preview"],
      );

  Map<String, dynamic> toJson() => {
        "clip": clip,
        "clips": clips.toJson(),
        "video": video,
        "preview": preview,
      };
}

class Clips {
  String the320;
  String the640;
  String full;

  Clips({
    this.the320,
    this.the640,
    this.full,
  });

  factory Clips.fromJson(Map<String, dynamic> json) => Clips(
        the320: json["320"],
        the640: json["640"],
        full: json["full"],
      );

  Map<String, dynamic> toJson() => {
        "320": the320,
        "640": the640,
        "full": full,
      };
}

enum Color { THE_0_F0_F0_F }

final colorValues = EnumValues({"0f0f0f": Color.THE_0_F0_F0_F});

class Genre {
  int id;
  String name;
  String slug;
  int gamesCount;
  String imageBackground;
  String domain;
  Language language;

  Genre({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        domain: json["domain"] == null ? null : json["domain"],
        language: json["language"] == null
            ? null
            : languageValues.map[json["language"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "domain": domain == null ? null : domain,
        "language": language == null ? null : languageValues.reverse[language],
      };
}

enum Language { ENG }

final languageValues = EnumValues({"eng": Language.ENG});

class ParentPlatform {
  ParentPlatformPlatform platform;

  ParentPlatform({
    this.platform,
  });

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
        platform: ParentPlatformPlatform.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
      };
}

class ParentPlatformPlatform {
  int id;
  Name name;
  Slug slug;

  ParentPlatformPlatform({
    this.id,
    this.name,
    this.slug,
  });

  factory ParentPlatformPlatform.fromJson(Map<String, dynamic> json) =>
      ParentPlatformPlatform(
        id: json["id"],
        name: nameValues.map[json["name"]],
        slug: slugValues.map[json["slug"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "slug": slugValues.reverse[slug],
      };
}

enum Name {
  PC,
  PLAY_STATION,
  XBOX,
  APPLE_MACINTOSH,
  LINUX,
  NINTENDO,
  ANDROID,
  I_OS
}

final nameValues = EnumValues({
  "Android": Name.ANDROID,
  "Apple Macintosh": Name.APPLE_MACINTOSH,
  "iOS": Name.I_OS,
  "Linux": Name.LINUX,
  "Nintendo": Name.NINTENDO,
  "PC": Name.PC,
  "PlayStation": Name.PLAY_STATION,
  "Xbox": Name.XBOX
});

enum Slug { PC, PLAYSTATION, XBOX, MAC, LINUX, NINTENDO, ANDROID, IOS }

final slugValues = EnumValues({
  "android": Slug.ANDROID,
  "ios": Slug.IOS,
  "linux": Slug.LINUX,
  "mac": Slug.MAC,
  "nintendo": Slug.NINTENDO,
  "pc": Slug.PC,
  "playstation": Slug.PLAYSTATION,
  "xbox": Slug.XBOX
});

class PlatformElement {
  PlatformPlatform platform;
  DateTime releasedAt;
  Requirements requirementsEn;
  Requirements requirementsRu;

  PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirementsEn,
    this.requirementsRu,
  });

  factory PlatformElement.fromJson(Map<String, dynamic> json) =>
      PlatformElement(
        platform: PlatformPlatform.fromJson(json["platform"]),
        releasedAt: DateTime.parse(json["released_at"]),
        requirementsEn: json["requirements_en"] == null
            ? null
            : Requirements.fromJson(json["requirements_en"]),
        requirementsRu: json["requirements_ru"] == null
            ? null
            : Requirements.fromJson(json["requirements_ru"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
        "released_at":
            "${releasedAt.year.toString().padLeft(4, '0')}-${releasedAt.month.toString().padLeft(2, '0')}-${releasedAt.day.toString().padLeft(2, '0')}",
        "requirements_en":
            requirementsEn == null ? null : requirementsEn.toJson(),
        "requirements_ru":
            requirementsRu == null ? null : requirementsRu.toJson(),
      };
}

class PlatformPlatform {
  int id;
  String name;
  String slug;
  dynamic image;
  dynamic yearEnd;
  dynamic yearStart;
  int gamesCount;
  String imageBackground;

  PlatformPlatform({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.yearEnd,
    this.yearStart,
    this.gamesCount,
    this.imageBackground,
  });

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) =>
      PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
        "games_count": gamesCount,
        "image_background": imageBackground,
      };
}

class Requirements {
  String minimum;
  String recommended;

  Requirements({
    this.minimum,
    this.recommended,
  });

  factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        minimum: json["minimum"],
        recommended: json["recommended"] == null ? null : json["recommended"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "recommended": recommended == null ? null : recommended,
      };
}

class Rating {
  int id;
  Title title;
  int count;
  double percent;

  Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: titleValues.map[json["title"]],
        count: json["count"],
        percent: json["percent"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "count": count,
        "percent": percent,
      };
}

enum Title { EXCEPTIONAL, RECOMMENDED, MEH, SKIP }

final titleValues = EnumValues({
  "exceptional": Title.EXCEPTIONAL,
  "meh": Title.MEH,
  "recommended": Title.RECOMMENDED,
  "skip": Title.SKIP
});

class ShortScreenshot {
  int id;
  String image;

  ShortScreenshot({
    this.id,
    this.image,
  });

  factory ShortScreenshot.fromJson(Map<String, dynamic> json) =>
      ShortScreenshot(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class Store {
  int id;
  Genre store;
  String urlEn;
  String urlRu;

  Store({
    this.id,
    this.store,
    this.urlEn,
    this.urlRu,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        store: Genre.fromJson(json["store"]),
        urlEn: json["url_en"],
        urlRu: json["url_ru"] == null ? null : json["url_ru"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store": store.toJson(),
        "url_en": urlEn,
        "url_ru": urlRu == null ? null : urlRu,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
