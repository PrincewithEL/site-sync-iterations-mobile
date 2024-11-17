
String replaceUrlParameters(String url, Map<String, String> parameters) {
  return url.replaceAllMapped(RegExp(r'\{(\w+)\}'), (match) {
    String key = match.group(1)!;
    return parameters.containsKey(key) ? parameters[key]! : match.group(0)!;
  });
}