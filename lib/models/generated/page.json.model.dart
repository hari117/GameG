// To parse this JSON data, do
//
//     final listOfGamesPage = listOfGamesPageFromJson(jsonString);

import 'dart:convert';

ListOfGamesPage listOfGamesPageFromJson(String str) => ListOfGamesPage.fromJson(json.decode(str));

String listOfGamesPageToJson(ListOfGamesPage data) => json.encode(data.toJson());

class ListOfGamesPage {
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

  int count;
  String next;
  dynamic previous;
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

  factory ListOfGamesPage.fromJson(Map<String, dynamic> json) => ListOfGamesPage(
        //  count: json["count"] == null ? null : json["count"],
        //  next: json["next"] == null ? null : json["next"],
        //  previous: json["previous"],
        results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        //  seoTitle: json["seo_title"] == null ? null : json["seo_title"],
        //  seoDescription: json["seo_description"] == null ? null : json["seo_description"],
        // seoKeywords: json["seo_keywords"] == null ? null : json["seo_keywords"],
        // seoH1: json["seo_h1"] == null ? null : json["seo_h1"],
        //  noindex: json["noindex"] == null ? null : json["noindex"],
        // nofollow: json["nofollow"] == null ? null : json["nofollow"],
        // description: json["description"] == null ? null : json["description"],
        //  filters: json["filters"] == null ? null : Filters.fromJson(json["filters"]),
        //  nofollowCollections: json["nofollow_collections"] == null ? null : List<String>.from(json["nofollow_collections"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "next": next == null ? null : next,
        "previous": previous,
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
        "seo_title": seoTitle == null ? null : seoTitle,
        "seo_description": seoDescription == null ? null : seoDescription,
        "seo_keywords": seoKeywords == null ? null : seoKeywords,
        "seo_h1": seoH1 == null ? null : seoH1,
        "noindex": noindex == null ? null : noindex,
        "nofollow": nofollow == null ? null : nofollow,
        "description": description == null ? null : description,
        "filters": filters == null ? null : filters.toJson(),
        "nofollow_collections":
            nofollowCollections == null ? null : List<dynamic>.from(nofollowCollections.map((x) => x)),
      };
}

class Filters {
  Filters({
    this.years,
  });

  List<FiltersYear> years;

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        years: json["years"] == null ? null : List<FiltersYear>.from(json["years"].map((x) => FiltersYear.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "years": years == null ? null : List<dynamic>.from(years.map((x) => x.toJson())),
      };
}

class FiltersYear {
  FiltersYear({
    this.from,
    this.to,
    this.filter,
    this.decade,
    this.years,
    this.nofollow,
    this.count,
  });

  int from;
  int to;
  String filter;
  int decade;
  List<YearYear> years;
  bool nofollow;
  int count;

  factory FiltersYear.fromJson(Map<String, dynamic> json) => FiltersYear(
        from: json["from"] == null ? null : json["from"],
        to: json["to"] == null ? null : json["to"],
        filter: json["filter"] == null ? null : json["filter"],
        decade: json["decade"] == null ? null : json["decade"],
        years: json["years"] == null ? null : List<YearYear>.from(json["years"].map((x) => YearYear.fromJson(x))),
        nofollow: json["nofollow"] == null ? null : json["nofollow"],
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "from": from == null ? null : from,
        "to": to == null ? null : to,
        "filter": filter == null ? null : filter,
        "decade": decade == null ? null : decade,
        "years": years == null ? null : List<dynamic>.from(years.map((x) => x.toJson())),
        "nofollow": nofollow == null ? null : nofollow,
        "count": count == null ? null : count,
      };
}

class YearYear {
  YearYear({
    this.year,
    this.count,
    this.nofollow,
  });

  int year;
  int count;
  bool nofollow;

  factory YearYear.fromJson(Map<String, dynamic> json) => YearYear(
        year: json["year"] == null ? null : json["year"],
        count: json["count"] == null ? null : json["count"],
        nofollow: json["nofollow"] == null ? null : json["nofollow"],
      );

