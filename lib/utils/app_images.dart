class AppImages {
  const AppImages._();
  static String _svg(String name) => 'assets/images/$name.svg';
  static String _png(String name) => 'assets/images/$name.png';

  static final String background = _svg('background');
  static final String arrowRight = _svg('arrow_right');
  static final String arrowUp = _svg('arrow_up');
  static final String gellary = _svg('gellary');
  static final String camera = _svg('camera');

  static final String person = _png('person');
}
