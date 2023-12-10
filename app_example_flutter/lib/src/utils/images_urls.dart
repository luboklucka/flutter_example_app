class AppImagesUrls {
  AppImagesUrls._();

  static const _assetsBaseUrl = 'assets/images/';

  static const shared = _Shared(_assetsBaseUrl);
  static const journal = _Universities(_assetsBaseUrl);
}

class _Shared {
  const _Shared(this._path);

  final String _path;

  String get backIconWhite => '${_path}ic_back_arrow_white.png';
  String get backIconBlue => '${_path}ic_back_arrow_blue.png';
  String get arrowRight => '${_path}ic_arrow_right.png';
  String get arrowRightWhite => '${_path}ic_arrow_right_white.png';
}

class _Universities {
  const _Universities(this._path);

  final String _path;

  String get uniIcon => '${_path}not_implemented.png';
}
