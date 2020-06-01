// To parse this JSON data, do
//
//     final game = gameFromJson(jsonString);

import 'dart:convert';

GameCardPageDetails gameFromJson(String str) =>
    GameCardPageDetails.fromJson(json.decode(str));

String gameToJson(GameCardPageDetails data) => json.encode(data.toJson());

class GameCardPageDetails {
  GameCardPageDetails({
    this.id,
    this.slug,
    this.name,
    this.nameOriginal,
    this.description,
    this.metacritic,
    this.metacriticPlatforms,
    this.released,
    this.tba,
    this.updated,
    this.backgroundImage,
    this.backgroundImageAdditional,
    this.website,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.reactions,
    this.added,
    this.addedByStatus,
    this.playtime,
    this.screenshotsCount,
    this.moviesCount,
    this.creatorsCount,
    this.achievementsCount,
    this.parentAchievementsCount,
    this.redditUrl,
    this.redditName,
    this.redditDescription,
    this.redditLogo,
    this.redditCount,
    this.twitchCount,
    this.youtubeCount,
    this.reviewsTextCount,
    this.ratingsCount,
    this.suggestionsCount,
    this.alternativeNames,
    this.metacriticUrl,
    this.parentsCount,
    this.additionsCount,
    this.gameSeriesCount,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.parentPlatforms,
    this.platforms,
    this.stores,
    this.developers,
    this.genres,
    this.tags,
    this.publishers,
    this.esrbRating,
    this.clip,
    this.descriptionRaw,
  });

  int id;
  String slug;
  String name;
  String nameOriginal;
  String description;
  int metacritic;
  List<dynamic> metacriticPlatforms;
  DateTime released;
  bool tba;
  DateTime updated;
  String backgroundImage;
  String backgroundImageAdditional;
  String website;
  double rating;
  int ratingTop;
  List<Rating> ratings;
  Map<String, int> reactions;
  int added;
  AddedByStatus addedByStatus;
  int playtime;
  int screenshotsCount;
  int moviesCount;
  int creatorsCount;
  int achievementsCount;
  int parentAchievementsCount;
  String redditUrl;
  String redditName;
  String redditDescription;
  String redditLogo;
  int redditCount;
  int twitchCount;
  int youtubeCount;
  int reviewsTextCount;
  int ratingsCount;
  int suggestionsCount;
  List<dynamic> alternativeNames;
  String metacriticUrl;
  int parentsCount;
  int additionsCount;
  int gameSeriesCount;
  dynamic userGame;
  int reviewsCount;
  String saturatedColor;
  String dominantColor;
  List<ParentPlatform> parentPlatforms;
  List<PlatformElement> platforms;
  List<Store> stores;
  List<Developer> developers;
  List<Developer> genres;
  List<Developer> tags;
  List<Developer> publishers;
  EsrbRating esrbRating;
  Clip clip;
  String descriptionRaw;

