class Environment {
  static const baseURL = String.fromEnvironment('BASE_URL',
      defaultValue: 'https://fipe.parallelum.com.br/api/v2/');

  static const apiKey = String.fromEnvironment('API_KEY',
      defaultValue:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIzNmU0M2ZiNS01YzQ5LTRjYTgtOTI4NC03MzAwNDMyZWQ4MDAiLCJlbWFpbCI6Im5pY29sYXNicnVub21vcmFpc0Bob3RtYWlsLmNvbSIsImlhdCI6MTczOTgyNDE3Mn0.Mkay-bOnHT8p0nTNg5DpOgiKtatGikwSXk3ZSRZb-2o');
}
