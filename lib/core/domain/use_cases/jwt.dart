import 'dart:convert';

String parseJWT(String token){

  final parts = token.split(".");
  final Map<String, dynamic> tokenDecoded;
  final String userID;   

  if (parts.length != 3) {
    throw Exception('Invalid JWT Token');
  }

  final payload = parts[1];
  final String normalizedPayload = base64Url.normalize(payload);
  final String decodedPayload = utf8.decode(base64Url.decode(normalizedPayload));

  tokenDecoded = jsonDecode(decodedPayload);

  userID = tokenDecoded['sub'].toString();

  return userID;
}