  Map<String, dynamic> toJson() => {
        "year": year == null ? null : year,
        "count": count == null ? null : count,
        "nofollow": nofollow == null ? null : nofollow,
      };
}

class Result {
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
//    this.saturatedColor,
//    this.dominantColor,
    this.platforms,
    this.parentPlatforms,
    this.genres,
    this.stores,
    this.clip,
    this.tags,
    this.shortScreenshots,
  });

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
//  Color saturatedColor;
//  Color dominantColor;
  List<PlatformElement> platforms;
  List<ParentPlatform> parentPlatforms;
  List<Genre> genres;
  List<Store> stores;
  Clip clip;
  List<Genre> tags;
  List<ShortScreenshot> shortScreenshots;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        //   slug: json["slug"] == null ? null : json["slug"],
        name: json["name"] == null ? null : json["name"],
        released: json["released"] == null ? null : DateTime.parse(json["released"]),
        //  tba: json["tba"] == null ? null : json["tba"],
        backgroundImage: json["background_image"] == null ? null : json["background_image"],
        //  rating: json["rating"] == null ? null : json["rating"].toDouble(),
        //  ratingTop: json["rating_top"] == null ? null : json["rating_top"],
        ratings: json["ratings"] == null ? null : List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        //   ratingsCount: json["ratings_count"] == null ? null : json["ratings_count"],
        //   reviewsTextCount: json["reviews_text_count"] == null ? null : json["reviews_text_count"],
        //  added: json["added"] == null ? null : json["added"],
        //  addedByStatus: json["added_by_status"] == null ? null : AddedByStatus.fromJson(json["added_by_status"]),
        metacritic: json["metacritic"] == null ? null : json["metacritic"],
        //  playtime: json["playtime"] == null ? null : json["playtime"],
        //  suggestionsCount: json["suggestions_count"] == null ? null : json["suggestions_count"],
        //   userGame: json["user_game"],
        //   reviewsCount: json["reviews_count"] == null ? null : json["reviews_count"],
        //   saturatedColor: json["saturated_color"] == null ? null : colorValues.map[json["saturated_color"]],
        //   dominantColor: json["dominant_color"] == null ? null : colorValues.map[json["dominant_color"]],
        platforms: json["platforms"] == null
            ? null
            : List<PlatformElement>.from(json["platforms"].map((x) => PlatformElement.fromJson(x))),
        parentPlatforms: json["parent_platforms"] == null
            ? null
            : List<ParentPlatform>.from(json["parent_platforms"].map((x) => ParentPlatform.fromJson(x))),
        genres: json["genres"] == null ? null : List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        stores: json["stores"] == null ? null : List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
        // clip: json["clip"] == null ? null : Clip.fromJson(json["clip"]),
        tags: json["tags"] == null ? null : List<Genre>.from(json["tags"].map((x) => Genre.fromJson(x))),
        shortScreenshots: json["short_screenshots"] == null
            ? null
            : List<ShortScreenshot>.from(json["short_screenshots"].map((x) => ShortScreenshot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "slug": slug == null ? null : slug,
        "name": name == null ? null : name,
        "released": released == null
            ? null
            : "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "tba": tba == null ? null : tba,
        "background_image": backgroundImage == null ? null : backgroundImage,
        "rating": rating == null ? null : rating,
        "rating_top": ratingTop == null ? null : ratingTop,
        "ratings": ratings == null ? null : List<dynamic>.from(ratings.map((x) => x.toJson())),
        "ratings_count": ratingsCount == null ? null : ratingsCount,
        "reviews_text_count": reviewsTextCount == null ? null : reviewsTextCount,
        "added": added == null ? null : added,
        "added_by_status": addedByStatus == null ? null : addedByStatus.toJson(),
        "metacritic": metacritic == null ? null : metacritic,
        "playtime": playtime == null ? null : playtime,
        "suggestions_count": suggestionsCount == null ? null : suggestionsCount,
        "user_game": userGame,
        "reviews_count": reviewsCount == null ? null : reviewsCount,
//        "saturated_color": saturatedColor == null ? null : colorValues.reverse[saturatedColor],
//        "dominant_color": dominantColor == null ? null : colorValues.reverse[dominantColor],
        "platforms": platforms == null ? null : List<dynamic>.from(platforms.map((x) => x.toJson())),
        "parent_platforms": parentPlatforms == null ? null : List<dynamic>.from(parentPlatforms.map((x) => x.toJson())),
        "genres": genres == null ? null : List<dynamic>.from(genres.map((x) => x.toJson())),
        "stores": stores == null ? null : List<dynamic>.from(stores.map((x) => x.toJson())),
        "clip": clip == null ? null : clip.toJson(),
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x.toJson())),
        "short_screenshots":
            shortScreenshots == null ? null : List<dynamic>.from(shortScreenshots.map((x) => x.toJson())),
      };
}

