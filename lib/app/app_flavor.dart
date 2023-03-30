enum AppFlavor { dev, stage, prod }

extension AppFlavorEx on AppFlavor {
  String get path {
    switch (this) {
      case AppFlavor.dev:
        return 'env_dev.json';
      case AppFlavor.stage:
        return 'env_stage.json';
      case AppFlavor.prod:
        return 'env.json';
    }
  }
}