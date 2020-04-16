@JS()
library howl.js;

import 'package:import_js_library/import_js_library.dart';
import 'package:js/js.dart';

void initializeHowl() {
  importJsLibrary(
      url: "./assets/howler.js", flutterPluginName: "flutter_web_howl");
}

enum HowlState { loading, loaded, undefined }

// just a wrapper of the HowlJs
// to maintain this element not modified by @Js methods
class Howl {
  final HowlJs _howlJs;

  static const stateLoading = "loading";
  static const stateLoaded = "loaded";
  static const stateUndefined = "undefined";

  Howl({List<String> src, bool autoPlay = false})
      : _howlJs = HowlJs(HowlParams(
          src: src,
          autoplay: autoPlay,
        ));

  void play() => _howlJs.play();

  void pause() => _howlJs.pause();

  void stop() => _howlJs.stop();

  HowlState state() {
    final state = _howlJs.state();
    switch (state) {
      case stateLoading:
        return HowlState.loading;
      case stateLoaded:
        return HowlState.loaded;
      default:
        return HowlState.undefined;
    }
  }

  double seek([double seek]) {
    final state = this.state();
    if (state == HowlState.loaded) {
      return _howlJs.seek(seek);
    } else {
      return 0;
    }
  }

  void mute(bool mute) => _howlJs.mute(mute);

  bool get playing => _howlJs.playing();

  double volume([double volume]) => _howlJs.volume(volume);

  double get duration => _howlJs.duration();

  void on(String event, Function callback) => _howlJs.on(
        event,
        allowInterop(callback),
      );

  void onLoad(Function(dynamic id) callback) => on(
        "load",
        (id, _) {
          callback(id); //exclude the second param
        },
      );

  void onPlay(Function(dynamic id) callback) => on(
        "play",
        (id, _) {
          callback(id); //exclude the second param
        },
      );

  void onPause(Function(dynamic id) callback) => this.on(
        "pause",
        (id, _) {
          callback(id); //exclude the second param
        },
      );

  void onStop(Function(dynamic id) callback) => on(
        "stop",
        (id, _) {
          callback(id); //exclude the second param
        },
      );

  void onEnd(Function(dynamic id) callback) => on(
        "end",
        (id, _) {
          callback(id); //exclude the second param
        },
      );
}

//this class contains only Howl Javascript methods
@JS("Howl")
class HowlJs {
  external HowlJs(HowlParams params); //initializer

  external play();

  external pause();

  external stop();

  external double seek([double seek]);

  external mute(bool mute);

  external bool playing();

  //can be "unloaded", "loaded", "loading"
  external String state();

  external double volume([double volume]);

  external double duration();

  external HowlJs on(String event, Function fn, [dynamic id = ""]);
}

@JS()
@anonymous
class HowlParams {
  external factory HowlParams({
    List<String> src,
    bool autoplay = false,
  });
}
