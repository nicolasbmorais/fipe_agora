class Environment {
  static const baseURL = String.fromEnvironment('BASE_URL',
      defaultValue: 'https://fipe2.p.rapidapi.com/');

  static const apiKey = String.fromEnvironment('API_KEY',
      defaultValue: '53e9d380d7msha3584e2ff8b21d9p13a50ajsn0cfba2074d16');
}
