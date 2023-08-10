final class MalformedResponseException implements Exception {
  const MalformedResponseException({
    this.message = 'Request returned a malformed response body',
  });

  final String message;
}
