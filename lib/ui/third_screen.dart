import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' as pull;
import 'package:suitmedia/api/api_service.dart';
import 'package:suitmedia/model/email_model.dart';
import 'package:suitmedia/provider/email_provider.dart';
import 'package:suitmedia/provider/next_page_provider.dart';
import 'package:suitmedia/widget/card_user.dart';
import 'package:suitmedia/utils/result_state.dart';
import 'package:http/http.dart' as http;

class ThirdScreen extends StatefulWidget {
  static const routeName = '/third_screen';
  int currentPage = 1;
  int totalPages = 2;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool isLoading = false;
  bool scrollDown = false;
  int _currentPage = 1;
  int _totalPages = 2;
  ScrollController _scrollController = ScrollController();
  final pull.RefreshController refreshController =
      pull.RefreshController(initialRefresh: true);

  static final String _baseUrl = 'https://reqres.in/';
  static final String _api = 'api/';
  static final String _users = 'users';
  static final String _page = 'page=';
  static final String _amp = 'amp;';
  static final String _per_page = 'per_page=';

  Future<UserResult> listUser() async {
    final response = await http.get(Uri.parse(_baseUrl +
        _api +
        _users +
        '?' +
        _page +
        '${_currentPage}' +
        _amp +
        _per_page +
        '20'));
    if (response.statusCode == 200) {
      _currentPage++;
      _totalPages;

      return UserResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  @override
  void initState() {
    this._loadNextPage();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<bool> getData({bool isRefresh = false}) async {
    scrollDown = true;
    if (isRefresh) {
      scrollDown = true;
      widget.currentPage = 2;
      return true;
    } else {
      if (widget.currentPage >= widget.totalPages) {
        scrollDown = false;
        refreshController.loadNoData();
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:
            Text('Third Screen', style: Theme.of(context).textTheme.headline5),
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF554AF0),
            size: 20,
          ),
        ),
      ),
      body: pull.SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        // enablePullDown: true,
        onRefresh: () async {
          final result = await getData(isRefresh: true);
          if (result) {
            refreshController.refreshCompleted();
            widget.currentPage = 2;
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result = await getData();
          if (result) {
            refreshController.isLoading;
          } else {
            refreshController.loadFailed();
          }
        },
        child: _buildListUser(),
      ),
    );
  }

  Widget _buildListUser() {
    return Consumer<UserProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          var detail = state.result.data;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.data.length,
            itemBuilder: (context, index) {
              return CardUser(dataUser: detail[index]);
            },
            controller: _scrollController,
          );
        } else if (state.state == ResultState.NoData) {
          return Center(
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          );
        } else if (state.state == ResultState.Error) {
          return Center(
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          );
        } else {
          return Center(
            child: Text(
              'No Connection, failed to load',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          );
        }
      },
    );
  }

  Widget _buildNextPage() {
    return Consumer<NextPageProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          isLoading = true;
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          var detail = state.result.data;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.data.length,
            itemBuilder: (context, index) {
              return CardUser(dataUser: detail[index]);
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          );
        } else if (state.state == ResultState.Error) {
          return Center(
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          );
        } else {
          return Center(
            child: Text(
              'No Connection, failed to load',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          );
        }
      },
    );
  }

  Future<void> _pullRefresh() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      setState(() {
        isLoading = false;
        Text('ga ada');
      });
    }
  }

  Future<void> _loadNextPage() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      setState(() {
        isLoading = false;
        _buildNextPage();
      });
    }
  }
}
