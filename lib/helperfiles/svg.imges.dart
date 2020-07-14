import 'package:gameg/models/generated/page.json.model.dart';
class SvgImagesMap {
  static Map<PlatformName, String> platformIcons = {
    PlatformName.ANDROID: "Assets/platformicons/Andriod_Icon.svg",
    //  PlatformName.I_OS: "svg/apple.svg",
    PlatformName.LINUX: "Assets/platformicons/Linux_Icon.svg",
    PlatformName.NINTENDO: "Assets/platformicons/Nitendo_Icon.svg",
    PlatformName.PLAY_STATION: "Assets/platformicons/PS4_Icon.svg",
    PlatformName.PC: "Assets/platformicons/Windows_Icon.svg",
    PlatformName.XBOX: "Assets/platformicons/Xbox_Icon.svg",
    PlatformName.APPLE_MACINTOSH: "Assets/platformicons/Apple_Icon.svg"
  };

  static Map<String, String> shopIcons = {
    'Xbox 360 Store': "Assets/storeicons/xbox360store.svg",
    'Steam': "Assets/storeicons/steam.svg",
    'GOG': "Assets/storeicons/gog.svg",
    'Xbox Store': "Assets/storeicons/xbox360store.svg",
    'PlayStation Store': "Assets/storeicons/ps.svg",
    'Nintendo Store': "Assets/storeicons/nitendo.svg",
    'Epic Games': "Assets/storeicons/epicgames.svg",
    'App Store': "Assets/storeicons/appstore.svg",
    'Google Play': "Assets/storeicons/googleplaystore.svg",
  };
}
