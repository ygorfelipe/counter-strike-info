enum Menu {
  agent('Agents', '/agent', 'assets/images/agent-cs-go.png'),
  skin('Skins', '/skin', 'assets/images/skin-weapon.png');

  final String name;
  final String route;
  final String assetImage;

  const Menu(this.name, this.route, this.assetImage);
}
