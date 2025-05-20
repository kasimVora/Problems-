Future<void> fetchCountry(String code) async {

  await initHiveForFlutter();
  final HttpLink httpLink = HttpLink('https://countries.trevorblades.com');
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  final String query = '''
    query {
      countries {
        code
        name
        emoji
      }
    }
  ''';


  final String countryQuery = '''
    query GetCountry(\$code: ID!) {
      country(code: \$code) {
        name
        emoji
        capital
      }
    }
  ''';

  setState(() {
    _loading = true;
    _error = null;
    _countryData = null;
  });

  final client = GraphQLProvider.of(context).value;



  final result = await client.query(
    QueryOptions(
      document: gql(countryQuery),
      variables: {'code': code.toUpperCase()},
    ),
  );

  if (result.hasException) {
    setState(() {
      _error = result.exception.toString();
      _loading = false;
    });
    return;
  }

  setState(() {
    _countryData = result.data?['country'];

    print(result.data?['country']);
    _loading = false;
  });
}


Query(
options: QueryOptions(document: gql(query)),
builder: (result, {fetchMore, refetch}) {
if (result.hasException) {
return Center(child: Text('Error: ${result.exception.toString()}'));
}

if (result.isLoading) {
return Center(child: CircularProgressIndicator());
}

final List countries = result.data?['countries'] ?? [];

return ListView.builder(
itemCount: countries.length,
itemBuilder: (context, index) {
final country = countries[index];
return ListTile(
leading: Text(country['emoji'], style: TextStyle(fontSize: 24)),
title: Text(country['name']),
subtitle: Text('Code: ${country['code']}'),
);
},
);
},
)