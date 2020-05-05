import 'dart:convert';
import 'dart:io';
import 'package:heroes/exceptions/api.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class BaseApiClient {
  final String url;

  final http.Client client;

  BaseApiClient({@required this.url, @required this.client});

  Future<Uri> generateUri(String path, {Map<String, String> query}) async {
    return Uri.http(this.url, path, query);
  }

  Future<dynamic> get(String path,
      {Map<String, String> headers, Map<String, String> query}) async {
    http.Response response = await this.client.get(
        await this.generateUri(path, query: query),
        headers: this.generateHeaders(additionHeader: headers));
    return this.decodeJsonResponse(response);
  }

  Future<dynamic> post(path,
      {Map<String, String> query, Map<String, String> header, Map<String, String> body}) async {
    http.Response response = await this.client.post(
          await this.generateUri(path),
          headers: this.generateHeaders(additionHeader: header),
          body: json.encode(body),
        );
    return this.decodeJsonResponse(response);
  }

  Map<String, String> generateHeaders({Map<String, String> additionHeader}) {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    if (additionHeader != null) {
      headers.addAll(additionHeader);
    }

    return headers;
  }

  decodeJsonResponse(http.Response response) {
    var body = json.decode(response.body);
    if (body['errors'].length > 0) {
      throw new Exception(body['errors'][0]);
    }
    return body['data'];
  }
}
