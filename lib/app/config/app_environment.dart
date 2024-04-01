
class AppEnvironment {
  final String name;
  final String baseUrl;

  const AppEnvironment._({
    required this.name,
    required this.baseUrl,
  });

  static late final AppEnvironment instance;

    factory AppEnvironment.dev() {
    const env = AppEnvironment._(
      name: 'dev',
      baseUrl: 'https://fakestoreapi.com/',
    );
    instance = env;

    return env;
  }

  factory AppEnvironment.beta() {
    const env = AppEnvironment._(
      name: 'dev',
      baseUrl: '-',
    );
    instance = env;

    return env;
  }

  factory AppEnvironment.prod() {
    const env = AppEnvironment._(
      name: 'prod',
      baseUrl: '-',
    );
    instance = env;

    return env;
  }
}