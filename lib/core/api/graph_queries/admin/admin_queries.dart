class AdminQueries {
  factory AdminQueries() => instance;

  const AdminQueries._();

  static const AdminQueries instance = AdminQueries._();

  Map<String, dynamic> getProductsNumberQuery() {
    return {
      'query': '''
       {
         products {
           title
         }
       }
''',
    };
  }

  Map<String, dynamic> getUsersNumberQuery() {
    return {
      'query': '''
       {
         users {
           name
         }
       }
''',
    };
  }

  Map<String, dynamic> getCategoryNumberQuery() {
    return {
      'query': '''
       {
         categories {
           id
         }
       }
''',
    };
  }
}
