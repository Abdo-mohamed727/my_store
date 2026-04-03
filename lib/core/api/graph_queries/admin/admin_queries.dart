class AdminQueries {
  factory AdminQueries() => instance;

  const AdminQueries._();

  static const AdminQueries instance = AdminQueries._();

  Map<String, dynamic> getProductsNumberQuery() {
    return {
      'query': '''

       {
     Products {
      tiitle
             }  
         }

 
''',
    };
  }

  Map<String, dynamic> getUsersNumberQuery() {
    return {
      'query': '''

       {
     Users {
      name
             }  
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
      name
             }  
         }
         }
''',
    };
  }
}
