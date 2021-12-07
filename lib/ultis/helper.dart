class Helper {
  static int maxLengthNamePlayer = 12;

  static customName(String namePlayer) {
    if (maxLengthNamePlayer <= namePlayer.length) {
      return namePlayer.substring(0, 11) + "...";
    } else {
      return namePlayer;
    }
  }
}
