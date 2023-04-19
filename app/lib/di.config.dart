// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flashcards/api/deck.dart' as _i5;
import 'package:flashcards/data/dao/deck_dao.dart' as _i6;
import 'package:flashcards/data/db.dart' as _i4;
import 'package:flashcards/graphql_client.dart' as _i8;
import 'package:flashcards/repository/deck_repo.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i3;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.GraphQLClient>(() => registerModule.graphQLClient);
    gh.singleton<_i4.LocalDb>(_i4.LocalDb());
    gh.factory<_i5.DeckApi>(() => _i5.DeckApi(client: gh<_i3.GraphQLClient>()));
    gh.factory<_i6.DeckDao>(() => _i6.DeckDao(gh<_i4.LocalDb>()));
    gh.factory<_i7.DeckRepo>(() => _i7.DeckRepo(
          api: gh<_i5.DeckApi>(),
          dao: gh<_i6.DeckDao>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
