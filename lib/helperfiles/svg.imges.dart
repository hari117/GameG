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
    'PlayStation Store': "Assets/platformicons/PS4_Icon.svg",
    'Xbox 360 Store': "Assets/platformicons/Xbox_Icon.svg",
    'Nintendo Store': "Assets/platformicons/Nitendo_Icon.svg",
    'Xbox Store': "Assets/platformicons/Xbox_Icon.svg",
    'Steam': "Assets/storeicons/SteamStore_Icon.svg",
    'GOG': "Assets/storeicons/GogStore_Icon.svg",
    'Epic Games': "Assets/storeicons/EpicStore_Icon.svg",
    'App Store': "Assets/storeicons/AppStore_Icon.svg",
    'Google Play': "Assets/storeicons/PlatStore_Icon.svg",
  };
}
