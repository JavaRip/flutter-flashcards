import 'package:graphql/client.dart';
import "package:injectable/injectable.dart";

@module
abstract class RegisterModule {
  GraphQLClient get graphQLClient => GraphQLClient(link: HttpLink('http://localhost:4000/graphql'), cache: GraphQLCache(),);
}