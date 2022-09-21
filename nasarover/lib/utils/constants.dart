class Constants {
  static String roverInfo(String roverName) {
    return "https://api.nasa.gov/mars-photos/api/v1/rovers/${roverName}/photos?sol=100&page=1&api_key=DEMO_KEY";
  }
}
