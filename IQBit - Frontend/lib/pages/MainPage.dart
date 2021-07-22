import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iqbit_frontend/models/ReposGitHub.dart';
import 'package:iqbit_frontend/models/UserGitHubModel.dart';
import 'package:iqbit_frontend/providers/GithubService.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UserGitHub userGitHub = new UserGitHub();
  List<ReposGitHub> repositories = [];
  bool _isUserSearch = false;
  bool _loading = false;

  TextEditingController _userNameController = new TextEditingController();

  //Funcion que genera un toast para mostrar un mensaje de error
  void _showToastError(BuildContext context, String msj) {
    final snackBar = SnackBar(
      content: Text(
        msj,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: '',
        onPressed: () {},
        textColor: Colors.white,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //Funcion que permite limpiar la pantalla
  void _cleanPage() {
    setState(() {
      userGitHub = new UserGitHub();
      repositories = [];
      _userNameController.text = '';
      _isUserSearch = false;
    });
  }

  //Funcion que permite buscar un usuario de github
  void _searchUserGitHub() async {
    FocusScope.of(context).unfocus();
    if (_userNameController.text == '') {
      _showToastError(context, 'Please enter a username');
    } else if (_isUserSearch) {
      _cleanPage();
    } else {
      setState(() {
        _loading = true;
      });
      userGitHub =
          await GitHubServices().getUserGitHub(_userNameController.text);
      if (userGitHub.login == null) {
        _showToastError(context, 'Username does not exist');
      } else {
        repositories =
            await GitHubServices().getReposGitHub(_userNameController.text);
        _isUserSearch = true;
      }
      setState(() {
        _loading = false;
      });
    }
  }

  //Funcion que retorna el Widget donde se dibuja la imagen de inicio y la del usuario github
  Widget _image(Size screenSize) {
    return Container(
      height: screenSize.height * 0.2,
      width: screenSize.height * (userGitHub.avatarUrl != null ? 0.2 : 0.35),
      margin: EdgeInsets.only(bottom: screenSize.height * 0.02),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(userGitHub.avatarUrl != null ? 200 : 0),
          image: DecorationImage(
              fit: userGitHub.avatarUrl != null ? BoxFit.cover : BoxFit.fill,
              image: userGitHub.avatarUrl != null
                  ? NetworkImage(userGitHub.avatarUrl)
                  : AssetImage('assets/GitHub-Logo.png'))),
    );
  }

  //Funcion que retorna el Widget donde se dibuja el nombre de usuario github
  Widget _userName(Size screenSize) {
    return Text(
      userGitHub.login == null ? '' : userGitHub.name ?? 'Not UserName',
      style: TextStyle(
          fontSize:
              kIsWeb ? screenSize.height * 0.035 : screenSize.width * 0.05),
    );
  }

  Widget _textField(Size screenSize) {
    return userGitHub.name == null
        ? Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * (kIsWeb ? 0.3 : 0.1)),
            child: TextField(
              controller: _userNameController,
              decoration: InputDecoration(labelText: 'User Name'),
            ),
          )
        : SizedBox();
  }

  //Funcion que retorna el Widget donde se dibuja el boton de busqueda de usuario
  Widget _searchButton(Size screenSize) {
    return ElevatedButton(
      onPressed: _searchUserGitHub,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: screenSize.height * 0.015),
        child: Text(
          userGitHub.name == null ? 'Search User' : 'Another User',
          style: TextStyle(
              fontSize:
                  kIsWeb ? screenSize.height * 0.02 : screenSize.width * 0.04),
        ),
      ),
    );
  }

  Widget _repoContainer(Size screenSize, int i) {
    return ListTile(
        title: Text(
          repositories[i].name,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repositories[i].description ?? '',
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(repositories[i].stargazersCount.toString())
              ],
            )
          ],
        ),
        leading:
            repositories[i].private ? Icon(Icons.lock) : Icon(Icons.lock_open));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          height: screenSize.height - MediaQuery.of(context).padding.top,
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.height * 0.05),
          child: Column(
            children: [
              _loading ? CircularProgressIndicator() : _image(screenSize),
              _userName(screenSize),
              _textField(screenSize),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
                  child: _searchButton(screenSize)),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              _loading
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                      itemCount: repositories.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, i) => Center(
                        child: SizedBox(
                            width: kIsWeb
                                ? screenSize.width * 0.4
                                : screenSize.width * 0.7,
                            child: _repoContainer(screenSize, i)),
                      ),
                    )),
            ],
          ),
        ),
      )),
    );
  }
}
