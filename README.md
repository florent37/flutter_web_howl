# flutter_web_howl

Howl.js wrapper for Flutter

https://pub.dev/packages/flutter_web_howl

You can now include Howl.js using `initializeHowl()` anywhere in your FlutterWeb plugin

Then access Howl methods : 

```dart
class Howl {
  Howl({List<String> src, bool autoPlay = false});

  void play();
  void pause();
  void stop();

  HowlState state(); //loading, loaded, undefined

  double seek([double seek]);
  void mute(bool mute);
  bool get playing;
  double volume([double volume]);
  double get duration;
  void on(String event, Function callback);
  void onLoad(Function(dynamic id) callback);
  void onPlay(Function(dynamic id) callback);
  void onPause(Function(dynamic id) callback);
  void onStop(Function(dynamic id) callback);
  void onEnd(Function(dynamic id) callback);
}
```

Created using Package Js https://pub.dev/packages/js

And import_js_library https://pub.dev/packages/import_js_library

# Flutter Plugin

this project is used for web support of Flutter-AssetsAudioPlayer

https://github.com/florent37/Flutter-AssetsAudioPlayer

To import & use play directly songs inside a flutter project, prefer using  [Flutter-AssetsAudioPlayer](https://pub.dev/packages/assets_audio_player)

To create a web plugin which contain an audio player, use directly this library flutter_web_howl