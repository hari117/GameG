import 'package:gameg/models/generated/page.json.model.dart';
class SvgImagesMap {
  static Map<PlatformName, String> platformIcons = {
    PlatformName.ANDROID: "Assets/platformicons/andriod.svg",
    //  PlatformName.I_OS: "svg/apple.svg",
    PlatformName.LINUX: "Assets/platformicons/linux.svg",
    PlatformName.NINTENDO: "Assets/platformicons/nitendo.svg",
    PlatformName.PLAY_STATION: "Assets/platformicons/ps4.svg",
    PlatformName.PC: "Assets/platformicons/windows.svg",
    PlatformName.XBOX: "Assets/platformicons/xbox.svg",
    PlatformName.APPLE_MACINTOSH: "Assets/platformicons/apple.svg"
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
