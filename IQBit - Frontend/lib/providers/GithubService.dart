import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iqbit_frontend/models/ReposGitHub.dart';

import 'package:iqbit_frontend/models/UserGitHubModel.dart';

class GitHubServices {
  final _endpoint = 'https://api.github.com';

  Future<UserGitHub> getUserGitHub(String userName) async {
    final url = '$_endpoint/users/$userName';

    final res = await http.get(url);
    final user = json.decode(res.body);

    try {
      return UserGitHub.fromJson(user);
    } catch (e) {
      return new UserGitHub();
    }
  }

  Future<List<ReposGitHub>> getReposGitHub(String userName) async {
    final url = '$_endpoint/users/$userName/repos';

    final res = await http.get(url);
    final response = json.decode(res.body);

    List<ReposGitHub> repositories = [];

    for (var repo in response) {
      repositories.add(ReposGitHub.fromJson(repo));
    }

    return repositories;
  }
}