class AddedByStatus {
  AddedByStatus({
    this.yet,
    this.owned,
    this.beaten,
    this.toplay,
    this.dropped,
    this.playing,
  });

  int yet;
  int owned;
  int beaten;
  int toplay;
  int dropped;
  int playing;

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"] == null ? null : json["yet"],
        owned: json["owned"] == null ? null : json["owned"],
        beaten: json["beaten"] == null ? null : json["beaten"],
        toplay: json["toplay"] == null ? null : json["toplay"],
        dropped: json["dropped"] == null ? null : json["dropped"],
        playing: json["playing"] == null ? null : json["playing"],
      );

  Map<String, dynamic> toJson() => {
        "yet": yet == null ? null : yet,
        "owned": owned == null ? null : owned,
        "beaten": beaten == null ? null : beaten,
        "toplay": toplay == null ? null : toplay,
        "dropped": dropped == null ? null : dropped,
        "playing": playing == null ? null : playing,
      };
}

class Clip {
  Clip({
    this.clip,
    this.clips,
    this.video,
    this.preview,
  });

  String clip;
  Clips clips;
  String video;
  String preview;

  factory Clip.fromJson(Map<String, dynamic> json) => Clip(
        clip: json["clip"] == null ? null : json["clip"],
        clips: json["clips"] == null ? null : Clips.fromJson(json["clips"]),
        video: json["video"] == null ? null : json["video"],
        preview: json["preview"] == null ? null : json["preview"],
      );

  Map<String, dynamic> toJson() => {
        "clip": clip == null ? null : clip,
        "clips": clips == null ? null : clips.toJson(),
        "video": video == null ? null : video,
        "preview": preview == null ? null : preview,
      };
}

class Clips {
  Clips({
    this.the320,
    this.the640,
    this.full,
  });

  String the320;
  String the640;
  String full;

  factory Clips.fromJson(Map<String, dynamic> json) => Clips(
        the320: json["320"] == null ? null : json["320"],
        the640: json["640"] == null ? null : json["640"],
        full: json["full"] == null ? null : json["full"],
      );

  Map<String, dynamic> toJson() => {
        "320": the320 == null ? null : the320,
        "640": the640 == null ? null : the640,
        "full": full == null ? null : full,
      };
}

//enum Color { THE_0_F0_F0_F }

//final colorValues = EnumValues({"0f0f0f": Color.THE_0_F0_F0_F});

class Genre {
  Genre({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });

  int id;
  String name;
  String slug;
  int gamesCount;
  String imageBackground;
  String domain;
  Language language;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        gamesCount: json["games_count"] == null ? null : json["games_count"],
        imageBackground: json["image_background"] == null ? null : json["image_background"],
        domain: json["domain"] == null ? null : json["domain"],
        language: json["language"] == null ? null : languageValues.map[json["language"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "games_count": gamesCount == null ? null : gamesCount,
        "image_background": imageBackground == null ? null : imageBackground,
        "domain": domain == null ? null : domain,
        "language": language == null ? null : languageValues.reverse[language],
      };
}

enum Language { ENG }

final languageValues = EnumValues({"eng": Language.ENG});

class ParentPlatform {
  ParentPlatform({
    this.platform,
  });

  ParentPlatformPlatform platform;

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
        platform: json["platform"] == null ? null : ParentPlatformPlatform.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform == null ? null : platform.toJson(),
      };
}

class ParentPlatformPlatform {
  ParentPlatformPlatform({
    this.id,
    this.name,
    this.slug,
  });

  int id;
  PlatformName name;
  Slug slug;