  factory GameCardPageDetails.fromJson(Map<String, dynamic> json) =>
      GameCardPageDetails(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        nameOriginal: json["name_original"],
        description: json["description"],
        metacritic: json["metacritic"],
        metacriticPlatforms:
            List<dynamic>.from(json["metacritic_platforms"].map((x) => x)),
        released: DateTime.parse(json["released"]),
        tba: json["tba"],
        updated: DateTime.parse(json["updated"]),
        backgroundImage: json["background_image"],
        backgroundImageAdditional: json["background_image_additional"],
        website: json["website"],
        rating: json["rating"].toDouble(),
        ratingTop: json["rating_top"],
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        reactions: Map.from(json["reactions"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        added: json["added"],
        addedByStatus: AddedByStatus.fromJson(json["added_by_status"]),
        playtime: json["playtime"],
        screenshotsCount: json["screenshots_count"],
        moviesCount: json["movies_count"],
        creatorsCount: json["creators_count"],
        achievementsCount: json["achievements_count"],
        parentAchievementsCount: json["parent_achievements_count"],
        redditUrl: json["reddit_url"],
        redditName: json["reddit_name"],
        redditDescription: json["reddit_description"],
        redditLogo: json["reddit_logo"],
        redditCount: json["reddit_count"],
        twitchCount: json["twitch_count"],
        youtubeCount: json["youtube_count"],
        reviewsTextCount: json["reviews_text_count"],
        ratingsCount: json["ratings_count"],
        suggestionsCount: json["suggestions_count"],
        alternativeNames:
            List<dynamic>.from(json["alternative_names"].map((x) => x)),
        metacriticUrl: json["metacritic_url"],
        parentsCount: json["parents_count"],
        additionsCount: json["additions_count"],
        gameSeriesCount: json["game_series_count"],
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        parentPlatforms: List<ParentPlatform>.from(
            json["parent_platforms"].map((x) => ParentPlatform.fromJson(x))),
        platforms: List<PlatformElement>.from(
            json["platforms"].map((x) => PlatformElement.fromJson(x))),
        stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
        developers: List<Developer>.from(
            json["developers"].map((x) => Developer.fromJson(x))),
        genres: List<Developer>.from(
            json["genres"].map((x) => Developer.fromJson(x))),
        tags: List<Developer>.from(
            json["tags"].map((x) => Developer.fromJson(x))),
        publishers: List<Developer>.from(
            json["publishers"].map((x) => Developer.fromJson(x))),
        esrbRating: EsrbRating.fromJson(json["esrb_rating"]),
        clip: Clip.fromJson(json["clip"]),
        descriptionRaw: json["description_raw"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "name_original": nameOriginal,
        "description": description,
        "metacritic": metacritic,
        "metacritic_platforms":
            List<dynamic>.from(metacriticPlatforms.map((x) => x)),
        "released":
            "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "updated": updated.toIso8601String(),
        "background_image": backgroundImage,
        "background_image_additional": backgroundImageAdditional,
        "website": website,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
        "reactions":
            Map.from(reactions).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "added": added,
        "added_by_status": addedByStatus.toJson(),
        "playtime": playtime,
        "screenshots_count": screenshotsCount,
        "movies_count": moviesCount,
        "creators_count": creatorsCount,
        "achievements_count": achievementsCount,
        "parent_achievements_count": parentAchievementsCount,
        "reddit_url": redditUrl,
        "reddit_name": redditName,
        "reddit_description": redditDescription,
        "reddit_logo": redditLogo,
        "reddit_count": redditCount,
        "twitch_count": twitchCount,
        "youtube_count": youtubeCount,
        "reviews_text_count": reviewsTextCount,
        "ratings_count": ratingsCount,
        "suggestions_count": suggestionsCount,
        "alternative_names": List<dynamic>.from(alternativeNames.map((x) => x)),
        "metacritic_url": metacriticUrl,
        "parents_count": parentsCount,
        "additions_count": additionsCount,
        "game_series_count": gameSeriesCount,
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "parent_platforms":
            List<dynamic>.from(parentPlatforms.map((x) => x.toJson())),
        "platforms": List<dynamic>.from(platforms.map((x) => x.toJson())),
        "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
        "developers": List<dynamic>.from(developers.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "publishers": List<dynamic>.from(publishers.map((x) => x.toJson())),
        "esrb_rating": esrbRating.toJson(),
        "clip": clip.toJson(),
        "description_raw": descriptionRaw,
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
  Clips({
    this.the320,
    this.the640,
    this.full,
  });

  String the320;
  String the640;
  String full;

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

class Developer {
  Developer({
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

  factory Developer.fromJson(Map<String, dynamic> json) => Developer(
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

class EsrbRating {
  EsrbRating({
    this.id,
    this.name,
    this.slug,
  });

  int id;
  String name;
  String slug;

  factory EsrbRating.fromJson(Map<String, dynamic> json) => EsrbRating(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class ParentPlatform {
  ParentPlatform({
    this.platform,
  });

  EsrbRating platform;

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
        platform: EsrbRating.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
      };
}

class PlatformElement {
  PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirements,
  });

  PlatformPlatform platform;
  DateTime releasedAt;
  dynamic requirements;

  factory PlatformElement.fromJson(Map<String, dynamic> json) =>
      PlatformElement(
        platform: PlatformPlatform.fromJson(json["platform"]),
        releasedAt: DateTime.parse(json["released_at"]),
        requirements: json["requirements"],
      );

  Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
        "released_at":
            "${releasedAt.year.toString().padLeft(4, '0')}-${releasedAt.month.toString().padLeft(2, '0')}-${releasedAt.day.toString().padLeft(2, '0')}",
        "requirements": requirements,
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

class Rating {
  Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  int id;
  String title;
  int count;
  double percent;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"],
        count: json["count"],
        percent: json["percent"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "count": count,
        "percent": percent,
      };
}

class Store {
  Store({
    this.id,
    this.url,
    this.store,
  });

  int id;
  String url;
  Developer store;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        url: json["url"],
        store: Developer.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "store": store.toJson(),
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
