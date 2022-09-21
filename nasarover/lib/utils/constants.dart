class Constants {

 static String roverInfo (String roverName) {

 return "https://api.nasa.gov/mars-photos/api/v1/rovers/${roverName}/photos?sol=100&page=1&api_key=jnPRo9Oc17b46Nj95cRO3xNlvYxTOgZVYCubNbnU";
}
 static String camInfo (String roverName, String camName) {

 return "https://api.nasa.gov/mars-photos/api/v1/rovers/${roverName}/photos?sol=100&page=1&camera=${camName}&api_key=jnPRo9Oc17b46Nj95cRO3xNlvYxTOgZVYCubNbnU";
}


}