  factory ParentPlatformPlatform.fromJson(Map<String, dynamic> json) => ParentPlatformPlatform(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        slug: json["slug"] == null ? null : slugValues.map[json["slug"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : nameValues.reverse[name],
        "slug": slug == null ? null : slugValues.reverse[slug],
      };
}

enum PlatformName { PC, PLAY_STATION, XBOX, APPLE_MACINTOSH, LINUX, NINTENDO, ANDROID, I_OS }

final nameValues = EnumValues({
  "Android": PlatformName.ANDROID,
  "Apple Macintosh": PlatformName.APPLE_MACINTOSH,
  "iOS": PlatformName.I_OS,
  "Linux": PlatformName.LINUX,
  "Nintendo": PlatformName.NINTENDO,
  "PC": PlatformName.PC,
  "PlayStation": PlatformName.PLAY_STATION,
  "Xbox": PlatformName.XBOX
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
  PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirementsEn,
    this.requirementsRu,
  });

  PlatformPlatform platform;
  DateTime releasedAt;
  Requirements requirementsEn;
  Requirements requirementsRu;

  factory PlatformElement.fromJson(Map<String, dynamic> json) => PlatformElement(
        platform: json["platform"] == null ? null : PlatformPlatform.fromJson(json["platform"]),
        releasedAt: json["released_at"] == null ? null : DateTime.parse(json["released_at"]),
        requirementsEn: json["requirements_en"] == null ? null : Requirements.fromJson(json["requirements_en"]),
        requirementsRu: json["requirements_ru"] == null ? null : Requirements.fromJson(json["requirements_ru"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform == null ? null : platform.toJson(),
        "released_at": releasedAt == null
            ? null
            : "${releasedAt.year.toString().padLeft(4, '0')}-${releasedAt.month.toString().padLeft(2, '0')}-${releasedAt.day.toString().padLeft(2, '0')}",
        "requirements_en": requirementsEn == null ? null : requirementsEn.toJson(),
        "requirements_ru": requirementsRu == null ? null : requirementsRu.toJson(),
      };
}

class PlatformPlatform {
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

  int id;
  String name;
  String slug;
  dynamic image;
  dynamic yearEnd;
  dynamic yearStart;
  int gamesCount;
  String imageBackground;

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) => PlatformPlatform(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"] == null ? null : json["games_count"],
        imageBackground: json["image_background"] == null ? null : json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
        "games_count": gamesCount == null ? null : gamesCount,
        "image_background": imageBackground == null ? null : imageBackground,
      };
}

class Requirements {
  Requirements({
    this.minimum,
    this.recommended,
  });

  String minimum;
  String recommended;

  factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        minimum: json["minimum"] == null ? null : json["minimum"],
        recommended: json["recommended"] == null ? null : json["recommended"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum == null ? null : minimum,
        "recommended": recommended == null ? null : recommended,
      };
}

class Rating {
  Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  int id;
  Title title;
  int count;
  double percent;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : titleValues.map[json["title"]],
        count: json["count"] == null ? null : json["count"],
        percent: json["percent"] == null ? null : json["percent"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : titleValues.reverse[title],
        "count": count == null ? null : count,
        "percent": percent == null ? null : percent,
      };
}

enum Title { EXCEPTIONAL, RECOMMENDED, MEH, SKIP }

final titleValues = EnumValues(
    {"exceptional": Title.EXCEPTIONAL, "meh": Title.MEH, "recommended": Title.RECOMMENDED, "skip": Title.SKIP});

class ShortScreenshot {
  ShortScreenshot({
    this.id,
    this.image,
  });

  int id;
  String image;

  factory ShortScreenshot.fromJson(Map<String, dynamic> json) => ShortScreenshot(
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "image": image == null ? null : image,
      };
}

class Store {
  Store({
    this.id,
    this.store,
    this.urlEn,
    this.urlRu,
  });

  int id;
  Genre store;
  String urlEn;
  String urlRu;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"] == null ? null : json["id"],
        store: json["store"] == null ? null : Genre.fromJson(json["store"]),
        urlEn: json["url_en"] == null ? null : json["url_en"],
        urlRu: json["url_ru"] == null ? null : json["url_ru"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "store": store == null ? null : store.toJson(),
        "url_en": urlEn == null ? null : urlEn,
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
