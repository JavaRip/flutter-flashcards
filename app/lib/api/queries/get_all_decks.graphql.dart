import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Query$getAllDecks {
  Query$getAllDecks({
    required this.decks,
    this.$__typename = 'Query',
  });

  factory Query$getAllDecks.fromJson(Map<String, dynamic> json) {
    final l$decks = json['decks'];
    final l$$__typename = json['__typename'];
    return Query$getAllDecks(
      decks: (l$decks as List<dynamic>)
          .map((e) =>
              Query$getAllDecks$decks.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getAllDecks$decks> decks;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$decks = decks;
    _resultData['decks'] = l$decks.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$decks = decks;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$decks.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getAllDecks) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$decks = decks;
    final lOther$decks = other.decks;
    if (l$decks.length != lOther$decks.length) {
      return false;
    }
    for (int i = 0; i < l$decks.length; i++) {
      final l$decks$entry = l$decks[i];
      final lOther$decks$entry = lOther$decks[i];
      if (l$decks$entry != lOther$decks$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getAllDecks on Query$getAllDecks {
  CopyWith$Query$getAllDecks<Query$getAllDecks> get copyWith =>
      CopyWith$Query$getAllDecks(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getAllDecks<TRes> {
  factory CopyWith$Query$getAllDecks(
    Query$getAllDecks instance,
    TRes Function(Query$getAllDecks) then,
  ) = _CopyWithImpl$Query$getAllDecks;

  factory CopyWith$Query$getAllDecks.stub(TRes res) =
      _CopyWithStubImpl$Query$getAllDecks;

  TRes call({
    List<Query$getAllDecks$decks>? decks,
    String? $__typename,
  });
  TRes decks(
      Iterable<Query$getAllDecks$decks> Function(
              Iterable<
                  CopyWith$Query$getAllDecks$decks<Query$getAllDecks$decks>>)
          _fn);
}

class _CopyWithImpl$Query$getAllDecks<TRes>
    implements CopyWith$Query$getAllDecks<TRes> {
  _CopyWithImpl$Query$getAllDecks(
    this._instance,
    this._then,
  );

  final Query$getAllDecks _instance;

  final TRes Function(Query$getAllDecks) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? decks = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAllDecks(
        decks: decks == _undefined || decks == null
            ? _instance.decks
            : (decks as List<Query$getAllDecks$decks>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes decks(
          Iterable<Query$getAllDecks$decks> Function(
                  Iterable<
                      CopyWith$Query$getAllDecks$decks<
                          Query$getAllDecks$decks>>)
              _fn) =>
      call(
          decks:
              _fn(_instance.decks.map((e) => CopyWith$Query$getAllDecks$decks(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getAllDecks<TRes>
    implements CopyWith$Query$getAllDecks<TRes> {
  _CopyWithStubImpl$Query$getAllDecks(this._res);

  TRes _res;

  call({
    List<Query$getAllDecks$decks>? decks,
    String? $__typename,
  }) =>
      _res;
  decks(_fn) => _res;
}

const documentNodeQuerygetAllDecks = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getAllDecks'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'decks'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cards'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'front'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'back'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$getAllDecks _parserFn$Query$getAllDecks(Map<String, dynamic> data) =>
    Query$getAllDecks.fromJson(data);
typedef OnQueryComplete$Query$getAllDecks = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$getAllDecks?,
);

class Options$Query$getAllDecks
    extends graphql.QueryOptions<Query$getAllDecks> {
  Options$Query$getAllDecks({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getAllDecks? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getAllDecks? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$getAllDecks(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetAllDecks,
          parserFn: _parserFn$Query$getAllDecks,
        );

  final OnQueryComplete$Query$getAllDecks? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getAllDecks
    extends graphql.WatchQueryOptions<Query$getAllDecks> {
  WatchOptions$Query$getAllDecks({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getAllDecks? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerygetAllDecks,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getAllDecks,
        );
}

class FetchMoreOptions$Query$getAllDecks extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getAllDecks({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQuerygetAllDecks,
        );
}

extension ClientExtension$Query$getAllDecks on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getAllDecks>> query$getAllDecks(
          [Options$Query$getAllDecks? options]) async =>
      await this.query(options ?? Options$Query$getAllDecks());
  graphql.ObservableQuery<Query$getAllDecks> watchQuery$getAllDecks(
          [WatchOptions$Query$getAllDecks? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getAllDecks());
  void writeQuery$getAllDecks({
    required Query$getAllDecks data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQuerygetAllDecks)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getAllDecks? readQuery$getAllDecks({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetAllDecks)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getAllDecks.fromJson(result);
  }
}

class Query$getAllDecks$decks {
  Query$getAllDecks$decks({
    required this.id,
    required this.name,
    required this.cards,
    this.$__typename = 'Deck',
  });

  factory Query$getAllDecks$decks.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$cards = json['cards'];
    final l$$__typename = json['__typename'];
    return Query$getAllDecks$decks(
      id: (l$id as String),
      name: (l$name as String),
      cards: (l$cards as List<dynamic>)
          .map((e) => Query$getAllDecks$decks$cards.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final List<Query$getAllDecks$decks$cards> cards;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$cards = cards;
    _resultData['cards'] = l$cards.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$cards = cards;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      Object.hashAll(l$cards.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getAllDecks$decks) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$cards = cards;
    final lOther$cards = other.cards;
    if (l$cards.length != lOther$cards.length) {
      return false;
    }
    for (int i = 0; i < l$cards.length; i++) {
      final l$cards$entry = l$cards[i];
      final lOther$cards$entry = lOther$cards[i];
      if (l$cards$entry != lOther$cards$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getAllDecks$decks on Query$getAllDecks$decks {
  CopyWith$Query$getAllDecks$decks<Query$getAllDecks$decks> get copyWith =>
      CopyWith$Query$getAllDecks$decks(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getAllDecks$decks<TRes> {
  factory CopyWith$Query$getAllDecks$decks(
    Query$getAllDecks$decks instance,
    TRes Function(Query$getAllDecks$decks) then,
  ) = _CopyWithImpl$Query$getAllDecks$decks;

  factory CopyWith$Query$getAllDecks$decks.stub(TRes res) =
      _CopyWithStubImpl$Query$getAllDecks$decks;

  TRes call({
    String? id,
    String? name,
    List<Query$getAllDecks$decks$cards>? cards,
    String? $__typename,
  });
  TRes cards(
      Iterable<Query$getAllDecks$decks$cards> Function(
              Iterable<
                  CopyWith$Query$getAllDecks$decks$cards<
                      Query$getAllDecks$decks$cards>>)
          _fn);
}

class _CopyWithImpl$Query$getAllDecks$decks<TRes>
    implements CopyWith$Query$getAllDecks$decks<TRes> {
  _CopyWithImpl$Query$getAllDecks$decks(
    this._instance,
    this._then,
  );

  final Query$getAllDecks$decks _instance;

  final TRes Function(Query$getAllDecks$decks) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? cards = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAllDecks$decks(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        cards: cards == _undefined || cards == null
            ? _instance.cards
            : (cards as List<Query$getAllDecks$decks$cards>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes cards(
          Iterable<Query$getAllDecks$decks$cards> Function(
                  Iterable<
                      CopyWith$Query$getAllDecks$decks$cards<
                          Query$getAllDecks$decks$cards>>)
              _fn) =>
      call(
          cards: _fn(
              _instance.cards.map((e) => CopyWith$Query$getAllDecks$decks$cards(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$getAllDecks$decks<TRes>
    implements CopyWith$Query$getAllDecks$decks<TRes> {
  _CopyWithStubImpl$Query$getAllDecks$decks(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    List<Query$getAllDecks$decks$cards>? cards,
    String? $__typename,
  }) =>
      _res;
  cards(_fn) => _res;
}

class Query$getAllDecks$decks$cards {
  Query$getAllDecks$decks$cards({
    required this.front,
    required this.back,
    this.$__typename = 'Card',
  });

  factory Query$getAllDecks$decks$cards.fromJson(Map<String, dynamic> json) {
    final l$front = json['front'];
    final l$back = json['back'];
    final l$$__typename = json['__typename'];
    return Query$getAllDecks$decks$cards(
      front: (l$front as String),
      back: (l$back as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String front;

  final String back;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$front = front;
    _resultData['front'] = l$front;
    final l$back = back;
    _resultData['back'] = l$back;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$front = front;
    final l$back = back;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$front,
      l$back,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getAllDecks$decks$cards) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$front = front;
    final lOther$front = other.front;
    if (l$front != lOther$front) {
      return false;
    }
    final l$back = back;
    final lOther$back = other.back;
    if (l$back != lOther$back) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getAllDecks$decks$cards
    on Query$getAllDecks$decks$cards {
  CopyWith$Query$getAllDecks$decks$cards<Query$getAllDecks$decks$cards>
      get copyWith => CopyWith$Query$getAllDecks$decks$cards(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getAllDecks$decks$cards<TRes> {
  factory CopyWith$Query$getAllDecks$decks$cards(
    Query$getAllDecks$decks$cards instance,
    TRes Function(Query$getAllDecks$decks$cards) then,
  ) = _CopyWithImpl$Query$getAllDecks$decks$cards;

  factory CopyWith$Query$getAllDecks$decks$cards.stub(TRes res) =
      _CopyWithStubImpl$Query$getAllDecks$decks$cards;

  TRes call({
    String? front,
    String? back,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getAllDecks$decks$cards<TRes>
    implements CopyWith$Query$getAllDecks$decks$cards<TRes> {
  _CopyWithImpl$Query$getAllDecks$decks$cards(
    this._instance,
    this._then,
  );

  final Query$getAllDecks$decks$cards _instance;

  final TRes Function(Query$getAllDecks$decks$cards) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? front = _undefined,
    Object? back = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getAllDecks$decks$cards(
        front: front == _undefined || front == null
            ? _instance.front
            : (front as String),
        back: back == _undefined || back == null
            ? _instance.back
            : (back as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getAllDecks$decks$cards<TRes>
    implements CopyWith$Query$getAllDecks$decks$cards<TRes> {
  _CopyWithStubImpl$Query$getAllDecks$decks$cards(this._res);

  TRes _res;

  call({
    String? front,
    String? back,
    String? $__typename,
  }) =>
      _res;
}
